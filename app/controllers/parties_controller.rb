require 'google/apis/calendar_v3'
require 'google/api_client/client_secrets.rb'

class PartiesController < ApplicationController
  def new
    movie_data = MovieData.all_data(params[:movie_id])
    @movie = MovieResult.new(movie_data)
  end

  def create
    client = get_google_calendar_client(current_user)

    if params.include?('party_id')
      viewing_party = Party.find_by(id: params[:party_id])

      invitation = Invitation.find_by(id: params[:invitation_id])
      current_user.invitations.delete(invitation)
    else
      year, month, day = params[:start_time].split("-").map(&:to_i)
      hour, minute = params[:start_time].split("T")[1].split(":").map(&:to_i)
      start_time = DateTime.new(year, month, day, hour, minute, 0, "-06:00")
      end_time = start_time + Rational(params[:duration_of_party].to_i, 1440)

      viewing_party = current_user.parties.create(
        movie_title: params[:movie_title],
        duration_of_party: params[:duration_of_party],
        friend_ids: params[:friend_ids],
        start_time: start_time,
        end_time: end_time
      )

      viewing_party[:friend_ids].each do |friend_id|
        friend = User.find(friend_id)
        friend.invitations.create(party_id: viewing_party.id)
      end
    end
    event = get_viewing_party(viewing_party)
    client.insert_event('primary', event)

    flash[:notice] = 'Viewing Party was successfully added to calendar.'
    redirect_to '/dashboard'
  end

  def get_google_calendar_client(current_user)
    client = Google::Apis::CalendarV3::CalendarService.new
    return unless (current_user.present? && current_user.token.present? && current_user.refresh_token.present?)

    secrets = Google::APIClient::ClientSecrets.new({
      'web' => {
        'access_token' => current_user.token,
        'refresh_token' => current_user.refresh_token,
        'client_id' => ENV['GOOGLE_API_KEY'],
        'client_secret' => ENV['GOOGLE_API_SECRET']
      }
    })
    begin
      client.authorization = secrets.to_authorization
      client.authorization.grant_type = 'refresh_token'

      if !current_user.present?
        client.authorization.refresh!
        current_user.update_attributes(
          access_token: client.authorization.token,
          refresh_token: client.authorization.refresh_token,
          expires_at: client.authorization.expires_at.to_i
        )
      end
    rescue => e
      flash[:error] = 'Your token has been expired. Please login again with google.'
      redirect_to :back
    end
    client
  end

  private

  def get_viewing_party(viewing_party)
    start_time = ''
    end_time = ''
    if params.include?('party_id')
      year, month, day = viewing_party.start_time.to_s.split(' ')[0].split('-').map(&:to_i)
      hour, minute = viewing_party.start_time.to_s.split(' ')[1].split(':')[0..1].map(&:to_i)
      start_time = DateTime.new(year, month, day, hour, minute, 0, '00:00')
      end_time = start_time + Rational(viewing_party.duration_of_party.to_i, 1440)
    else
      year, month, day = params[:start_time].split("-").map(&:to_i)
      hour, minute = params[:start_time].split("T")[1].split(":").map(&:to_i)
      start_time = DateTime.new(year, month, day, hour, minute, 0, "-06:00")
      end_time = start_time + Rational(params[:duration_of_party].to_i, 1440)
    end
    event = Google::Apis::CalendarV3::Event.new({
      summary: 'Viewing Party',
      location: 'Your Favorite Streaming Service!',
      description: viewing_party[:movie_title],
      start: {
        date_time: start_time,
        time_zone: 'America/Denver'
      },
      end: {
        date_time: end_time,
        time_zone: 'America/Denver'
      },
      reminders: {
        use_default: false,
        overrides: [
          Google::Apis::CalendarV3::EventReminder.new(reminder_method:'popup', minutes: 10),
          Google::Apis::CalendarV3::EventReminder.new(reminder_method:'email', minutes: 20)
        ]
      },
      notification_settings: {
        notifications: [
                        { type: 'event_creation', method: 'email' },
                        { type: 'event_change', method: 'email' },
                        { type: 'event_cancellation', method: 'email' },
                        { type: 'event_response', method: 'email' }
                       ]
      }, 'primary': true
    })
    event
  end
end

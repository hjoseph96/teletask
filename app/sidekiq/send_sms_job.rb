class SendSmsJob
  include Sidekiq::Job

  def perform(phone_number)
    twilio_sid = Rails.application.credentials.twilio_sid
    twilio_token = Rails.application.credentials.twilio_token
    @client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    @client.messages
           .create(
             body: "Thanks for testing, here's an SMS!",
             from: '+1 (718) 307-2924',
             to: phone_number
           )
  end
end

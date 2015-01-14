class API < Grape::API
  format :json
  formatter :json, Grape::Formatter::Jbuilder

  rescue_from ActiveRecord::RecordInvalid do |e|
    rack_response e.record.errors.messages.to_json, 400
  end

  mount Services::Sensors
  mount Services::Inputs
end
class Services::Inputs < Grape::API
  resources :inputs do

    params do
      requires :state,  type: Integer
    end
    get 'led/:state' do
      action = (params[:state] == 1) ? 'led-on' : 'led-off'
      JSON.parse(RestClient.get("#{ENV['ARDUINO_URL']}/#{action}"))
    end

    get 'led-status' do
      JSON.parse(RestClient.get("#{ENV['ARDUINO_URL']}/led-status"))
    end
  end
end
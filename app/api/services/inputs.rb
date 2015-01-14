class Services::Inputs < Grape::API
  resources :inputs do

    params do
      requires :state,  type: Integer
    end
    get 'led/:state' do
      action = (params[:state] == 1) ? 'led-on' : 'led-off'
      RestClient.get("#{ENV['ARDUINO_URL']}/#{action}").as_json
    end

  end
end
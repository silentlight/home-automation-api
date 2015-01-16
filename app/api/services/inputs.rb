class Services::Inputs < Grape::API
  resources :inputs do

    params do
      options :state,  type: Integer
    end
    get 'led' do
      if params[:state].present?
        action = (params[:state] == 1) ? 'led-on' : 'led-off'
      else
        action = 'led-status'
      end
      JSON.parse(RestClient.get("#{ENV['ARDUINO_URL']}/#{action}"))
    end

  end
end
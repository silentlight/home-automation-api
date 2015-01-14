class Services::Sensors < Grape::API
  resources :sensors do
    params do
      requires :temperature, :humidity, :light_level,  type: String
    end
    post do
      created_at = Time.zone.now()
      Sensor::Temperature.create({ value: params[:temperature], created_at: created_at })
      Sensor::Humidity.create({ value: params[:humidity], created_at: created_at })
      Sensor::LightLevel.create({ value: params[:light_level], created_at: created_at })
      1
    end

    get 'temperature/history' do
      @entries = Sensor::Temperature.all.order('created_at DESC')
    end

    get 'humidity/history' do
      @entries = Sensor::Humidity.all.order('created_at DESC')
    end

    get 'light-level/history' do
      @entries = Sensor::LightLevel.all.order('created_at DESC')
    end

    get 'temperature/now' do
      JSON.parse(RestClient.get("#{ENV['ARDUINO_URL']}/temperature"))
    end

    get 'humidity/now' do
      JSON.parse(RestClient.get("#{ENV['ARDUINO_URL']}/humidity"))
    end

    get 'light-level/now' do
      JSON.parse(RestClient.get("#{ENV['ARDUINO_URL']}/light-level"))
    end
  end
end
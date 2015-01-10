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
  end
end
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '1457341227829570', '0ab29cc2202becd2ea99b1c694f7fe28',{:provider_ignores_state => true} 
    
    provider :twitter, 'lYh7L1TsHhdWgAmevr7HUA', 'Fw1wzICmQ6cGN7it4JZQSWMrjDvGdDS4PXejlkF4fek'

    

end
Rails.application.config.to_prepare do
  Devise::SessionsController.layout "devise"
  Devise::RegistrationsController.layout "devise"
end

Rails.application.routes.draw do
  mount_at = SendgridEvents::Engine.config.mount_at
  match "#{mount_at}receiver" => "sendgrid_events/sendgrid_events#receiver", :via => :post
end

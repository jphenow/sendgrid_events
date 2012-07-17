
  match SendgridEvents::Configure.mount_at => "sendgrid_events/sendgrid_events#receiver", :via => :post

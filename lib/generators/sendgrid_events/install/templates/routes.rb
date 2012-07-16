
  match "#{SendgridEvents::Configure.mount_at}receiver" => "sendgrid_events/sendgrid_events#receiver", :via => :post

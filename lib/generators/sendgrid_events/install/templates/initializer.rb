SendgridEvents::Configure.config do
  handle %w[processed deferred delivered open click bounce dropped spamreport unsubscribe]
  receive = true
  mount_at = "/sendgrid_events/"
end

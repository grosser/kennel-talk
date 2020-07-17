Kennel::Models::Monitor.prepend(Module.new do
  def validate_json(data)
    super
    message = data.fetch(:message)
    return if !message.include?("@pagerduty")
    data[:name] += "📟" # mark them consistently
    return if message.include?("Runbook: ")
    invalid! "message must include a Runbook"
  end
end)

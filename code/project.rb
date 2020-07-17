class Foo < Kennel::Models::Project
  defaults(
    tags: -> { ["priority:high"] + super() },
    team: -> { Teams::Bar.new },
    parts: -> {
      [
        Monitors::NotReady.new(self),
        Monitors::KubernetesCpuOverRequest.new(self),
      ]
    }
  )
end

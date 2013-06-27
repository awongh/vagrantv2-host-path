module HostPath
  module Vagrant
    TESTED_CONSTRAINT="<= 1.2.1"
    class Plugin < ::Vagrant.plugin("2")

      name "HostPath"
      description <<-DESC
      pass a filepath from the host to the vm and back
      DESC

      config( :hostpath ) do
        require_relative "config"
        Config
      end

      action_hook(:hostpath, :machine_action_up) do |hook|
        hook.append(Env)
      end

      action_hook(:hostpath, :machine_action_reload) do |hook|
        hook.append(Env)
      end

    end
  end
end

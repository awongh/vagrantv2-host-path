begin
  require 'vagrant'
rescue LoadError
  raise 'The Vagrant Host Path plugin must be run within Vagrant.'
end

#require 'vagrant-host-path'
#require 'vagrant-host-path/vagrant'

module HostPath
  module Vagrant
    autoload :Config, 'vagrant-host-path/config'
    autoload :Env, 'vagrant-host-path/env'
    #autoload :Env, 'berkshelf/vagrant/env'
    #autoload :EnvHelpers, 'berkshelf/vagrant/env_helpers'
  end
end

require 'vagrant-host-path/plugin'

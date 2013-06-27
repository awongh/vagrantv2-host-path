module HostPath
  module Vagrant
    class Config < ::Vagrant.plugin("2", :config)

      attr_writer :env_key
      attr_writer :path_file
      attr_writer :profile_path
      attr_writer :temp_upload_path

      def initialize
        super
        @env_key = UNSET_VALUE
        @profile_path = UNSET_VALUE
        @path_file = UNSET_VALUE
        @temp_upload_path = UNSET_VALUE
        #@enabled        = File.exist?(@berksfile_path)

      end

      def finalize!
        @env_key || "VAGRANT_HOST_PATH"
        @path_file || "/tmp/.vagrant-host-path"
        @profile_path || "/etc/profile.d/vagrant-host-path.sh"
        @temp_upload_path || "/tmp/vagrant-host-path-profile.sh"
      end

    end
  end
end

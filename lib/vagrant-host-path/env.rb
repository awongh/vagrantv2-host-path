module HostPath
  module Vagrant
    # Environment data to build up and persist through the middleware chain
    class Env
      def initialize(app, env)
        @app = app
        @config = HostPath::Vagrant::Config

      end

      def call(env)
        @machine = env[:machine]

        setup @machine if @machine.state == :running
        #setup @machine 
        setup 
        @app.call(env[:machine])
      end

      protected

      def setup
        put_path_file
        put_profile_file
        @machine.ui.success "Host Path set!"
      end

      def put_path_file
        cdw = @machine.env.cwd.to_s
        comm = "echo \"#{cdw}\" > \"#{@machine.config.hostpath.path_file}\""
        @machine.ui.success "put_path_file - host path command: #{comm}" 
        @machine.communicate.sudo( comm )
      end

      def put_profile_file

        content = profile_file(@machine.config.hostpath)
        comm = "echo \"#{content.gsub(/["`\\]/, '\\\\\0')}\" > \"#{@machine.config.hostpath.profile_path}\""
        @machine.ui.success "put_profile_file - host path command: #{comm}" 
        @machine.communicate.sudo( comm )
      end

      def profile_file(config)
        "[ -f \"#{config.path_file}\" ] && export #{config.env_key}=\`cat \"#{config.path_file}\"\`"
      end

    end
  end
end





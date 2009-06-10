module ActiveRecord::FTPShuttle

  require "net/ftp"
  
  def self.included(base)
    base.extend ActMethods
  end

  module ActMethods

    def acts_as_ftp_shuttle
      extend ClassMethods
      include InstanceMethods
    end

  end

  module ClassMethods

    def get
      
    end

    def get_glob
      
    end

    def config
      if @config
        @config
      else
        @config = YAML.load_file(RAILS_ROOT + "/config/ftp_shuttle.yml")
      end
    end

  end

  module InstanceMethods
  end

end



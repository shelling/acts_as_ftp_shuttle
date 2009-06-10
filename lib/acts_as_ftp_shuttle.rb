module ActiveRecord::FTPShuttle

  def self.included(base)
    base.extend ActMethods
  end

  module ActMethods

    def acts_as_ftp_shuttle
      extend ClassMethods
      include InstanceMethods
      # class_variable_set(:@@config, {})
    end

  end

  module ClassMethods

    @@config = {}
    @@site = ""
    
    def get(filename, options = {})
      @@site = options[:site]
      setting = self.config[@@site]
      Net::FTP.open(setting["host"], setting["user"], setting["pass"]) do |ftp|
        ftp.get(filename, self.local_filename(filename))
        self.create({
          :filename   => File.basename(filename),
        })
      end
    end

    def get_glob
      
    end

    def local_filename(remote_filename)
      RAILS_ROOT + "/" + @@config[@@site]["local_dir"] + "/" + File.basename(remote_filename)
    end

    def config
      if @@config.length > 0
        @@config
      else
        @@config = YAML.load_file(RAILS_ROOT + "/config/ftp_shuttle.yml")
      end
    end

  end

  module InstanceMethods

    def public_filename
      self.class.config[@@site]["load_file"] + filename
    end

  end

end



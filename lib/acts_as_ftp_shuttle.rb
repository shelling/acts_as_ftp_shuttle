module ActiveRecord::FTPShuttle
  
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

  end

  module InstanceMethods
  end

end



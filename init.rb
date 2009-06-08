$:.unshift File.dirname(__FILE__) + "/lib"

require "acts_as_ftp_shuttle"

ActiveRecord::Base.send :include, ActiveRecord::FTPShuttle

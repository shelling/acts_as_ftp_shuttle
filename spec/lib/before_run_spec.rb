$:.unshift File.dirname(__FILE__) + "/../../lib"

require "ptools"
require "active_record"

require "acts_as_ftp_shuttle"

require "pdf_model"
require "create_pdf_models"

ActiveRecord::Base.send :include, ActiveRecord::FTPShuttle

dbfile = File.dirname(__FILE__) + "/../tempdb.sqlite3"

unless File.exist?(dbfile)
  File.touch dbfile 
  ActiveRecord::Base.establish_connection({
    :adapter  => "sqlite3",
    :database => dbfile,
  })
  CreatePDFModels.up
else
  ActiveRecord::Base.establish_connection({
    :adapter  => "sqlite3",
    :database => dbfile,
  })
end

$:.unshift File.dirname(__FILE__) + "/lib"
$:.unshift File.dirname(__FILE__) + "/../lib"

require "ptools"
require "active_record"
require "acts_as_ftp_shuttle"
require "pdf_model"
require "create_pdf_models"

ActiveRecord::Base.send :include, ActiveRecord::FTPShuttle

dbfile = File.dirname(__FILE__) + "/tempdb.sqlite3"

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

describe PDFModel do
  
  before :all do
    @pdf_model = PDFModel.new
  end

  it "should be able to act as ftp shuttle" do
    PDFModel.methods.include?("acts_as_ftp_shuttle") == true
  end

  it "should not have specified methods before mixing" do
    PDFModel.methods.include?("get_glob").should == false
  end

  it "should have specified methods after mixing" do
    PDFModel.send :acts_as_ftp_shuttle
    pdf_model_methods = PDFModel.methods
    ["get_glob","get"].each do |method|
      pdf_model_methods.include?(method).should == true
    end
  end

  it "should add item into database after getting file"

  it "should purge file and record in database if error raised in workflow"

  it "should ..."

end

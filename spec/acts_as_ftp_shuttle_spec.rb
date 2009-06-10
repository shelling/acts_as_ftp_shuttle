$:.unshift File.dirname(__FILE__) + "/lib"
require "before_run_spec"

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

  it "should load config from RAILS_ROOT/config/ftp_shuttle.yml" do
    RAILS_ROOT = File.dirname(__FILE__)
    config = PDFModel.config
    config.should have_key("kernel")
    config["kernel"]["host"].should == "ftp.kernel.org"
  end

  it "should add item into database after getting file" do
    PDFModel.get("pub/README", :site => "kernel")
    PDFModel.last.filename.should == "README"
  end

  it "should have public filename"

  it "should get files specified by glob"

  it "should purge file and record in database if error raised in workflow"


end

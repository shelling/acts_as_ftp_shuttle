require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/clean'

desc 'Default: run unit tests.'
task :default => :test

CLEAN.include [
  "spec/tempdb.sqlite3",
  "spec/public/files/*",
]

desc 'Test the acts_as_ftp_shuttle plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the acts_as_ftp_shuttle plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ActsAsFtpShuttle'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc "Run Rspec test"
task :spec => [:clean] do
  Dir.glob("spec/*.rb").each do |spec|
    sh "spec #{spec}"
  end
end


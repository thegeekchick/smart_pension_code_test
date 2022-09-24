require "log_parser/version"
require "log_parser/log_file_reader"
module LogParser
 class LogFileReader
   def initialize(file)
     raise ArgumentError, 'File empty' if file.nil?
     raise ArgumentError, 'File does not exist' unless File.exist?(file)
     @file = File.expand_path("../#{file}", __FILE__)
   end
   private
   attr_accessor :file

  end
 end


require "log_parser/version"
module LogParser
 class LogFileReader
   def initialize(file)
     raise ArgumentError, 'File empty' if file.nil?
     raise ArgumentError, 'File does not exist' unless File.exist?(file)
     self.file = File.expand_path("../#{file}", __FILE__)
   end
   end
 end


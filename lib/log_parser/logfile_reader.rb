module LogParser
  class LogfileReader
    def initialize(file)
      raise ArgumentError, 'File Empty' if file.nil?
      raise ArgumentError, 'File does not exist' unless File.exist?(file)
      @file = file
    end
#  private
 #   attr_accessor :file

  def lines
    File.open(@file, "r") do |f|
    f.each.map(&:chomp)
    end
  end
  end
end 

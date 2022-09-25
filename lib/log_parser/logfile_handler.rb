module LogParser
  class LogfileHandler
    def initialize(lines)
      @lines = lines
    end

    def split_file_entries
      @lines.map do |line|
        LogfileMeta.new(*line.split)
      end
    end
  end
end


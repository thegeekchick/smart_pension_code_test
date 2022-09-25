module LogParser
  class LogfileHandler
    attr_accessor :total, :unique, :ips
    def initialize(lines)
      @lines = lines
      @total = 0
      @unique = 0
      @ips = {}
    end

    def split_file_entries
      @lines.map do |line|
        LogfileMeta.new(*line.split)
      end
    end

    def populate_visits_unique_hash(entry)
      self.total +=1
      unless ips[entry.ip]
        self.unique += 1
        self.ips[entry.ip] = true
      end
    end

  end
end


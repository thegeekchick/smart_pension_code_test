module LogParser
  class MetaCollection
    attr_accessor :total, :unique, :ips

    def initialize
      @total = 0
      @unique = 0
      @ips = {}
    end
    
    def add(entry)
      self.total +=1
       unless ips[entry.ip]
      self.unique += 1
      self.ips[entry.ip] = true
    end
    end
  end
end


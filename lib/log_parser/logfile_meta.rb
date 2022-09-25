module LogParser
  class LogfileMeta
    attr_accessor :path
    attr_accessor :ip

    def initialize(path, ip)
      @path = path
      @ip = ip
    end
  end
end

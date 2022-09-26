module LogParser
  class Parser
    def initialize(filepath)
      @filepath = filepath
    end

    def format
      Formatter.new(aggregated_data).format
    end

    
    private

    def read_data
      LogfileReader.new(@filepath).lines
    end

    def aggregated_data
      LogfileHandler.new(read_data).aggregate
    end

  end
end



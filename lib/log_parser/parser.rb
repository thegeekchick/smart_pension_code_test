module LogParser
  class Parser
    def initialize(filepath)
      @filepath = filepath
    end

    def format
      Formatter.new(sorted_data).format
    end

    
    private

    def read_data
      LogfileReader.new(@filepath).lines
    end

    def sorted_data
      LogfileHandler.new(read_data).meta_sort
    end

  end
end



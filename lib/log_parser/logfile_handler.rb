module LogParser
  class LogfileHandler
    attr_accessor :total, :unique, :ips
    def initialize(lines)
      @lines = lines
    end

        #aggregator logic
    def aggregate
      entries = split_file_entries
      entries.each_with_object(AggregatorResult.new) do |entry, collection|
        collection[entry.path] ||= Accumulator.new
        collection[entry.path].add(entry)
    end
   end

    #tokenizer logic
    def split_file_entries
      @lines.map do |line|
        LogfileMeta.new(*line.split)
      end
    end
  end
end




module LogParser
  class LogfileHandler
    attr_accessor :total, :unique, :ips
    def initialize(lines)
      @lines = lines
    end

        #aggregator logic
    def meta_sort
      entries = split_file_entries
      entries.each_with_object(Resultset.new) do |entry, collection|
        collection[entry.path] ||= MetaCollection.new
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




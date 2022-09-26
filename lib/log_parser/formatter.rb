module LogParser
  class Formatter
    def initialize(aggregator_result)
      @aggregator_result = aggregator_result
    end

    def format
      puts "Pages sorted by number of views"
      puts "*******************************"
      puts  "#{total_views}"

      puts "**********************************************************************"

      puts "Pages sorted by number of unique views"
      puts "*************************************"
      puts  "#{unique_views}"
    end

    private

    def total_views
      @aggregator_result.sort_by_total.map do |path, accumulator|
        "#{path} #{accumulator.total} visits"
      end.join("\n")
    end

    def unique_views
      @aggregator_result.sort_by_unique.map do |path, accumulator|
        "#{path} #{accumulator.unique} unique visits"
      end.join("\n")
    end
  end
end

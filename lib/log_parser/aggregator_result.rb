module LogParser
  class AggregatorResult < Hash
    def sort_by_total 
      #sort by desc of total viws
      sort_by { |_, views| -views.total }
    end
    
    def sort_by_unique
      #sort by desc of unique views
      sort_by { |_, views| -views.unique }
    end
  end
end



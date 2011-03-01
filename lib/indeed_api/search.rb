module IndeedAPI

  class Search

    attr_reader :query, :location, :dupe_filter, :highlight, :total_results,
      :start, :end, :radius, :page_number, :results

    def initialize(data = {})
      @query = data['query']
      @location = data['location']
      @dupe_filter = data['dupefilter'] == 'true'
      @highlight = data['highlight'] == 'true'
      @total_results = data['totalresults'].to_i
      @start = data['start'].to_i
      @end = data['end'].to_i
      @radius = data['radius'].to_i
      @page_number = data['pageNumber'].to_i
      # Load the actual results
      @results = []
      if results = data['results']
        if results = results['result']
          if results.is_a?(Hash)
            @results << IndeedAPI::Job.new(results)
          else
            @results = results.map { |jd| IndeedAPI::Job.new(jd) }
          end
        end
      end
    end

  end

end 

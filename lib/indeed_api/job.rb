module IndeedAPI

  class Job

    attr_reader :job_title, :company, :city, :state, :country, :formatted_location,
      :source, :date, :snippet, :url, :latitude, :longitude, :job_key, :sponsored,
      :expired, :formatted_location_full, :formatted_relative_time, :onmousedown

    def initialize(data = {})
      @job_title = data['jobtitle']
      @company = data['company']
      @city = data['city']
      @state = data['state']
      @country = data['country']
      @formatted_location = data['formattedLocation']
      @source = data['source']
      @date = data['date'] ? Time.parse(data['date']) : nil
      @snippet = data['snippet']
      @url = data['url']
      @onmousedown = data['onmousedown']
      @latitude = data['latitude'] ? data['latitude'].to_f : nil
      @longitude = data['longitude'] ? data['longitude'].to_f : nil
      @job_key = data['jobkey']
      @sponsored = data['sponsored'] == 'true'
      @expired = data['expired'] == 'true'
      @formatted_location_full = data['formattedLocationFull']
      @formatted_relative_time = data['formattedRelativeTime']
    end

  end

end

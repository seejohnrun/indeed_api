require 'bundler/setup'
require 'httparty'

module IndeedAPI

  autoload :IndeedError, File.dirname(__FILE__) + '/indeed_api/indeed_error'
  autoload :Job, File.dirname(__FILE__) + '/indeed_api/job'

  API_VERSION = 2

  include HTTParty
  base_uri 'http://api.indeed.com/ads'

  # set your publisher ID - required
  def self.publisher_id=(id)
    @publisher_id = id
  end

  # get the publisher ID currently in use
  def self.publisher_id
    @publisher_id
  end

  # Search the API 
  # Can specify options at https://ads.indeed.com/jobroll/xmlfeed
  def self.search_jobs(options = {})
    options.merge!(:publisher => self.publisher_id, :v => API_VERSION)
    response = get('/apisearch', :query => options)
    handle_errors(response)

    return [] unless results = response['response']
    return [] unless results = results['results']
    return [] unless results = results['result']
    results.is_a?(Hash) ? [IndeedAPI::Job.new(results)] : results.map { |jd| IndeedAPI::Job.new(jd) }
  end

  # Get an individual job - for convenience
  def self.get_job(id)
    jobs = get_jobs([id])
    jobs.empty? ? nil : jobs.first
  end

  # Get a bunch of jobs at once
  def self.get_jobs(*ids)
    options = { :publisher => self.publisher_id, :jobkeys => ids.join(','), :v => API_VERSION }
    response = get('/apigetjobs', :query => options)
    handle_errors(response)

    return [] unless results = response['response']
    return [] unless results = results['results']
    return [] unless results = results['result']
    results.is_a?(Hash) ? [IndeedAPI::Job.new(results)] : results.map { |jd| IndeedAPI::Job.new(jd) }
  end

  private

  # Throw errors if the response contains an error
  def self.handle_errors(response)
    error = response['response']['error']
    raise Indeed::IndeedError.new(error) if error
  end


end

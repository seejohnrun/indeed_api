require 'spec/spec_helper'

describe IndeedAPI do

  before(:all) do
    IndeedAPI.publisher_id = '4585765116865536'
  end

  before(:all) do
    @job = IndeedAPI.get_job('039f3dbe2de81bfd')
  end

  it 'should be able to get a job using the multiple call' do
    jobs = IndeedAPI.get_jobs('039f3dbe2de81bfd')
    jobs.count.should be > 0
    jobs.each { |j| j.should be_a(IndeedAPI::Job) }
  end

  it 'should be able to get a job using the single call' do
    job = IndeedAPI.get_job('039f3dbe2de81bfd')
    job.should be_a(IndeedAPI::Job)
  end

  it 'should be able to search for jobs' do
    jobs = IndeedAPI.search_jobs(:q => 'software engineer')
    jobs.size.should be > 0
    jobs.each { |j| j.should be_a(IndeedAPI::Job) }
  end

  it 'should be able to access fields on jobs' do
    lambda do
      @job.job_title
      @job.date
      @job.snippet
    end.should_not raise_error
  end

  it 'should change booleans into booleans' do
    [true, false].include?(@job.expired).should be_true
  end

  it 'should change date into a time object' do
    @job.date.should be_a(Time)
  end

  it 'should raise errors on fields that do not exist' do
    lambda do
      @job.fake_field
    end.should raise_error
  end

end

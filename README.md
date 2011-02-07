# Indeed API

Simple Ruby wrapper for the Indeed jobs API.

---

## Usage

Set your publisher ID:

    IndeedAPI.publisher_id = 'xxx'

Search Jobs (use any search options from https://ads.indeed.com/jobroll/xmlfeed)

    jobs = IndeedAPI.search_jobs(:q => 'software engineer')
    jobs.each { |j| j.job_title }

Or get jobs by id:

    jobs = IndeedAPI.get_jobs(id1, id2 ...)
    job = IndeedAPI.get_job(id)

# Indeed API

Simple Ruby wrapper for the Indeed jobs API.

---

## Installation

If you're using bundler:

    gem 'indeed_api'

And if you're not -- 

    $ gem install indeed_api

## Usage

Set your publisher ID:

    IndeedAPI.publisher_id = 'xxx'

Search Jobs (use any search options from https://ads.indeed.com/jobroll/xmlfeed)

    jobs = IndeedAPI.search_jobs(:q => 'software engineer')
    jobs.each { |j| j.job_title }

Or get jobs by id:

    jobs = IndeedAPI.get_jobs(id1, id2 ...)
    job = IndeedAPI.get_job(id)

## License

(The MIT License)

Copyright © 2011 John Crepezzi

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

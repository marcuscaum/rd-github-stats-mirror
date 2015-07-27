module RDGithubStats
  class Repo
    attr_accessor :name

    TIME_WINDOW = 1.week.ago

    def initialize(name)
      @name = name
      @client = Octokit.client
    end

    def pull_requests(state: 'open')
      @client.pull_requests @name, state: state
    end

    def issues(state: 'open', since: TIME_WINDOW, filter_prs: true)
      issues = @client.issues @name, state: state, since: since
      return issues unless filter_prs
      issues.select { |i| !i.respond_to? :pull_request }
    end

    def pr_through_issues(state: 'open', since: TIME_WINDOW)
      issues = @client.issues @name, state: state, since: since
      issues.select { |i| i.respond_to? :pull_request }
    end
  end
end
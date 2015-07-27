module RDGithubStats
  class Issue
    attr_accessor :repo_name, :number

    def initialize(repo_name, number)
      @repo_name = repo_name
      @number = number
      @client = Octokit.client
    end

    def fetch
      @issue ||= @client.issue @repo_name, @number
    end

    # Comments added in the issue thread
    def comments
      @comments ||= @client.issue_comments @repo_name, @number
    end

    def labels
      @labels ||= fetch.labels
    end

    def self.count_comments(issues)
      issues.map { |i| {i.number => i.comments} }
    end
  end
end
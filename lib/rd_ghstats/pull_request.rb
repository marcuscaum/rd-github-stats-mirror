class PullRequest
  attr_accessor :repo_name, :number

  def initialize(repo_name, number)
    @repo_name = repo_name
    @number = number
    @client = Octokit.client
  end

  def fetch
    @pull_request ||= @client.pull_request @repo_name, @number
  end

  # Comments added inside code diff
  def comments
    @comments ||= @client.pull_comments @repo_name, @number
  end

  # Comments added in the issue thread
  def issue_comments
    @issue_comments ||= issue.comments
  end

  def unified_comments
    comments + issue_comments
  end

  def count_all_comments
    fetch.comments + issue.fetch.comments
  end

  def issue
    @issue ||= Issue.new @repo_name, @number
  end

  def commits
    @commits ||= @client.pull_commits @repo_name, @number
  end

  def count_commits
    fetch.commits
  end

  def labels
    @labels ||= issue.fetch.labels
  end
end

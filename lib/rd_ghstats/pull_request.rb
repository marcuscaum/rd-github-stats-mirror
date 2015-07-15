class PullRequest

  def initialize(repo_name, number)
    @repo_name = repo_name
    @number = number
    @client = Octokit.client
  end

  def fetch
    @pull_request ||= @client.pull_request @repo_name, @number
  end

  def self.count_by_state(prs)
    ReportHelper.count(prs) { |pr| pr.state }
  end

  def self.count_by_user(prs)
    ReportHelper.count(prs) { |pr| pr.user.login }
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
    Issue.new @repo_name, @number
  end

  def self.count_all_comments(prs)
    prs.map do |pr|
      pr_obj = PullRequest.new(pr.head.repo.full_name, pr.number)
      { pr.number => pr_obj.count_all_comments }
    end
  end

  def commits
    @commits ||= @client.pull_commits @repo_name, @number
  end
end

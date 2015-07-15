class PullRequest

  def initialize(repo_name, number)
    @repo_name = repo_name
    @number = number
    @repo = Repo.new repo_name
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
    @issue_comments ||= Issue.new(@repo_name, @number).comments
  end

  def unified_comments
    comments + issue_comments
  end

  def commits
    @commits ||= @client.pull_commits @repo_name, @number
  end
end

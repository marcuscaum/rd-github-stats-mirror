class PullRequest

  def initialize(repo_name, number)
    @repo_name = repo_name
    @number = number
    @repo = Repo.new repo_name
    @client = Octokit.client
  end

  def self.count_by_state(prs)
    ReportHelper.count(prs) { |pr| pr.state }
  end

  def self.count_by_user(prs)
    ReportHelper.count(prs) { |pr| pr.user.login }
  end

  def comments
    @client.pull_comments @repo_name, @number
  end
end

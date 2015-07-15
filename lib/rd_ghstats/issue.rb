class Issue

  def initialize(repo_name, number)
    @repo_name = repo_name
    @repo = Repo.new repo_name
    @number = number
    @client = Octokit.client
  end

  def fetch
    @issue ||= @client.issue @repo_name, @number
  end

  def comments
    @client.issue_comments @repo_name, @number
  end

  def self.count_comments(issues)
    issues.map { |i| {i.number => i.comments} }
  end
end

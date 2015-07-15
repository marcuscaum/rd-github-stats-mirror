class Repo

  TIME_WINDOW = 1.week.ago

  def initialize(repo)
    @repo = repo
    @client = Octokit.client
  end

  def pull_requests(state: 'open')
    @client.pull_requests @repo, state: state
  end

  def issues(state: 'open', since: TIME_WINDOW)
    @client.issues @repo, state: state, since: since
  end
end

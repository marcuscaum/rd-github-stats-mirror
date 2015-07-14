class PullRequests

  PAGE_SIZE = 100
  TIME_WINDOW = 1.month.ago

  def initialize(repo, state: 'open')
    @repo = repo
    @state = state
    @github = Github::Client::PullRequests.new repo: repo
  end

  def fetch(page: 1, per_page: PAGE_SIZE)
    @github.list(state: @state, page: page, per_page: per_page)
  end

  def fetch_since(date)
    page = 1
    prs = []
    loop do
      fetched = fetch(page: page)
      fetched.each do |pr|
        return prs if pr.updated_at < date || fetched.size <= 0
        prs << pr
      end
      page += 1
    end
    prs
  end

  # Examples
  #   PullRequests.new('rdstation', state: 'all').count { |pr| pr.state }
  #   PullRequests.new('rdstation', state: 'open').count { |pr| pr.user.login }
  def count(since = TIME_WINDOW)
    return fetch_since(since).size unless block_given?

    fetch_since(since).each_with_object({}) do |pr, h|
      group_key = yield pr
      h[group_key] = h.fetch(group_key, 0) + 1
    end
  end
end

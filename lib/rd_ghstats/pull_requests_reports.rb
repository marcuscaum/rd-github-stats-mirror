class PullRequestsReports

  def initialize(prs)
    @prs = prs
  end

  def count_all_comments
    @prs.map do |request|
      pr = pr(request)
      { pr.number => pr.count_all_comments }
    end
  end

  def count_by_state
    ReportHelper.count(@prs) { |pr| pr.state }
  end

  def count_by_user
    ReportHelper.count(@prs) { |pr| pr.user.login }
  end

  def measure_size
    @prs.map do |request|
      pr = pr(request)
      { pr.number => pr.count_commits }
    end
  end

  private

  def pr(request)
    PullRequest.new repo_name(request), request.number
  end

  def repo_name(request)
    request.head.repo.full_name
  end
end

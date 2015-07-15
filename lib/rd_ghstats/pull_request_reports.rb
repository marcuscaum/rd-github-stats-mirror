class PullRequestReports

  def initialize(prs)
    @prs = prs
  end

  def count_all_comments
    @prs.map do |pr|
      pr_obj = PullRequest.new(pr.head.repo.full_name, pr.number)
      { pr.number => pr_obj.count_all_comments }
    end
  end

  def count_by_state
    ReportHelper.count(@prs) { |pr| pr.state }
  end

  def count_by_user
    ReportHelper.count(@prs) { |pr| pr.user.login }
  end
end

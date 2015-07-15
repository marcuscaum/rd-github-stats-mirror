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

  def count_by_team(team = nil)
    return @prs.count { |pr| team.include? pr.user.login } unless team.nil?

    teams = Team.all
    @prs.each_with_object({}) do |request, counts|
      if (team = Team.find(teams, request.user.login))
        counts[team.name] = counts.fetch(team.name, 0) + 1
      else
        puts "#{request.user.login} not inserted in any team."
      end
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

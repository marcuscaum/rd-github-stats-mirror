class PullRequestsStats

  def initialize(prs)
    @prs = prs
  end

  # Count all comments grouping by PR.
  # It considers unified comments: added in the diffs (PR) and in the thread.
  def count_all_comments
    @prs.each_with_object({}) do |request, h|
      pr = pr(request)
      h[pr.number] = pr.count_all_comments
    end
  end

  # Groups by state (open, closed)
  def count_by_state
    ReportHelper.count(@prs) { |pr| pr.state }
  end

  # Groups by user
  def count_by_user(user = nil)
    ReportHelper.count(@prs, user) { |pr| pr.user.login }
  end

  # Number of commits grouped by PR
  def size
    @prs.each_with_object({}) do |request, h|
      pr = pr(request)
      h[pr.number] = pr.count_commits
    end
  end

  # Groups by team
  def count_by_team(team = nil)
    return @prs.count { |pr| team.include? pr.user.login } unless team.nil?

    teams = Team.all
    ReportHelper.count(@prs) do |request|
      team = Team.find(teams, request.user.login)
      puts "WARN: #{request.user.login} not inserted in any team." if team.nil?
      team.nil? ? 'Others' : team.name
    end
  end

  def collaborations(user)
    @prs.to_a.inject(0) do |sum, request|
      if request.user.login != user
        comments = pr(request).unified_comments
        sum += comments.count { |comment| comment.user.login == user }
      end
    end
  end

  # Durations in seconds
  def duration
    @prs.each_with_object({}) do |request, h|
      unless request.closed_at.nil?
        h[request.number] = request.closed_at - request.created_at
      end
    end
  end

  def avg_duration
    dur = duration
    dur.values.inject(:+) / dur.size
  end

  private

    def pr(request)
      PullRequest.new repo_name(request), request.number
    end

    def repo_name(request)
      request.head.repo.full_name
    end
end

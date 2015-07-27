module RDGithubStats
  class UserPullRequestsStats

    def initialize(user, prs)
      @user = user
      @prs = prs
      @user_prs = prs.select { |pr| pr.user.login == user }
    end

    def count_all_comments
      PullRequestsStats.new(@user_prs).count_all_comments
    end

    def duration
      PullRequestsStats.new(@user_prs).duration
    end

    def avg_duration
      PullRequestsStats.new(@user_prs).avg_duration
    end

    def collaborations
      PullRequestsStats.new(@prs).collaborations(@user)
    end

    def size
      PullRequestsStats.new(@user_prs).size
    end
  end
end
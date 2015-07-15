module ReportHelper

  # Examples
  #   # Count of PRs grouped by state
  #   ReportHelper.count(pull_requests).count { |pr| pr.state }
  #   => { 'open' => 16, 'closed' => 42 }
  #
  #   # Count of PRs grouped by user
  #   ReportHelper.count(pull_requests).count { |pr| pr.user.login }
  #   => { 'user1' => 1, 'user2' => 4, 'user3' => 2 }
  def self.count(collection)
    return collection.size unless block_given?

    collection.each_with_object({}) do |el_key, counts|
      group_key = yield el_key
      counts[group_key] = counts.fetch(group_key, 0) + 1
    end
  end
end

module ReportHelper

  # Examples
  #   # Count of PRs grouped by state
  #   ReportHelper.count(pull_requests).count { |pr| pr.state }
  #   => { 'open' => 16, 'closed' => 42 }
  #
  #   # Count of PRs grouped by user
  #   ReportHelper.count(pull_requests).count { |pr| pr.user.login }
  #   => { 'user1' => 1, 'user2' => 4, 'user3' => 2 }
  #
  #   # Count specific user PRs
  #   ReportHelper.count(pull_requests, 'user2') { |pr| pr.user.login }
  #   => 4
  def self.count(collection, key = nil)
    return collection.size unless block_given?
    return collection.count { |el| key == yield(el) } unless key.nil?

    collection.each_with_object({}) do |el_key, counts|
      group_key = yield el_key
      counts[group_key] = counts.fetch(group_key, 0) + 1
    end
  end
end

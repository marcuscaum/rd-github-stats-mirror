RD Github Stats
===============

Simple stats for your beautiful :sparkles: Github repositories.

### Building it

```shell
$ gem build rd-github-stats.gemspec
...
$ gem install ./rd-github-stats-0.0.0.gem
Successfully installed rd-github-stats-0.0.0
1 gem installed
```

### Usage

First, you need to setup some environment vars! `GITHUB_USER` and `GITHUB_TOKEN`.
But if you prefer you can use Octokit configuration:

```ruby
Octokit.configure do |c|
  c.login = 'your_github_login'
  c.password = 'your_github_token'
end
```

Next, some examples for you!

```ruby
repo = Repo.new('ResultadosDigitais/rdstation')

open_prs = repo.pull_requests
closed_prs = repo.pull_requests(state: 'closed')

open_issues = repo.issues(since: 1.week.ago)
all_issues = repo.issues(state: 'all', since: 1.week.ago)

# Some PR stats
pr_stats = PullRequestsStats.new open_prs

# Number of comments by PR
pr_stats.count_all_comments

# Count PRs grouping by state (open, closed)
pr_stats.count_by_state

# Count PRs grouping by user
pr_stats.count_by_user

# Size of the PR (by commits)
pr_stats.measure_size

# Count PRs grouping by team
pr_stats.count_by_team
```

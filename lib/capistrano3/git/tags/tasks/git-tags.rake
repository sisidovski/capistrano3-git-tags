namespace :load do
  task :defaults do
    set :git_user, `git config --get user.name`.strip unless fetch(:git_user)
    set :git_email, `git config --get user.email`.strip unless fetch(:git_email)
  end
end

namespace :deploy do
  desc 'Create git tag'
  task :git_tag do
    run_locally do
      if fetch(:production_only, false) && fetch(:stage) != 'production'.to_sym
        info "[git-tags] Skipped create tagging because production only"
      else
        tag_name = "#{fetch(:tag_name, 'release')}_at_#{release_timestamp}"
        remote = fetch(:git_remote_name, 'origin')
        strategy.git "tag #{tag_name}"
        strategy.git "push #{remote} --tag"
        info "[git-tags] Created git tag '#{tag_name}', and pushed to #{remote}"
      end
    end
  end

  after :cleanup, 'deploy:git_tag'
end

# config valid for current version and patch releases of Capistrano
lock "~> 3.17.3"

set :application, "dut"
set :repo_url, "git@github.com:dcquan97/dut.git"
set :user,            'dcqbean'
set :puma_threads,    [4, 16]
set :puma_workers,    0
# set :rvm_type, :user
set :rvm_bin_path, "~/.rvm/bin"

set :pty,             true
set :use_sudo,        false
set :linked_files, %w(config/database.yml config/application.yml)
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads)
set :keep_releases, 3
set :shared_path, '/deploy/dut/shared'
append :rvm_map_bins, 'puma', 'pumactl'
set :puma_bind,       "unix://home/dcqbean/deploy/apps/dut/shared/tmp/sockets/puma.sock"
set :puma_state,      "home/dcqbean/deploy/apps/dut/shared/tmp/pids/puma.state"
set :puma_pid,        "home/dcqbean/deploy/apps/dut/shared/tmp/pids/puma.pid"
set :puma_access_log, "home/dcqbean/deploy/apps/dut/shared/log/puma.error.log"
set :puma_error_log,  "home/dcqbean/deploy/apps/dut/shared/log/puma.access.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true

# Skip migration if files in db/migrate were not modified
# Defaults to false
set :conditionally_migrate, true
set :migration_role, :db

# Defaults to the primary :db server
set :migration_servers, -> { primary(fetch(:migration_role)) }

# Defaults to `db:migrate`
set :migration_command, 'db:migrate'


# ================================================
# ============ From Custom Rake Tasks ============
# ================================================
# ===== See Inside: lib/capistrano/tasks =========
# ================================================
namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir home/dcqbean/deploy/apps/dut/shared/tmp/sockets -p"
      execute "mkdir home/dcqbean/deploy/apps/dut/shared/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/main`
        puts "WARNING: HEAD is not the same as origin/main"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  # after  :finishing,    :restart
end

# ps aux | grep puma    # Get puma pid
# kill -s SIGUSR2 pid   # Restart puma
# kill -s SIGTERM pid   # Stop puma
# namespace :database do
#   desc "Run seed"
#   task :seed do
#     on roles(:all) do
#       within current_path do
#         execute :bundle, :exec, 'rails', 'db:seed', 'RAILS_ENV=production'
#       end
#     end
#   end
# end
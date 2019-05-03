require 'figaro_secrets/tasks'

namespace :figaro_secrets do
  task :list, [:environment] do |t, args|
    FigaroSecrets::Tasks.list(**args)
  end

  task :secrets, [:environment] do |t, args|
    FigaroSecrets::Tasks.secrets(**args)
  end
end

task figaro_secrets: "figaro_secrets:list"

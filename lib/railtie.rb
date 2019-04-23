class Railtie < Rails::Railtie
  rake_tasks do
    load "tasks/figaro_secrets.rake"
  end
end

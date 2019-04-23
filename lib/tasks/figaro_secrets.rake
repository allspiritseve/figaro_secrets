namespace :figaro_secrets do
  task :list, [:environment] do |t, args|
    require "figaro"
    environment = args[:environment] || ENV["RAILS_ENV"] || "development"
    puts "\n"
    puts "Retrieving #{environment} configuration"
    puts "\n"
    config = Figaro.adapter.new(environment: environment).configuration
    output = []
    config.keys.sort.each do |key|
      output << "#{key} #{config[key].inspect}"
    end
    system("echo \"#{output.join("\n")}\" | column -t")
    puts "\n"
  end
end

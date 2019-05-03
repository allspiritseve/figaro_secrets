module FigaroSecrets
  module Tasks
    def self.list(environment: self.environment)
      title "Retrieving #{environment} configuration"
      config = Figaro.adapter.new(environment: environment).configuration
      output = []
      config.keys.sort.each do |key|
        output << "#{key}=#{config[key].inspect}"
      end
      puts output
      puts "\n"
    end

    def self.secrets(environment: self.environment)
      title "Retrieving secrets from #{environment} configuration"
      figaro = Figaro.adapter.new(environment: environment)
      unparsed_secrets = figaro.unparsed_secrets
      secrets = figaro.secrets

      unparsed_secrets.each do |key, value|
        parsed_value = secrets[key]
        puts key
        puts "  #{value} => #{parsed_value.inspect}"
      end
      puts "\n"
    end

    def self.title(title)
      puts "\n#{title}\n\n"
    end

    def self.environment
      ENV["RAILS_ENV"] || ENV["APP_ENV"] || "development"
    end
  end
end

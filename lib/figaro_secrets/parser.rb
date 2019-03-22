require "figaro_secrets/secrets_manager"

module FigaroSecrets
  class Parser
    SECRET_REGEX = /^secretsmanager:(?<secret>.*)/

    def parse_secrets(configuration)
      return configuration unless FigaroSecrets.enabled?

      configuration.inject({}) do |memo, (key, value)|
        memo.merge(key => parse_secret(key, value))
      end
    end

    def parse_secret(key, value)
      if value =~ SECRET_REGEX
        secrets_manager.get_secret($1)
      else
        value
      end
    end

    def secrets_manager
      @secrets_manager ||= SecretsManager.new
    end
  end
end

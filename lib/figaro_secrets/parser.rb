module FigaroSecrets
  class Parser
    SECRET_REGEX = /^secretsmanager:(?<secret>.*)/

    def parse_secrets(configuration)
      secrets(configuration).inject(configuration) do |memo, (key, value)|
        memo.merge(key => parse_secret(key, value))
      end
    end

    def secrets(configuration)
      configuration.select do |_key, value|
        value =~ SECRET_REGEX
      end
    end

    def parse_secret(key, value)
      return unless FigaroSecrets.enabled?

      if value =~ SECRET_REGEX
        secrets_manager.get_secret($1)
      else
        value
      end
    end

    def secrets_manager
      @secrets_manager ||= begin
        require "figaro_secrets/secrets_manager"
        SecretsManager.new
      end
    end
  end
end

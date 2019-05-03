require "figaro/application"

module FigaroSecrets
  module Hook
    def configuration
      @figaro_secrets_configuration ||= FigaroSecrets.parse_secrets(figaro_configuration)
    end

    def secrets
      FigaroSecrets.parse_secrets(unparsed_secrets)
    end

    def unparsed_secrets
      FigaroSecrets.secrets(figaro_configuration)
    end

    def figaro_configuration
      global_configuration.merge(environment_configuration)
    end

    Figaro::Application.prepend(self)
  end
end

require "figaro/application"

module FigaroSecrets
  module Hook
    def configuration
      @configuration_with_secrets = FigaroSecrets.parse_secrets(super)
    end

    Figaro::Application.prepend(self)
  end
end

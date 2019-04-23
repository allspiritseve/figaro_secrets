# frozen_string_literal: true

require "figaro_secrets/version"
require "figaro_secrets/parser"

module FigaroSecrets
  def self.parse_secrets(configuration)
    Parser.new.parse_secrets(configuration)
  end

  def self.log_error(message)
    Rails.logger&.error(message) || $stderr.puts(message)
  end

  # Short circuit to prevent parsing secrets
  def self.enabled?
    ENV["FIGARO_SECRETS"] != "false"
  end
end

require "figaro_secrets/hook"
require "railtie" if defined?(Rails)

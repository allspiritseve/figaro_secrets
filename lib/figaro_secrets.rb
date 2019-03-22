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
end

require "figaro_secrets/hook"

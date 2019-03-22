require "aws-sdk-secretsmanager"

module FigaroSecrets
  class SecretsManager
    def get_secret(secret)
      secret_name, key = secret.split(":")
      response = client.get_secret_value(secret_id: secret_name)
      secret = response.secret_string || Base64.decode64(response.secret_binary)
      parsed_secret = JSON.parse(secret) rescue secret
      if key && parsed_secret.is_a?(Hash)
        parsed_secret[key]
      else
        parsed_secret
      end
    rescue JSON::ParserError => e
      FigaroSecrets.log_error("Could not parse secret: #{e}")
    rescue Aws::Errors::ServiceError => e
      FigaroSecrets.log_error("Could not retrieve secret #{secret.inspect}: #{e}"
    end

    def client
      @client ||= Aws::SecretsManager::Client.new
    end
  end
end

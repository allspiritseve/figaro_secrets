require "test_helper"

require "figaro_secrets"

module FigaroSecrets
  class ParserTest < Minitest::Test
    def test_parse_secrets
      parser = Parser.new
      secrets_manager = Minitest::Mock.new
      secrets_manager.expect(:get_secret, "red", ["color"])
      secrets_manager.expect(:get_secret, "balloon", ["config:type"])
      secrets_manager.expect(:get_secret, nil, ["missing"])
      parser.instance_variable_set(:@secrets_manager, secrets_manager)

      result = parser.parse_secrets(
        color: "secretsmanager:color",
        type: "secretsmanager:config:type",
        missing: "secretsmanager:missing"
      )

      assert_equal result, { color: "red", type: "balloon", missing: nil }
    end
  end
end

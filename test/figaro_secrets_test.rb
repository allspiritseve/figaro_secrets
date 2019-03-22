require "test_helper"

class FigaroSecretsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil FigaroSecrets::VERSION
  end

  def test_enabled?
    assert_equal true, FigaroSecrets.enabled?
    original_env = ENV.to_h.dup
    ENV["FIGARO_SECRETS"] = "false"
    assert_equal false, FigaroSecrets.enabled?
    ENV.replace(original_env)
  end
end

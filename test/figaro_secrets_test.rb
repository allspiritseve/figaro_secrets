require "test_helper"

class FigaroSecretsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::FigaroSecrets::VERSION
  end
end

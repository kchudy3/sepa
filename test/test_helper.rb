require 'codeclimate-test-reporter'
require 'minitest/autorun'
require 'dotenv'
Dotenv.load

if ENV['CODECLIMATE_REPO_TOKEN']
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    CodeClimate::TestReporter::Formatter
  ]
else
  SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
end

SimpleCov.start do
  add_filter "/test/"
  add_filter "/vendor/"
end

require 'sepafm'
require 'sepa/fixtures'

TEST_RESPONSE_PATH = "#{ROOT_PATH}/test/sepa/test_files/test_responses"
I18n.enforce_available_locales = true
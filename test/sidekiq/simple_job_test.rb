require 'test_helper'
class SimpleJobTest < Minitest::Test
  def test_example
    skip "add some examples to (or delete) #{__FILE__}"
  end
  def perform(name)
    puts "🚀 Sidekiq 工作執行中！Hello, #{name}!"
  end
end

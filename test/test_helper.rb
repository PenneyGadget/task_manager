#specifying that we want our environment when we're running our tests to be test
#ENV[] is environment variable
#if there isn't already a RACK_ENV var, make one and set it to 'test'
#this env var will exist as long as our program is running
ENV['RACK_ENV'] ||= 'test'

#requiring our environment - makes it so we don't have to require everything seperately
require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'

#the opposite of a setup method - before each test delete all data
class Minitest::Test
  def teardown
    TaskManager.delete_all
  end
end

#now capybara knows when we say "visit this" to look in this app
Capybara.app = TaskManagerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end

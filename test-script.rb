require 'selenium-webdriver'
require 'test-unit'

class SafariTest < Test::Unit::TestCase
  def setup
    options = Selenium::WebDriver::Options.safari
    @driver = Selenium::WebDriver.for :safari, options: options

    @url1 = "https://saas-release.snapsheet.tech/efnol/kin_us?policy_number=systemTests-HO&date_of_loss=2020-01-01&name=Rizzo"
    @url2 = "https://saas-release.snapsheet.tech/app/snapsheet_insurance/start"
    @driver.manage.timeouts.implicit_wait = 30
  end

  def test_page1
    @driver.get(@url1)
    @query_box = @driver.find_element(:css, '.ss-btn-secondary-dark') # Fails with Selenium::WebDriver::Error::UnknownError
  end

  def test_page2
    @driver.get(@url2)
    @query_box = @driver.find_element(:css, '.ss-btn-secondary-dark') # Passes
  end

  def teardown
    @driver.quit
  end
end

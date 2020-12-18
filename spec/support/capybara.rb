# 這個檔沒有也可以測？ 
# 是讓我們看到瀏覽器跑出來的的畫面！
# 若測試覺得有問題，可以在裡面下 byebug
require 'capybara'

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new(args: %w[no-sandbox headless disable-gpu])
	# Capybara::Selenium::Driver.new(app, browser: :chrome)
  # 本機測試使用，自動開瀏覽器測試。
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :chrome

# 這個檔沒有也可以測？ 
# 是讓我們看到瀏覽器跑出來的的畫面！
# 若測試覺得有問題，可以在裡面下 byebug
require 'capybara'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :chrome

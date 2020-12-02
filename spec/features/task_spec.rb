require 'rails_helper'

RSpec.feature 'Tasks', type: :feature, driver: :chrome, js: true, slow: true do
  describe 'feature_task' do
    let(:task) do
      Task.create(
        title: "種子任務標題",
        content: "種子任務內容"
      )
    end
    before(:each) do
      visit tasks_path  # 任務列表
    end
    scenario 'create new task' do
      expect(Task.count).to eq(0)
      # 點選新增任務
      click_on '新增'
      # 確認畫面是新增任務
      expect(page).to have_content('新增任務')
      # 測試新增功能(填資料(fill_in))
      fill_in('任務名稱', with: 'capybara 測試 title')
      fill_in('任務內容', with: 'capybara 測試')
      click_button('送出')
      # 確認新增後頁面(R(show)
      expect(page).to have_content('任務新增成功！')
      expect(page).to have_content('capybara 測試 title')
      # 確認資料數
      expect(Task.count).to eq(1)
    end
    
end

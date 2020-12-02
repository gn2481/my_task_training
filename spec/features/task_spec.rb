require 'rails_helper'

RSpec.feature 'Tasks', type: :feature, driver: :chrome, js: true, slow: true do
  describe 'feature' do

    before(:each) do
      Task.create(
        title: '種子任務標題',
        content: '種子任務內容'
      )
      visit tasks_path  # 任務列表
    end

    scenario 'create_new_task' do
      expect(Task.count).to eq(1)
      click_on '新增'      # 點選新增任務
      expect(page).to have_content('新增任務')      # 確認畫面為新增任務
      # 測試新增功能(填資料(fill_in))
      fill_in('任務名稱', with: 'capybara 測試 title')
      fill_in('任務內容', with: 'capybara 測試')
      click_button('送出')
      expect(page).to have_content('任務新增成功！')      # 確認新增成功
      expect(page).to have_content('capybara 測試 title')      # 確認新增後頁面(R(show)
      expect(Task.count).to eq(2)      # 確認資料數
    end

    scenario 'edit_task' do
      click_link('編輯')
      expect(page).to have_content('修改任務')
      fill_in('任務名稱', with: 'capybara 修改 title')
      click_button('送出')
      expect(page).to have_content('任務修改成功')
      expect(Task.find_by(title:'capybara 修改 title')).not_to be_nil
    end

    scenario 'delete_task' do
      expect(Task.count).to eq(1)
      click_on('刪除')
      accept_confirm('確認')
      expect(page).to have_content('任務刪除成功')
      expect(Task.count).to eq(0)
    end
  end
end

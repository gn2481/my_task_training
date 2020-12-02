require 'rails_helper'

RSpec.feature 'Tasks', type: :feature, driver: :chrome, js: true, slow: true do
  describe 'feature' do
    #   let(:task) do
    #     Task.create(
    #       title: '種子任務標題',
    #       content: '種子任務內容'
    #     )
    #   end
    # before(:each) do
    #   visit tasks_path  # 任務列表
    # end
    scenario 'create_new_task' do
      visit tasks_path
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

    scenario 'edit_task' do
      Task.create(
        title: '種子任務標題',
        content: '種子任務內容'
      )
      visit tasks_path
      click_link('編輯')
      expect(page).to have_content('修改任務')
      fill_in('任務名稱', with: 'capybara 修改 title')
      click_button('送出')
      expect(page).to have_content('任務修改成功')
      expect(Task.find_by(title:'capybara 修改 title')).not_to be_nil
    end

    
  end
end

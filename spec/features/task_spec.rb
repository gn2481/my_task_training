require 'rails_helper'

RSpec.feature 'Tasks', type: :feature, driver: :chrome, js: true, slow: true do
  let(:last_task_attrs) { Task.last.attributes.symbolize_keys.slice(:title, :content) }
  # Task.last.attributes => 抓出最後一筆資料的欄位，回傳值為 string_key 的 hash 
  # .symbolize_keys.slice(:title, :content)  => 將 key 值轉為 symbol(供下面取用)，並只保留 titlt, content 兩個欄位。
  let(:task_fields) do
    { title: 'capybara 測試 title', content: 'capybara 測試' }
  end

  describe 'create task' do

    before do
      visit tasks_path
      click_on '新增'            # 點選新增任務
      # 測試新增功能(填資料(fill_in))
      fill_in('任務名稱', with: task_fields[:title])
      fill_in('任務內容', with: task_fields[:content])
      click_button('送出')
    end

    scenario 'should create new task' do

      expect(page).to have_content('任務新增成功！')     # 確認新增成功
      expect(last_task_attrs).to eq(task_fields)    # 確認資料正確
      expect(page).to have_content(task_fields[:title])      # 確認新增後頁面(R(show)
    end
  end
  
  describe 'edit task' do
    let!(:task) { create :task }

    scenario 'should update task' do 
      visit tasks_path
      click_link('編輯')
      expect(page).to have_content('修改任務')
      fill_in('任務名稱', with: task_fields[:title] )
      fill_in('任務內容', with: task_fields[:content] )
      click_button('送出')
      expect(page).to have_content('任務修改成功')
      expect(last_task_attrs).to eq(task_fields)
    end
  end
  
  describe 'destroy task' do
    let!(:task) { create :task }

    scenario 'should delete task' do
      visit tasks_path
      expect(Task.count).to eq(1)
      click_on('刪除')
      accept_confirm('確認')
      expect(page).to have_content('任務刪除成功')
      expect(Task.count).to eq(0)
    end
  end
end

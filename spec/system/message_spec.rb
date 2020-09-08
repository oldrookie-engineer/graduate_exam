require 'rails_helper'
RSpec.describe 'アーカイブ使用・返却機能', type: :system do
  describe 'アーカイブ使用・返却画面' do
    before do
      @user = create(:user)
      @admin_user = create(:admin_user)
      @conversation = create(:conversation)
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      sleep 1.0
      click_on 'commit'
      click_on 'ア ー カ イ ブ リ ス ト'
      click_on 'アーカイブ使用・返却'
    end
    context '管理者にアーカイブの使用報告メッセージを作成した場合' do
      it '作成済みのメッセージ情報が表示される' do
        sleep 1.0
        find(:xpath, '/html/body/div/div/table/tbody/tr/td[2]/a/img').click
        sleep 1.0
        fill_in 'message[body]', with: '第一幼稚園の廃園届を使用します。'
        click_on 'commit'
        expect(page).to have_content @user.name
        expect(page).to have_content '第一幼稚園の廃園届を使用します。'
        sleep 0.5
      end
    end
  end
end

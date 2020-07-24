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
      sleep 1.5
      click_on 'commit'
      click_on 'ア ー カ イ ブ 一 覧'
      click_on 'ア ー カ イ ブ 使 用・返 却'
    end
    context '管理者にアーカイブの使用報告メッセージを作成した場合' do
      it '作成済みのメッセージ情報が表示される' do
        sleep 2.0
        click_on @admin_user.name
        sleep 1.0
        fill_in 'message[body]', with: "第一幼稚園の廃園届を使用します。"
        sleep 2.0
        click_on 'commit'
        expect(page).to have_content @user.name
        expect(page).to have_content "第一幼稚園の廃園届を使用します。"
        sleep 2.0
      end
    end
  end
end
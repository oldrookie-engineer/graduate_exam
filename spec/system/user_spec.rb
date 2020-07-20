require 'rails_helper'
RSpec.describe 'アカウント登録・ログイン・ログアウト機能', type: :system do
  describe 'アカウント登録のテスト' do
    context 'ユーザーのデータが無く、ログインしていない場合' do
      it 'アカウント登録' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'test'
        fill_in 'user[email]', with: 'a@b.com'
        fill_in 'user[password]', with: '111111'
        fill_in 'user[password_confirmation]', with: '111111'
        click_on '登 録'
        sleep 2.0
        expect(page).to have_content 'アカウント登録が完了しました。'
        sleep 2.0
      end
    end
  end
end

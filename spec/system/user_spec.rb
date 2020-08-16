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
        sleep 1.0
        expect(page).to have_content 'アカウント登録が完了しました。'
        sleep 0.5
      end
      it 'ログインしていない時はログイン画面に飛ぶテスト' do
        visit kindergartens_path
        sleep 1.0
        expect(current_path).to eq new_user_session_path
        sleep 0.5
      end
    end
  end

  describe 'セッション機能のテスト' do
    before do
      @user = create(:user)
    end
    context 'ユーザーのデータがあり、ログインしていない場合' do
      it 'ログインのテスト' do
        visit new_user_session_path
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on 'commit'
        expect(page).to have_content 'ログインしました。'
        sleep 0.5
      end
    end
    context '既にログインしている場合' do
      it 'ログアウトのテスト' do
        visit new_user_session_path
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on 'commit'
        click_on 'ロ グ ア ウ ト'
        expect(page).to have_content 'ログアウトしました。'
        sleep 0.5
      end
    end
  end
end

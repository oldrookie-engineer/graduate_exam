require 'rails_helper'
RSpec.describe '幼稚園情報管理機能', type: :system do
  before do
    @user = create(:user)
    @kindergarten = create(:kindergarten)
    # @station = FactoryBot.create(:station)
    # @authorization = FactoryBot.create(:authorization)
    visit new_user_session_path
    login_admin(admin)
    # fill_in 'user[email]', with: @user.email
    # find(:xpath, "//*[@id="user_email"]").fill_in 'Email', with: @user.email
    # # fill_in 'user[password]', with: @user.password
    # find(:xpath, "//*[@id="user_password"]").fill_in 'Password', with: @user.password
    # find(:xpath, "//*[@id="new_user"]/div[4]/input").click
  end
  describe '幼稚園一覧画面' do
    context '幼稚園情報を作成した場合' do
      it '作成済みの幼稚園が表示される' do
        visit kindergartens_path
        expect(page).to have_content @kindergarten.name
      end
    end
  end
end

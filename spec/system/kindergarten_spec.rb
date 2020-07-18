require 'rails_helper'
RSpec.describe '幼稚園情報管理機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @kindergarten = FactoryBot.create(:kindergarten)
    # @station = FactoryBot.create(:station)
    # @authorization = FactoryBot.create(:authorization)
    visit new_session_path
    fill_in 'session[email]', with: @user.email
    fill_in 'session[password]', with: @user.password
    click_on 'ログイン'
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

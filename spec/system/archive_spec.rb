require 'rails_helper'
RSpec.describe 'アーカイブ管理機能', type: :system do
  describe 'アーカイブ一覧画面' do
    before do
      @user = create(:user)
      @archive = create(:archive)
      @second_archive = create(:second_archive)
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      sleep 2.0
      click_on 'commit'
      click_on 'ア ー カ イ ブ 一 覧'
    end
    context 'アーカイブ情報を作成した場合' do
      it '作成済みのアーカイブ情報が表示される' do
        click_on 'ア ー カ イ ブ 登 録'
        sleep 1.0
        fill_in 'archive[name]', with: "第三"
        select '廃園届', from: 'archive[title]'
        fill_in "archive[installation_date]", with: "0019850724"
        select '在庫あり', from: 'archive[status_of_use]'
        sleep 2.0
        click_on '登 録'
        expect(page).to have_content "第三"
        expect(page).to have_content "1985年7月24日"
        expect(page).to have_content "在庫あり"
        sleep 2.0
      end
    end
    context 'アーカイブ情報を検索した場合' do
      it '幼稚園名で検索できる' do
        fill_in "q[name_cont]", with: "二"
        sleep 1.5
        find(:xpath, "/html/body/div/div/div/div[2]/div/table/tbody/tr/th[1]/form/input[3]").click
        sleep 1.5
        expect(page).to have_content @second_archive.name
        sleep 1.5
      end
      it '申請認可名で検索できる' do
        select "資産総額変更届", from: "title"
        sleep 1.5
        find(:xpath, "/html/body/div/div/div/div[2]/div/table/tbody/tr/th[2]/form/input[3]").click
        sleep 1.5
        expect(page).to have_content @second_archive.title
        sleep 1.5
      end
    end
  end
end

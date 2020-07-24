require 'rails_helper'
RSpec.describe '申請認可管理機能', type: :system do
  describe '申請状況一覧画面' do
    before do
      @user = create(:user)
      @application_document = create(:application_document, user: @user)
      @second_application_document = create(:second_application_document, user: @user)
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      sleep 2.0
      click_on 'commit'
    end
    context '申請認可情報を作成した場合' do
      it '作成済みの認可情報が表示される' do
        click_on '申 請 認 可 登 録'
        sleep 1.0
        fill_in 'application_document[name]', with: "第三"
        select '廃園届', from: 'application_document[title]'
        fill_in "application_document[application_date]", with: "0020200724"
        fill_in "application_document[processing_deadline]", with: "0020200731"
        select '未処理', from: 'application_document[processing]'
        sleep 2.0
        click_on '登 録'
        expect(page).to have_content "第一"
        expect(page).to have_content "2020年7月24日"
        expect(page).to have_content "2020年7月31日"
        expect(page).to have_content @user.name
        expect(page).to have_content "未処理"
        sleep 2.0
      end
    end
    context '認可情報を検索した場合' do
      it '幼稚園名で検索できる' do
        click_on '申 請 状 況 一 覧'
        sleep 1.0
        fill_in "q[name_cont]", with: "二"
        sleep 1.5
        find(:xpath, "/html/body/div/div/div/div[2]/div/table/tbody/tr/th[1]/form/input[3]").click
        sleep 1.5
        expect(page).to have_content @second_application_document.name
        sleep 1.5
      end
      it '申請認可名で検索できる' do
        click_on '申 請 状 況 一 覧'
        sleep 1.0
        fill_in "q[title_cont]", with: "資"
        sleep 1.5
        find(:xpath, "/html/body/div/div/div[2]/div[2]/div/table/tbody/tr/th[2]/form/input[3]").click
        sleep 1.5
        expect(page).to have_content @second_application_document.title
        sleep 1.5
      end
    end
  end
end

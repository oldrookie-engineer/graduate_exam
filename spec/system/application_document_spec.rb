require 'rails_helper'
RSpec.describe '申請認可管理機能', type: :system do
  describe '幼稚園一覧画面' do
    before do
      @user = create(:user)
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
        fill_in 'application_document[name]', with: "第一"
        select '廃園届', from: 'application_document[title]'
        fill_in "application_document[application_date]", with: "0020200724"
        fill_in "application_document[processing_deadline]", with: "0020200731"
        select '未処理', from: 'application_document[processing]'
        sleep 2.0
        click_on '登 録'
        expect(page).to have_content "第一"
        expect(page).to have_content "2020年7月24日"
        expect(page).to have_content "2020年7月31日"
        expect(page).to have_content "未処理"
      end
      # it '作成済みの幼稚園認可情報が表示される' do
      #   find(:xpath, "/html/body/div/div/div/div[2]/table/tbody/tr[2]/td[5]/a/img").click
      #   expect(page).to have_content @authorization.principal
      #   expect(page).to have_content "1973年1月1日"
      #   expect(page).to have_content @authorization.number_of_classes
      #   expect(page).to have_content @authorization.capacity
      #   expect(page).to have_content @authorization.number_of_students
      #   expect(page).to have_content @authorization.school_area
      #   expect(page).to have_content @authorization.school_floor_area
      # end
      # it '作成済みの幼稚園アクセス情報が表示される' do
      #   find(:xpath, "/html/body/div/div/div/div[2]/table/tbody/tr[2]/td[5]/a/img").click
      #   sleep 2.0
      #   click_on 'ア ク セ ス'
      #   execute_script('window.scrollBy(0,10000)')
      #   sleep 2.0
      #   expect(page).to have_content @station.route
      #   expect(page).to have_content @station.station_name
      #   expect(page).to have_content @station.walk_time
      #   sleep 2.0
      # end
      # it '作成済みの幼稚園外観写真が表示される' do
      #   find(:xpath, "/html/body/div/div/div/div[2]/table/tbody/tr[2]/td[5]/a/img").click
      #   sleep 2.0
      #   click_on '外 観 写 真'
      #   execute_script('window.scrollBy(0,5000)')
      #   sleep 2.0
      #   assert page.has_xpath?("/html/body/div[1]/div/div[3]/div[4]/table/tbody/tr[2]/td[1]/img")
      #   assert page.has_xpath?("/html/body/div[1]/div/div[3]/div[4]/table/tbody/tr[2]/td[2]/img")
      # end
    end
  end
end

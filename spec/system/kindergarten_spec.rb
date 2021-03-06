require 'rails_helper'
RSpec.describe '幼稚園情報管理機能', type: :system do
  describe '幼稚園一覧画面' do
    before do
      @user = create(:user)
      @kindergarten = create(:kindergarten)
      @second_kindergarten = create(:second_kindergarten)
      @station = create(:station)
      @authorization = create(:authorization)
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      sleep 1.0
      click_on 'commit'
    end
    context '幼稚園情報を作成した場合' do
      it '作成済みの幼稚園が表示される' do
        expect(page).to have_content @kindergarten.name
        expect(page).to have_content @kindergarten.address
        expect(page).to have_content @kindergarten.phone_number
        sleep 0.5
      end
      it '作成済みの幼稚園認可情報が表示される' do
        find(:xpath, '/html/body/div/div/div/div[2]/table/tbody/tr[2]/td[5]/a/img').click
        sleep 1.0
        expect(page).to have_content @authorization.principal
        expect(page).to have_content '1973年1月1日'
        expect(page).to have_content @authorization.number_of_classes
        expect(page).to have_content @authorization.capacity
        expect(page).to have_content @authorization.number_of_students
        expect(page).to have_content @authorization.school_area
        expect(page).to have_content @authorization.school_floor_area
        sleep 0.5
      end
      it '作成済みの幼稚園アクセス情報が表示される' do
        find(:xpath, '/html/body/div/div/div/div[2]/table/tbody/tr[2]/td[5]/a/img').click
        sleep 1.0
        click_on 'ア ク セ ス'
        sleep 0.5
        execute_script('window.scrollBy(0,10000)')
        sleep 0.5
        expect(page).to have_content @station.route
        expect(page).to have_content @station.station_name
        expect(page).to have_content @station.walk_time
        sleep 0.5
      end
      it '作成済みの幼稚園外観写真が表示される' do
        find(:xpath, '/html/body/div/div/div/div[2]/table/tbody/tr[2]/td[5]/a/img').click
        sleep 1.0
        click_on '外 観 写 真'
        sleep 0.5
        execute_script('window.scrollBy(0,5000)')
        sleep 0.5
        assert page.has_xpath?('/html/body/div[1]/div/div[3]/div[4]/table/tbody/tr[2]/td[1]/img')
        assert page.has_xpath?('/html/body/div[1]/div/div[3]/div[4]/table/tbody/tr[2]/td[2]/img')
        sleep 0.5
      end
    end
    context '幼稚園情報を検索した場合' do
      it '幼稚園名で検索できる' do
        fill_in 'q[name_cont]', with: '二'
        find(:xpath, '/html/body/div/div/div/div[2]/div/table/tbody/tr/th[1]/form/input[3]').click
        sleep 1.0
        expect(page).to have_content @second_kindergarten.name
        sleep 0.5
      end
      it '住所で検索できる' do
        fill_in 'q[address_cont]', with: '杉'
        find(:xpath, '/html/body/div/div/div/div[2]/div/table/tbody/tr/th[2]/form/input[3]').click
        sleep 1.0
        expect(page).to have_content @second_kindergarten.address
        sleep 0.5
      end
    end
  end
end

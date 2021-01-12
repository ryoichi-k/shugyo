require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
    before do
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
      visit login_path
      fill_in 'session[email]', with: login_user.email
      fill_in 'session[password]', with: login_user.password
      click_button 'Log in'
    end
    context 'ユーザーAがログインしている時' do
      let(:login_user) { user_a }

      it 'ユーザーAの名前がマイページに表示される' do
        expect(page).to have_content 'ユーザーA'
      end
    end

    context 'ユーザーBがログインしている時' do
      let(:login_user) { user_b }

      it 'ユーザーAの名前がマイページに表示されない' do
        expect(page).to have_no_content 'ユーザーA'
      end
    end
  end
end
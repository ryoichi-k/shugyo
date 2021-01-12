require 'rails_helper'

describe 'トップページ', type: :system do
  describe 'トップページのレイアウトを確認する' do
    before do
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
    end
    context 'ユーザーAがログインしている時' do
      before do
        visit login_path
        fill_in 'session[email]', with: 'a@example.com'
        fill_in 'session[password]', with: 'password'
        click_button 'Log in'
      end

      it 'ユーザーAの名前がマイページに表示されること' do
        expect(page).to have_content 'ユーザーA'
      end
      it 'ユーザー一覧リンクがあること' do
        expect(page).to have_link 'ユーザー一覧', href: users_path
      end
      it 'ログアウトリンクがあること' do
        expect(page).to have_link 'ログアウト', href: logout_path
      end
    end

    context 'ユーザーAがログインしていない時' do
      before do
        visit root_path
      end
      it '早速使ってみるリンクがあること' do
        expect(page).to have_link '早速使ってみる', href: signup_path
      end
      it 'ホームリンクがあること' do
        expect(page).to have_link 'ホーム', href: root_path
      end
      it 'ログインリンクがあること' do
        expect(page).to have_link 'ログイン', href: login_path
      end
      it 'ユーザーAの名前がマイページに表示されないこと' do
        expect(page).to have_no_content 'ユーザーA'
      end
    end
  end
end
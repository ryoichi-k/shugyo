#メインのユーザー complete:true
User.create!(name:  "テストユーザー卒業済み",
    email: "example@railstutorial.org",
    password:              "foobar",
    password_confirmation: "foobar",
    goal: "目標作成しましょうね",
    message:"初期メッセージ",
    complete: true)


#メインのユーザー complete:false
User.create!(name:  "テストユーザー未卒業",
    email: "rails@example.com",
    password:              "password",
    password_confirmation: "password",
    goal: "１５キロ痩せる",
    message:"この夏はダイエット！",
    )





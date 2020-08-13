User.create!(
  name: "master",
  email: "12@ab.com",
  password: "adminpass",
  password_confirmation: "adminpass",
  admin: true
)

20.times do |n|
  User.create!(
    name: "test-user#{ n + 1 }",
    email: "test#{ n + 1 }@test.com",
    password: "password#{ n + 1 }",
    password_confirmation: "password#{ n + 1 }"
  )
end

20.times do |n|
  Kindergarten.create!(
    name: "第#{ n + 1 }",
    address: "中野区中野1-#{ n + 1 }-#{ n + 1 }",
    phone_number: "03-1111-1111",
    image: File.open("./app/assets/images/園庭.jpg"),
    cover_image: File.open("./app/assets/images/園舎.jpg"),
    authorization_attributes: {
          principal: "principal#{ n + 1 }",
          installation_date: "1974-01-#{ n + 1 }",
          number_of_classes: "#{ n + 1 }",
          capacity: "300",
          number_of_students: "320",
          school_area: "700",
          school_floor_area: "900"
        },
    stations_attributes: [
      {
        route: "JR",
        station_name: "中野",
        walk_time: "#{ n + 1 }"
      }
    ]
  )
end

7.times do |n|
  ApplicationDocument.create!(
    name: "第#{ n + 1 }",
    title: "設置認可申請",
    application_date: "2020-08-#{ n + 1 }",
    processing_deadline: "2020-08-1#{ n + 1 }",
    processing: "処理済",
    user_id: "#{ n + 1 }"
  )
end

7.times do |n|
  ApplicationDocument.create!(
    name: "第#{ n + 1 }",
    title: "資産総額変更届",
    application_date: "2020-08-#{ n + 1 }",
    processing_deadline: "2020-08-2#{ n + 1 }",
    processing: "処理中",
    user_id: "#{ n + 1 }"
  )
end

6.times do |n|
  ApplicationDocument.create!(
    name: "第1#{ n + 1 }",
    title: "園長選任届",
    application_date: "2020-08-1#{ n + 1 }",
    processing_deadline: "2020-09-#{ n + 1 }",
    processing: "未処理",
    user_id: "1#{ n + 1 }"
  )
end

10.times do |n|
  Archive.create!(
    name: "第#{ n + 1 }",
    title: "園長選任届",
    installation_date: "1997-11-#{ n + 1 }",
    status_of_use: "在庫あり"
  )
end

10.times do |n|
  Archive.create!(
    name: "第#{ n + 1 }",
    title: "設置認可申請",
    installation_date: "1986-03-#{ n + 1 }",
    status_of_use: "使用中"
  )
end

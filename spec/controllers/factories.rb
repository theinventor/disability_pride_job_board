Factory.define  :unconfirmed_user, :class => User do |user|
  user.sequence(:email) { |n| "address#{n}@gmail.com" }
  user.password              "password"
  user.password_confirmation "password"
end

Factory.define  :user, :parent => :unconfirmed_user do |user|
  user.confirmed_at Time.now
end

Factory.define :content do |content|
  content.title "title1"
  content.body "body is here"
  content.sequence(:page_name) { |n| "page#{n}" }
end

Factory.define :subscriber do |s|
  s.email "foo@foo.com"
end

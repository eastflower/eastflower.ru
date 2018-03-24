# encoding: UTF-8

user = User.new(
  email:    'admin@website.com',
  login:    'admin',
  username: 'Admin',
  password: 'qwerty123',
  password_confirmation: 'qwerty123',
)

user.skip_confirmation!
user.save!
User.first.confirm!

puts "Admin user created"
puts "admin@website.com | admin | qwerty123"

PUB_STATES = %w[ draft published deleted ]

hub_1 = user.hubs.create(title: 'Hub 1', slug: :pages, state: :published)
hub_2 = user.hubs.create(title: 'Hub 2', slug: :posts, state: :published)
hub_3 = user.hubs.create(title: 'Hub 3', slug: :main, state: :published)

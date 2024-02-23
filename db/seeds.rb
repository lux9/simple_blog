require 'faker'
require_relative "seed_helper.rb"

seed_start_time = Time.now
puts "Starting seeds"
if Rails.env == "development"

  puts "Destroying old records..."
  destroy_old_records

  puts "Creating new users..."
  5.times do
    new_user = User.new(
      email: Faker::Artist.unique.name.downcase.gsub(" ", "_") + "@mail.com",
      password: "simpleblog"
    )
    new_user.save!
    puts "user #{new_user.email} created"

    puts "Creating posts for #{new_user.email}..."
    5.times do
      new_post = new_user.posts.build(
        title: Faker::Restaurant.unique.name,
        body: Faker::Restaurant.description,
        created_at: Date.today - rand(30)
      )
      new_post.save!
      puts "post #{new_post.id} created"
    end
  end
end

puts "Creating comments for users..."
User.all.each do |user|
  commentable_posts = Post.where.not(user: user)
  25.times do
    post = commentable_posts.sample
    new_comment = user.comments.build(
      content: Faker::Restaurant.review,
      post: post,
      user: user,
      created_at: Time.at(rand(post.created_at.to_i..Time.current.to_i))
    )
    new_comment.save!
    puts "comment #{new_comment.id} created for post #{new_comment.post.id}"
  end
end

puts "Generating admin user..."
User.create!(email: "admin@mail.com", password: "simpleblog", admin: true)

puts '-------------------'
puts 'Ending seeds'
seed_end_time = Time.now
puts "Seeding took #{(seed_end_time - seed_start_time).round(3)} secs"
puts '-------------------'
display_records_amount

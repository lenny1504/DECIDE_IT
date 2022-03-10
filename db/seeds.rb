# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

Log.destroy_all
Comment.destroy_all
Step.destroy_all
ApprovalFlow.destroy_all
Proposal.destroy_all
User.destroy_all


user1 = User.new(email: "pablo@gmail.com", password: "123456", first_name: "Pablo", last_name: "Wilner")
user1.save
user2 = User.new(email: "ana@gmail.com", password: "123456", first_name: "Ana", last_name: "Rebelo")
user2.save
user3 = User.new(email: "lenny@gmail.com", password: "123456", first_name: "Lenny", last_name: "von Velsen")
user3.save
user4 = User.new(email: "richard@gmail.com", password: "123456", first_name: "Richard", last_name: "Reen")
user4.save
user5 = User.new(email: "greta@gmail.com", password: "123456", first_name: "Greta", last_name: "Blue")
user5.save
user6 = User.new(email: "mojito@gmail.com", password: "123456", first_name: "Mojito", last_name: "Best")
user6.save
user7 = User.new(email: "claire@gmail.com", password: "123456", first_name: "Claire", last_name: "Chess")
user7.save
user8 = User.new(email: "ruby@gmail.com", password: "123456", first_name: "Ruby", last_name: "Rails")
user8.save
user9 = User.new(email: "james@gmail.com", password: "123456", first_name: "James", last_name: "Jay")
user9.save
user10 = User.new(email: "grace@gmail.com", password: "123456", first_name: "Grace", last_name: "Green")
user10.save
p "Users seeded"

proposal1 = Proposal.new(title: "40% Discount in first year license for important customer", description: "Discount needed to acquire new strategic customer. Big opportunity to expand in the organization.", scope: "Discount for year 1", due_date: Date.new(2022,5,10) , creator: user1 , status: "initiated")
proposal1.save
proposal2 = Proposal.new(title: "Quarterly team activity with my team", description: "Proposal to have one team activity per quarter for each team", scope: "Start with IT team and get feedback" , budget: "20 euros per person" , due_date: Date.new(2022,4,10), creator: user3 , status: "initiated")
proposal2.save
proposal3 = Proposal.new(title: "New feature for the Customer Dashboard", description: "The customer success team has received customer feedback of the need to improve the dashboard with real time data instead of every 24 hs" , scope: "Test for beta customer" , due_date: Date.new(4/6/2022) , creator: user6 , status: "initiated")
proposal3.save
proposal4 = Proposal.new(title: "Buy mojitos for mojito", description: "Mojito wants to celebrate.", due_date: Date.new(2023,8,3), creator: user1 , status: "initiated")
proposal4.save
p "proposals seeded"

approval_flow1 = ApprovalFlow.new(name: "Sales discount" , description: "40% discount for strategic customer" , proposal: proposal1, creator: user4)
approval_flow1.save
approval_flow2 = ApprovalFlow.new(name: "Quarterly team activities" , description: "Budget to have quarterly team building activities" , proposal: proposal2, creator: user5)
approval_flow2.save
approval_flow3 = ApprovalFlow.new(name: "New feature for Dashboard" , description: "Approval needed from Product, IT and Operation teams" , proposal: proposal3, creator: user6)
approval_flow3.save
p "approvals seeded"

Step.create(approver: user3 , approval_flow: approval_flow1, status: "in review")
Step.create(approver: user8 , approval_flow: approval_flow1, status: "created")
Step.create(approver: user6 , approval_flow: approval_flow1, status: "created")

Step.create(approver: user7 , approval_flow: approval_flow2, status: "created")
Step.create(approver: user1 , approval_flow: approval_flow2, status: "created")
Step.create(approver: user5 , approval_flow: approval_flow2, status: "created")
Step.create(approver: user2 , approval_flow: approval_flow2, status: "created")

Step.create(approver: user3 , approval_flow: approval_flow3, status: "in review")
Step.create(approver: user10 , approval_flow: approval_flow3, status: "created")
Step.create(approver: user9 , approval_flow: approval_flow3, status: "created")
Step.create(approver: user7 , approval_flow: approval_flow3, status: "created")
p "steps seeded"


file1 = URI.open('https://res.cloudinary.com/dirssv0ei/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1646908007/development/profilelanding_nbng22.jpg')
user1.photo.attach(io: file1, filename: 'pablo.png', content_type: 'image/jpg')

file3 = URI.open('https://res.cloudinary.com/dirssv0ei/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1646908400/development/IMG_0100_ic9crf.jpg')
user3.photo.attach(io: file3, filename: 'lenny.png', content_type: 'image/jpg')

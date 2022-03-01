# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create(email: "pablo@gmail.com", password: "123456", first_name: "Pablo", last_name: "Wilner")
user2 = User.create(email: "ana@gmail.com", password: "123456", first_name: "Ana", last_name: "Rebelo")
user3 = User.create(email: "lenny@gmail.com", password: "123456", first_name: "Lenny", last_name: "von Velsen")
user4 = User.create(email: "richard@gmail.com", password: "123456", first_name: "Richard", last_name: "Reen")
user5 = User.create(email: "greta@gmail.com", password: "123456", first_name: "Greta", last_name: "Blue")
user6 = User.create(email: "mojito@gmail.com", password: "123456", first_name: "Mojito", last_name: "Best")
user7 = User.create(email: "claire@gmail.com", password: "123456", first_name: "Claire", last_name: "Chess")
user8 = User.create(email: "ruby@gmail.com", password: "123456", first_name: "Ruby", last_name: "Rails")
user9 = User.create(email: "james@gmail.com", password: "123456", first_name: "James", last_name: "Jay")
user10 = User.create(email: "grace@gmail.com", password: "123456", first_name: "Grace", last_name: "Green")


proposal1 = Proposal.create(title: "40% Discount in first year license for important customer", description: "Discount needed to acquire new strategic customer. Big opportunity to expand in the organization.", scope: "Discount for year 1", due_date: 10/5/2022 , creator: user4 , status: "initiated")
proposal2 = Proposal.create(title: "Quarterly team activity with my team", description: "Proposal to have one team activity per quarter for each team", scope: "Start with IT team and get feedback" , budget: "20 euros per person" , due_date: 10/4/2022, creator: user5 , status: "initiated")
proposal3 = Proposal.create(title: "New feature for the Customer Dashboard", description: "The customer success team has received customer feedback of the need to improve the dashboard with real time data instead of every 24 hs" , scope: "Test for beta customer" , due_date: 4/6/2022 , creator: user6 , status: "initiated")

approval_flow1 = ApprovalFlow.create(name: "Sales discount" , description: "40% discount for strategic customer" , proposal: proposal1, creator: user4)
approval_flow2 = ApprovalFlow.create(name: "Quarterly team activities" , description: "Budget to have quarterly team building activities" , proposal: proposal2, creator: user5)
approval_flow3 = ApprovalFlow.create(name: "New feature for Dashboard" , description: "Approval needed from Product, IT and Operation teams" , proposal: proposal3, creator: user6)


Step.create(approver: user2 , approval_flow: approval_flow1, status: "created")
Step.create(approver: user8 , approval_flow: approval_flow1, status: "created")
Step.create(approver: user6 , approval_flow: approval_flow1, status: "created")


Step.create(approver: user7 , approval_flow: approval_flow2, status: "created")
Step.create(approver: user1 , approval_flow: approval_flow2, status: "created")
Step.create(approver: user5 , approval_flow: approval_flow2, status: "created")
Step.create(approver: user2 , approval_flow: approval_flow2, status: "created")

Step.create(approver: user3 , approval_flow: approval_flow3, status: "created")
Step.create(approver: user10 , approval_flow: approval_flow3, status: "created")
Step.create(approver: user9 , approval_flow: approval_flow3, status: "created")
Step.create(approver: user7 , approval_flow: approval_flow3, status: "created")

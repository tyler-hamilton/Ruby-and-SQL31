# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database

apple =Company.find_by({"name" => "Apple"})
amazon =Company.find_by({"name" => "Amazon"})

tim = Contact.new
tim["first_name"] = "Tim"
tim["last_name"] = "Cook"
tim["email"] = "tim@apple.com"
tim["company_id"] = apple["id"]
tim.save

contact = Contact.new
contact["first_name"] = "Craig"
contact["last_name"] = "Federeighi"
contact["email"] = "craig@apple.com"
contact["company_id"] = apple["id"]
contact.save

contact = Contact.new
contact["first_name"] = "Jeff"
contact["last_name"] = "Bezos"
contact["email"] = "jeff@amazon.com"
contact["company_id"] = amazon["id"]
contact.save

puts "There are #{Company.all.count} companies"
puts "There are #{Contact.all.count} contacts"
# 1. insert new rows in the contacts table with relationship to a company

# 2. How many contacts work at Apple?

apple_contacts = Contact.where({"company_id" => apple ["id"]})
puts "apple contacts: #{apple_contacts.count}"

# 3. What is the full name of each contact who works at Apple?

if Forms::Registration.new(business_name: 'foo1', email: 'foo@bar.com', password: '123123').save
  puts "Created sample foo1 account."
end
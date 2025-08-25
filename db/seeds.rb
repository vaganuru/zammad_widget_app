# db/seeds.rb

# Clear existing tickets
Ticket.destroy_all

# Tickets for today
Ticket.create!(title: "Fix login bug", status: "open", created_at: Time.current)
Ticket.create!(title: "Update homepage banner", status: "open", created_at: Time.current)
Ticket.create!(title: "Deploy new version", status: "open", created_at: Time.current)

# Tickets for previous days
Ticket.create!(title: "Old ticket 1", status: "closed", created_at: 2.days.ago)
Ticket.create!(title: "Old ticket 2", status: "pending", created_at: 5.days.ago)

puts "Seeded #{Ticket.count} tickets."

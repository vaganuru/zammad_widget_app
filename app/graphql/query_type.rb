module Types
  class QueryType < Types::BaseObject
    # Add your queries here
    field :todays_tickets, resolver: Queries::TodaysTickets
  end
end

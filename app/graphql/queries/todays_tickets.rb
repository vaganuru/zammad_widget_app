module Queries
  class TodaysTickets < BaseQuery
    type [Types::TicketType], null: false

    def resolve
      Ticket.where("DATE(created_at) = ?", Date.today)
    end
  end
end

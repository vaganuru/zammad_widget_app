module Queries
  class TodaysTickets < Queries::BaseQuery
    type [Types::TicketType], null: false

    def resolve
      Ticket.where(created_at: Time.zone.today.all_day)
    end
  end
end

# frozen_string_literal: true
module Types
  class QueryType < Types::BaseObject
    field :todays_tickets, [Types::TicketType], null: false, description: "Tickets created today"

    def todays_tickets
      Ticket.where(created_at: Time.zone.today.all_day)
    end
  end
end

import { gql } from '@apollo/client/core';

export const GET_TODAYS_TICKETS = gql`
  query GetTodaysTickets {
    todaysTickets {
      id
      title
      status
      createdAt
    }
  }
`;

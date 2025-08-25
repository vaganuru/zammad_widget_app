import { gql } from 'graphql-request';

export const TODAYS_TICKETS_QUERY = gql`
  query {
    todaysTickets {
      id
      title
      createdAt
      status
    }
  }
`;

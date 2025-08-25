import { ApolloClient, InMemoryCache, HttpLink } from "@apollo/client/core";

const httpLink = new HttpLink({
    uri: "/graphql"
});

export const apolloClient = new ApolloClient({
    link: httpLink,
    cache: new InMemoryCache()
});

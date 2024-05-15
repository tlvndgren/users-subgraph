// External Dependencies
import fs from "fs";
import { ApolloServer } from '@apollo/server';
import { buildSubgraphSchema } from "@apollo/subgraph";
import { startStandaloneServer } from '@apollo/server/standalone';
import gql from 'graphql-tag';


// Internal Dependencies
const typeDefs = gql(fs.readFileSync("./users.graphql", 'utf8'));
import { users } from "./data/users.js";

// Variable Definitions
const port = process.env.PORT || 4003
// inserting comment for test deploy.

const resolvers = {
    User: {
        __resolveReference(object) {
            return users.find((user) => user.id === parseInt(object.id, 10));
        },
    },
    Query: {
        user(_, { id }) {
            return users.find((user) => user.id === parseInt(id, 10));
        },
        users() {
            return users
        }
    }
};

// Apollo Server Setup
const server = new ApolloServer({ 
    schema: buildSubgraphSchema({ typeDefs, resolvers }),
});

const { url } = await startStandaloneServer(server, {
    context: async ({ req }) => ({ token: req.headers.token }),
    listen: { port: port },
  });

console.log(`🚀 Users Subgraph ready at ${url}`);
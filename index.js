const fs = require("fs");
const { ApolloServer, gql } = require("apollo-server");
const { buildSubgraphSchema } = require("@apollo/federation")
const typeDefs = gql(fs.readFileSync("./users.graphql", 'utf8'));
const users = require("./data/users.js");

const pry = require("pryjs");

const port = process.env.PORT || 4001

const resolvers = {
    User: {
        __resolverReference(object) {
            return users.find((user) => user.id === object.id);
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

const server = new ApolloServer({
    schema: buildSubgraphSchema([{ typeDefs, resolvers }]),
  });
  
  server.listen({ port }).then(({ url }) => {
    console.log(`Films service ready at ${url}`);
  });

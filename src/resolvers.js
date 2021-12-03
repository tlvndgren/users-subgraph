const users = require("../data/users.js");

const resolvers = {
    User: {
        __resolverReference(object) {
            return users.find((user) => user.id === object.id);
        },
    },
    Query: {
        user(_, { id }) {
            eval(pry.it)
            let a = users.find((user) => user.id === id); 
            eval(pry.it)
            return users.find((user) => user.id === id);
        },
        users() {
            return users
        }
    }
};

module.export = resolvers;
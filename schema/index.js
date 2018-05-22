const {
    GraphQLSchema,
    GraphQLObjectType,
    GraphQLString,
    GraphQLID,
    GraphQLInt,
    GraphQLList
} = require('graphql');

const pgdb = require('../databases/pgdb');
const CustomerType = require('./types/customer');

const RootQueryType = new GraphQLObjectType({
    name: 'RootQueryType',
    fields: {
        customer: {
            type: CustomerType,
            args: {
                id: { type: GraphQLID }
            },
            resolve: (obj, args, { pgPool }) => {
                return pgdb(pgPool).getCustomer(args.id);
            }
        },
        customers: {
            type: GraphQLList(CustomerType),
            resolve: (obj, args, { pgPool }) => {
                return pgdb(pgPool).getCustomers();
            }
        }
    }
});

const cefSchema = new GraphQLSchema({
    query: RootQueryType
});

module.exports = cefSchema;
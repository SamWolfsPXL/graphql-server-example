const {
    GraphQLObjectType,
    GraphQLID,
    GraphQLString,
    GraphQLNonNull,
    GraphQLInt
} = require('graphql');

module.exports = new GraphQLObjectType({
    name: 'CustomerType',

    fields: {
        id: { type: GraphQLID },
        email: { type: new GraphQLNonNull(GraphQLString) },
        first_name: { type: GraphQLString },
        last_name: { type: GraphQLString },
        street: { type: GraphQLString },
        city: { type: GraphQLString },
        zipcode: { type: GraphQLInt },        
    }
});
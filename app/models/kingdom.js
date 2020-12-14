const Sequelize = require('sequelize');
const sequelize = require('../database');

class Kingdom extends Sequelize.Model {};

Kingdom.init({
    name: Sequelize.STRING
}, {
    sequelize,
    tableName: "kingdom"
});

// on exporte la class directement !
module.exports = Kingdom;
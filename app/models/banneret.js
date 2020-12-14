const Sequelize = require('sequelize');
const sequelize = require('../database');

class Banneret extends Sequelize.Model {};

Banneret.init({
    name: Sequelize.STRING,
}, {
    sequelize,
    tableName: "banneret"
});

module.exports = Banneret;
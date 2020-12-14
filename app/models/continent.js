const Sequelize = require('sequelize');
const sequelize = require('../database');

class Continent extends Sequelize.Model {};


Continent.init({
    name: Sequelize.STRING,
    image: Sequelize.STRING,
    
}, {
    sequelize,
    tableName: "continent"
});



module.exports = Continent;
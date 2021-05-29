const Sequelize = require('sequelize');
const sequelize = require('../database');

class Member extends Sequelize.Model {};

Member.init({
    name: Sequelize.STRING
}, {
    sequelize,
    tableName: "member"
});

// on exporte la class directement !
module.exports = Member;
const Continent = require('./continent');
const Kingdom = require('./kingdom');
const Family = require('./family');
const Member = require('./member');
const Banneret = require('./banneret');


Continent.hasMany(Kingdom, {
    foreignKey: 'continent_id',
    as: 'kingdoms'
});

Kingdom.belongsTo(Continent, {
    foreignKey: 'continent_id',
    as: 'continent'
});

Kingdom.hasMany(Family, {
    foreignKey: 'kingdom_id',
    as: 'families'
});

Family.belongsTo(Kingdom, {
    foreignKey: 'kingdom_id',
    as: 'kingdom'
});

Family.hasMany(Banneret, {
    foreignKey: 'family_id',
    as: 'bannerets'
});

Banneret.belongsTo(Family, {
    foreignKey: 'family_id',
    as: 'family'
});

Family.belongsToMany(Member, {
    foreignKey: 'family_id',
    otherKey: 'member_id',
    as: 'members',
    through: 'family_has_member'
});

Member.belongsToMany(Family, {
    otherKey: 'family_id',
    foreignKey: 'member_id',
    as: 'families',
    through: 'family_has_member'
});

module.exports = {
    Continent,
    Kingdom,
    Family,
    Member,
    Banneret
};
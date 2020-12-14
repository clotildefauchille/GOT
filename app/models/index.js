const Banneret = require('./banneret');
const Continent = require('./continent');
const Family = require('./family');
const Member = require('./member');
const Kingdom = require('./kingdom');

// une continent a plusieurs royaume
Continent.hasMany(Kingdom, {
    foreignKey: "continent_id",
    as: "kingdoms"
});

// réciproque : un royaume est lié à un seul continent
Kingdom.belongsTo(Continent, {
    foreignKey: "continent_id",
    as: "continent"
});

//un Royaume a plusieurs familles
Kingdom.hasMany(Family, {
foreignKey:"kingdom_id",
as:"families"
});

//une famille habite un royaume

Family.belongsTo(Kingdom, {
    foreignKey:"kingdom_id",
    as:"kingdom"
});

//une famille a plusieurs banneret
Family.hasMany(Banneret, {
    foreignKey:"family_id",
    as:"bannerets"
})

//une banneret sert une seul famille
Banneret.belongsToMany(Family, {
    foreignKey:"family_id",
    as:"family"
});




// Fammille <> Membre, via la table de liaison
// "Une famille possède plusieurs membres"
Family.belongsToMany(Member, {
    as: "members", // alias de l'association 
    through: 'family_has_member', // "via la table de liaison qui s'appelle ..."
    foreignKey: 'member_id', // le nom de la clef de Quiz dans la table de liaison
    otherKey: 'family_id', // le nom de la clef de "l'autre" (donc Tag)
});
// ... et la réciproque !
Member.belongsToMany(Family, {
    as: "families",
    through: 'family_has_member',
    otherKey: 'member_id',
    foreignKey: 'family_id',
});
//

module.exports = {
    Banneret,
    Continent,
    Family,
    Member,
    Kingdom,

};
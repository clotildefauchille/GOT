const {
    Continent,
    Kingdom,
    Family
} = require('../models');


module.exports = async (req, res, next) => {
    try {
        const continents = await Continent.findAll();
        res.locals.continents = continents

        const kingdoms = await Kingdom.findAll();
        res.locals.kingdoms = kingdoms

        const families = await Family.findAll();
        res.locals.families = families

        next();
    } catch (err) {
        res.status(500).send('erreur serveur')
    }
}
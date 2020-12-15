const {
    Kingdom,
    Continent
} = require('../models');
const kingdomController = {

    kingdomPage: async (req, res) => {
        const id = parseInt(req.params.id);
        try {
            const kingdom = await Kingdom.findByPk(id, {
                include: 'families'
            });

            res.render('kingdom', {
                kingdom
            });

        } catch (error) {
            console.log('Error in mainController', error);
        }
    },
    addForm: async (req, res) => {
        try {
            const continents = await Continent.findAll();
            res.render('add/kingdom', {
                continents
            });
        } catch (error) {
            console.log(error)
        }
    },
    handleAddForm: async (req, res) => {
        console.log(req.body);
        try {
            if ((req.body.name === "") || (req.body.description === "") || (req.body.image === "") || (req.body.continent_id === "")) {
                //    return response.render('signup', {
                //        error: 'Un utilisateur avec cet email existe déjà'
                //    });
                return console.log('error string vide')
                
            }
            const newKingdom = await Kingdom.create({
                name: req.body.name,
                description: req.body.description,
                image: req.body.image,
                continent_id: req.body.continent_id
            });
            res.redirect(`/kingdom/${newKingdom.id}`);
        } catch (error) {
            console.log()
        }

    }
};

module.exports = kingdomController;
const {
    Continent
} = require('../models');

const continentController = {

    continentPage: async (req, res) => {
        const id = parseInt(req.params.id);
        try {
            const continent = await Continent.findByPk(id, {
                include: 'kingdoms'
            })

            res.render('continent', {
                continent
            });

        } catch (error) {
            console.log(error);
        }

    }
}

module.exports = continentController;
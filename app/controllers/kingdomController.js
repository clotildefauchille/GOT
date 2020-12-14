const {
    Kingdom
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
    }
};

module.exports = kingdomController;
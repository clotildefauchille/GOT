const {
    Family
} = require('../models');

const familyController = {

    familyPage: async (req, res) => {
        try {
            const id = parseInt(req.params.id);
            const family = await Family.findByPk(id, {
                include: 'members'
            });
            res.render('family', {
                family
            });
        } catch (error) {
            console.log('Error in familyController', error)
        }
    }

}

module.exports = familyController;
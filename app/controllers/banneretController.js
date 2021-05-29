const {
    Banneret
} = require('../models');

const banneretController = {

    addForm: async (req, res) => {
        try {
            const bannerets = await Banneret.findAll({include:'family'})
            res.render('add/banneret', {
                bannerets
            });
        } catch (error) {
            console.log('erreur dans le banneretController')
        }
    },
    handleAddForm: async (req, res)=>{
        try{
        const newBanneret= await Banneret.create({
            name: req.body.name,
            family_id: req.body.family_id

        })
        res.render(`/family/${newBanneret.family_id}`);
        }catch(error){console.log('erreur dans le banneretController')}
    }
}

module.exports = banneretController;
const {
    Family,
    Kingdom
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
        },

        addFamily: async (req, res) => {

            try {
                const kingdoms = await Kingdom.findAll({
                    include: 'families'
                })
                res.render('add/family', {
                    kingdoms
                });

            } catch (error) {
                console.log('Error in familyController', error)
            }

        },
        handleAddForm: async (req, res)=>{
            try{
            if ((req.body.name === "") || (req.body.description === "") || (req.body.image === "") || (req.body.kingdom_id === "")) {
                return res.render('add/family', {
                    error: 'remplir tout les champs pour creer une famille'
                });
            }
            
            const newFamily= await Family.create({
                name: req.body.name,
                description: req.body.description,
                image: req.body.image,
                kingdom_id: req.body.kingdom_id
            })
            res.redirect(`/family/${newFamily.id}`);
            } catch (error) {
                console.log('Error in familyController', error)
            }
        }
    }

        module.exports = familyController;
const {
    Continent
} = require('../models');


const mainController={
    home: (req, res)=>{
        Continent.findAll().then(continents => {
            console.log(continents);
            res.render('index', {continents});
        }).catch(error => {
            console.log('Error in mainController', error);
        });

    }
}

module.exports = mainController;
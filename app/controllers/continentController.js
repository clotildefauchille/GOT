const {
    Continent
} = require('../models');

const continentController={

    continentPage: (req, res)=>{
const id = parseInt(req.params.id);

  Continent.findByPk(id).then(continent => {

      res.render('continent', {continent});

  }).catch(error => {
      console.log(error);
  })
     
    }
}

module.exports= continentController;
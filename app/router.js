const express = require('express');

const mainController = require('./controllers/mainController');
const continentController = require('./controllers/continentController');
const kingdomController = require('./controllers/kingdomController');
const familyController= require ('./controllers/familyController');
const router = express.Router();


router.get('/', mainController.home);
router.get('/continent/:id', continentController.continentPage);
router.get('/kingdom/:id', kingdomController.kingdomPage)
router.get('/family/:id', familyController.familyPage)
module.exports = router;
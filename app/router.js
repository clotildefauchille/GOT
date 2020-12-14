const express = require('express');

const mainController = require('./controllers/mainController');
const continentController = require('./controllers/continentController');
const kingdomController = require('./controllers/kingdomController')
const router = express.Router();


router.get('/', mainController.home);
router.get('/continent/:id', continentController.continentPage);
router.get('/kingdom/:id', kingdomController.kingdomPage)

module.exports = router;
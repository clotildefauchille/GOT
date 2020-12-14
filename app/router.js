const express = require('express');

const mainController = require('./controllers/mainController');
const continentController = require('./controllers/continentController');

const router = express.Router();


router.get('/', mainController.home);
router.get('/continent/:id', continentController.continentPage);

module.exports = router;
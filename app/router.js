const express = require('express');

const mainController = require('./controllers/mainController');
const continentController = require('./controllers/continentController');
const kingdomController = require('./controllers/kingdomController');
const familyController= require ('./controllers/familyController');
const banneretController = require('./controllers/banneretController');
const router = express.Router();


router.get('/', mainController.home);
router.get('/continent/:id', continentController.continentPage);
router.get('/kingdom/:id', kingdomController.kingdomPage)
router.get('/family/:id', familyController.familyPage)

router.get('/add/kingdom', kingdomController.addForm);
router.post('/add/kingdom', kingdomController.handleAddForm);

router.get('/add/family', familyController.addFamily);
router.post('/add/family', familyController.handleAddForm);

router.get('/add/banneret', banneretController.addForm);
router.post('/add/banneret', banneretController.handleAddForm);
module.exports = router;
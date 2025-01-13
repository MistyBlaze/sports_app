const express = require('express');
const { getDrills } = require('../controllers/drillController');

const router = express.Router();

// Route to get all drills
router.get('/', getDrills);

module.exports = router;
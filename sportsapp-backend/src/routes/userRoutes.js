const express = require('express');
const { getUsernames, getUserDetails } = require('../controllers/userController');

const router = express.Router();

// ...existing code...

router.get('/usernames', getUsernames);
router.get('/userdetails', getUserDetails);

module.exports = router;

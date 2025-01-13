const express = require('express');
const { signup, login } = require('../controllers/authController');
const User = require('../models/userModel');
const generateToken = require('../utils/generateToken');
const router = express.Router();

// Register user and return JWT token
const registerUser = async (req, res) => {
    const { username, password } = req.body;

    try {
        const user = new User({ username, password });
        await user.save();

        const token = generateToken(user);
        res.status(201).send({ message: 'User registered successfully', token });
    } catch (error) {
        res.status(400).send({ message: 'Error registering user', error });
    }
};

// Signup route
router.post('/signup', signup);

// Login route
router.post('/login', login);

// Define the /register route
router.post('/register', registerUser);

module.exports = router;
const User = require('../models/userModel');

const getUsernames = async (req, res) => {
    try {
        const usernames = await User.getUsernames();
        res.status(200).json(usernames);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

const getUserDetails = async (req, res) => {
    try {
        const userDetails = await User.getUserDetails();
        res.status(200).json(userDetails);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

module.exports = {
    // ...existing code...
    getUsernames,
    getUserDetails
};

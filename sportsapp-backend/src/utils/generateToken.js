module.exports = function generateToken(user, expiresIn = '30d') {
    const jwt = require('jsonwebtoken');
    const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET, {
        expiresIn, // Token expiration time
    });
    return token;
};
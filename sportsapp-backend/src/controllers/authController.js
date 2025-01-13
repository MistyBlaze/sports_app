const User = require('../models/userModel');
const Drill = require('../models/drillModel');
const generateToken = require('../utils/generateToken');

// Predefined list of drills
const drillsList = [
    { name: 'Squats', description: 'A lower body exercise' },
    { name: 'Push-ups', description: 'An upper body exercise' },
    { name: 'Lunges', description: 'A lower body exercise' },
    { name: 'Planks', description: 'A core exercise' }
];

// Function to get a random drill
const getRandomDrill = () => {
    const randomIndex = Math.floor(Math.random() * drillsList.length);
    return drillsList[randomIndex];
};

// User Signup
exports.signup = async (req, res) => {
    const { username, password } = req.body;

    try {
        const user = new User({ username, password });

        // Add random drill details
        const randomDrill = getRandomDrill();
        const drill = new Drill(randomDrill);
        await drill.save();

        user.drills.push({
            drillId: drill._id,
            userCount: Math.floor(Math.random() * 100) + 1
        });

        await user.save();

        const populatedUser = await User.findById(user._id).populate('drills.drillId', 'name description');

        const token = generateToken(populatedUser, '1h');
        res.status(201).json({ 
            _id: populatedUser._id,
            username: populatedUser.username,
            password: populatedUser.password,
            drills: populatedUser.drills,
            token 
        });
    } catch (error) {
        res.status(400).json({ message: 'Error signing up user', error });
    }
};

// User Login
exports.login = async (req, res) => {
    const { username, password } = req.body;

    try {
        const user = await User.findOne({ username });

        if (!user || user.password !== password) {
            return res.status(401).json({ message: 'Invalid credentials' });
        }

        // Add random drill details if not already present
        if (user.drills.length === 0) {
            const randomDrill = getRandomDrill();
            const drill = new Drill(randomDrill);
            await drill.save();

            user.drills.push({
                drillId: drill._id,
                userCount: Math.floor(Math.random() * 100) + 1
            });

            await user.save();
        }

        const populatedUser = await User.findById(user._id).populate('drills.drillId', 'name description');

        const token = generateToken(populatedUser, '1h');
        res.status(200).json({ 
            _id: populatedUser._id,
            username: populatedUser.username,
            password: populatedUser.password,
            drills: populatedUser.drills,
            token 
        });
    } catch (error) {
        res.status(500).json({ message: 'Error logging in', error });
    }
};
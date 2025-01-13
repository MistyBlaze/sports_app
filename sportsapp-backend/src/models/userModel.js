const mongoose = require('mongoose');
const Drill = require('./drillModel'); // Add this line

const userSchema = new mongoose.Schema({
    username: {
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        required: true
    },
    drills: [{
        drillId: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'Drill'
        },
        userCount: {
            type: Number,
            default: 0
        }
    }]
}, {
    timestamps: true
});

// Replace ensureIndex with createIndexes
userSchema.index({ username: 1 });

userSchema.statics.getUserDetails = async function() {
    return this.find({}).populate('drills.drillId', 'name description');
};

const User = mongoose.model('User', userSchema);

module.exports = User;
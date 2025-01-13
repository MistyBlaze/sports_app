const mongoose = require('mongoose');

const drillSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true
    }
}, {
    timestamps: true
});

const Drill = mongoose.model('Drill', drillSchema);

module.exports = Drill;
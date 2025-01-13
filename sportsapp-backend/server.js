const dotenv = require('dotenv');
const app = require('./src/app');

dotenv.config();

const PORT = process.env.PORT || 5001; // Ensure this is set to 5001

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
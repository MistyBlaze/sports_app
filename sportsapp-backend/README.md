# SportsApp Backend

## Overview
The SportsApp backend is a Node.js application built with Express that provides a RESTful API for a sports application focused on football drills. It includes user authentication, JWT token generation, and endpoints to retrieve drill data.

## Project Structure
```
sportsapp-backend
├── src
│   ├── controllers
│   │   ├── authController.js      # Handles user authentication
│   │   └── drillController.js      # Manages drill data retrieval
│   ├── models
│   │   ├── userModel.js            # User schema for MongoDB
│   │   └── drillModel.js           # Drill schema for MongoDB
│   ├── routes
│   │   ├── authRoutes.js           # Routes for authentication
│   │   └── drillRoutes.js          # Routes for drill data
│   ├── middleware
│   │   └── authMiddleware.js       # Middleware for JWT verification
│   ├── utils
│   │   └── generateToken.js        # Utility for generating JWT tokens
│   └── app.js                      # Initializes the Express app
├── config
│   └── db.js                       # Database connection setup
├── .env                             # Environment variables
├── package.json                     # Project dependencies and scripts
├── README.md                        # Project documentation
└── server.js                        # Entry point for the application
```

## Setup Instructions

1. **Clone the Repository**
   ```
   git clone <repository-url>
   cd sportsapp-backend
   ```

2. **Install Dependencies**
   ```
   npm install
   ```

3. **Configure Environment Variables**
   Create a `.env` file in the root directory and add the following:
   ```
   MONGO_URI=mongodb+srv://<username>:<password>@sportsapp.ytkhs.mongodb.net/sportsapp?retryWrites=true&w=majority
   JWT_SECRET=your-super-secret-key-here
   PORT=5000
   ```

4. **Start the Server**
   ```
   npm start
   ```

## Usage
- **User Signup**: POST `/api/auth/signup` - Register a new user.
- **User Login**: POST `/api/auth/login` - Authenticate a user and receive a JWT token.
- **Get Drills**: GET `/api/drills` - Retrieve a list of available football drills.

## License
This project is licensed under the MIT License.
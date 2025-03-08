require('dotenv').config();
const connectDB = require('./config/database');
const whatsappHandler = require('./handlers/whatsappHandler');

// Connect to MongoDB
connectDB()
    .then(() => {
        console.log('Starting Ampibi AI WhatsApp Bot...');
        
        // Start WhatsApp connection
        whatsappHandler.connect()
            .catch(error => {
                console.error('Failed to start WhatsApp connection:', error);
                process.exit(1);
            });
    })
    .catch(error => {
        console.error('Database connection failed:', error);
        process.exit(1);
    });

// Handle process termination
process.on('SIGINT', async () => {
    console.log('Shutting down gracefully...');
    process.exit(0);
});

// Handle uncaught exceptions
process.on('uncaughtException', (error) => {
    console.error('Uncaught Exception:', error);
});

process.on('unhandledRejection', (error) => {
    console.error('Unhandled Rejection:', error);
});
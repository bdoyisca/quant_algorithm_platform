#!/bin/bash

# Start backend
echo "Starting Python backend..."
python backend/app.py & 
BACKEND_PID=$!

# Start frontend
echo "Starting React frontend..."
cd frontend  # 
npm start &  # 
cd ..
FRONTEND_PID=$!

# Wait
wait $BACKEND_PID $FRONTEND_PID
#!/bin/bash

# Start backend
echo "Starting Python backend..."
source backend/venv/bin/activate
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
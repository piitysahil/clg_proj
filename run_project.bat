@echo off
title Weather Prediction Project Startup
color 0A

echo ===================================================
echo    WEATHER PREDICTION SYSTEM - BCA MAJOR PROJECT
echo ===================================================
echo.

:: Step 1: Check if Python is installed on the College PC
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not installed or not added to PATH on this PC!
    echo Please ensure Python is installed before running.
    pause
    exit /b
)
echo [OK] Python detected.

:: Step 2: Create a Virtual Environment (if it doesn't exist)
if not exist "venv\" (
    echo [INFO] First-time setup: Creating a virtual environment...
    echo This might take a minute...
    python -m venv venv
) else (
    echo [OK] Virtual environment found.
)

:: Step 3: Activate the Virtual Environment
echo [INFO] Activating environment...
call venv\Scripts\activate.bat

:: Step 4: Install/Update Requirements silently
echo [INFO] Installing required libraries (Streamlit, Pandas, etc.)...
pip install -r requirements.txt -q
echo [OK] All dependencies installed.

:: Step 5: Launch the Application
echo.
echo ===================================================
echo Launching the Dashboard... 
echo Please wait for your browser to open.
echo ===================================================
streamlit run weather_app.py

:: Keep the window open just in case Streamlit crashes
pause
# How to Start
1. Clone the project
2. Go to the project folder, setup and activate a virtual environment: `py -m venv .env`, `.\env\Scripts\activate` (Windows)
3. Declare all dependencies: `py -m pip install -r requirements.txt`
4. Microsoft Edge (Chromium) Webdriver to be in PATH or in `.\env\Scripts\` folder. Or specify another Webdriver in `\Resources\POM\Common.robot` file
5. Run `robot -d Results Tests` to execute all Tests
6. Go to `Results` folder to get the HTML Reports
An example of setting up a basic Python API to import/export data from/to Roda and communicate with Google Sheets.

=== "Prerequisites"
    - Install [Python](https://www.python.org){:target="_blank"} (set PATH while installation)
    - Install [VS Code](https://code.visualstudio.com){:target="_blank"}
    - Obtain Google Sheets Credentials (see next Tab)

=== "Google Sheets Credentials"
    
    --8<-- "./docs/snippets/GoogleSheetsCredentials.md"

=== "Create the API"
    - Create a folder for the API (e.g.: c:\dev\roda-api)
    - Open that Folder in VS Code
    - Open Terminal in VS Code and create the python virtual environment
        ```
        python -m venv venv
        ```
    - Run the virtual environment
        ```
        venv\Scripts\activate
        ```
    - Install the required libraries
        ```
        pip install flask gspread oauth2client
        ```
    - Inside your api folder (e.g.: c:\dev\roda-api) create the a python file (e.g.: api.py)
    - Paste in the code and adjust the variables as needed:

        ??? example "api.py"
            
            ```py 
            --8<-- "./docs/snippets/gs_api_example.py"
            ```
    - Run the API
        ```
        python .\api.py
        ```
    - You can now use the endpoints to export/import data in Roda
        - `http://localhost:5000/export`
        - `http://localhost:5000/import`
        - [Test the export](/pages/export/#__tabbed_1_2)
        - Change some data in your spreadsheet and test the import
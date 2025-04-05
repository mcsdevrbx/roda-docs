### Obtaining Google Sheets Credentials File and Required Permissions

1. Create a Google Cloud Project
    - Go to the [Google Cloud Console](https://console.cloud.google.com){:target="_blank"}
    - Sign in with your Google account (ensure it’s the account you’ll use for Google Sheets access).
    - Click the "Select a Project" button (top left) and click "New Project" in the popup.
    - Name your project (e.g., "RodaSheetsAPI"), click "Create," and wait for it to set up.

2. Enable the Google Sheets API
    - In the Google Cloud Console, navigate to "APIs & Services" > "Library".
    - Search for "Google Sheets API", select it, and click "Enable" to activate it for your project.

3. Create a Service Account
    - Go to "APIs & Services" > "Credentials" in the Google Cloud Console.
    - Click "+ Create Credentials" > "Service account".
    - Enter a "Service account name" (e.g., "RodaServiceAccount").
    - Click "Create and Continue".
    - Skip the "Grant this service account access to project" step (optional permissions can be added later if needed).
    - Click "Done" to create the service account.
    - You’ll see the service account listed. Note the email address, you’ll need it later.

4. Generate a JSON Key for the Service Account
    - From the service account list, click on the service account you created.
    - Go to the "Keys" tab, then click "Add Key" > "Create new key".
    - Select "JSON" as the key type and click "Create".
    - A JSON file will download automatically. Save this file securely.
    - This JSON file contains the credentials (client email, private key, etc.) needed for your Python script to authenticate with Google Sheets.

5. Share the Google Sheet with the Service Account
    - Go to [Google Sheets](https://docs.google.com/spreadsheets){:target="_blank"} and create a new file (Blank spreadsheet).
    - Note the sheetId from the url: https://docs.google.com/spreadsheets/d/<span style="color: #93e6fc;">THIS_PART</span>/edit
    - Click the "Share" button (top-right corner).
    - Add the service account email (service account email we noted earlier) as an editor.
    - Set the permission to "Editor"
    - Click "Send" or "Done" to grant access.

6. Required Permissions and Rights
    - Use the scope <span style="color: #93e6fc;">https://www.googleapis.com/auth/spreadsheets</span> for read/write access to Google Sheets.
    - In the Python script (see next Tab), ensure the scope variable includes the above value when authorizing with gspread:

        ```py
        scope = ['https://www.googleapis.com/auth/spreadsheets']
        ```

7. Use the Credentials in the Python Script
    - Update your PATH_CREDENTIALS in the Python script to point to the JSON file’s location (e.g., c:/path_to_creds/credentials_file_we_downloaded_earlier.json).

8. Done
    - Set up the script (next tab) and run your API.
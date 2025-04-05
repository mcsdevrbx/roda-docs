import json  # Imports the JSON library for handling JSON data
import gspread  # Imports the gspread library for interacting with Google Sheets
from flask import Flask, request, jsonify, make_response  # Imports Flask components for creating the API
from oauth2client.service_account import ServiceAccountCredentials  # Imports credentials handler for Google Sheets authentication

# Adjustable variables for users to customize the API
PATH_CREDENTIALS = 'c:/path_to_creds/credentials_file_we_downloaded_earlier.json'  # Set the file path for Google Sheets credentials
SPREADSHEET_KEY = 'SPREADSHEET_ID_HERE'  # Adjust the Google Sheets spreadsheet ID
HOST_PORT = 5000  # Specifies the port number for the Flask app to run on

app = Flask(__name__)  # Creates a Flask application instance for the API

# Set up Google Sheets client for authentication and access
scope = ['https://www.googleapis.com/auth/spreadsheets']  # Defines the scope for Google Sheets API access (read/write)
credentials = ServiceAccountCredentials.from_json_keyfile_name(PATH_CREDENTIALS, scope)  # Loads credentials from the JSON file with the specified scope
gc = gspread.authorize(credentials)  # Authorizes gspread to use the credentials for Google Sheets interactions

# Import Google Sheets data to Roda as JSON via GET request
@app.route('/import', methods=['GET'])
def import_sheets_to_roda():
    print('Importing data from Google Sheets')
    print("\n---------- HTTP Headers ----------")
    print(request.headers)
    
    try:
        sheet = gc.open_by_key(SPREADSHEET_KEY).sheet1  # Opens the Google Sheet using the spreadsheet key and first sheet
        all_data = sheet.get_all_values()  # Retrieves all values from the Google Sheet as a list of rows

        print("\n---------- All Data from Google Sheets ----------")
        print(all_data)

        if all_data:  # Checks if there’s any data in the sheet
            headers = all_data[0]  # Assigns the first row as headers
            data = all_data[1:]  # Assigns remaining rows as data, excluding headers
        else:  # Handles an empty sheet
            headers, data = [], []  # Sets empty lists for headers and data if no data exists
        
        roda_data = []  # Initializes an empty list to hold data
        print("\n---------- Headers ----------")
        print(headers) 

        for row in data:  # Iterates through each row of data
            if len(row) == len(headers) and any(cell.strip() for cell in row):  # Ensures the row length matches headers and contains non-empty data
                row_dict = {headers[i]: row[i] for i in range(len(headers)) if row[i].strip()}  # Creates a dictionary from headers and row values, excluding empty values
                if row_dict:  # Ensures the dictionary isn’t empty
                    roda_data.append(row_dict)  # Adds the dictionary to the Roda data list
        
        print("\n-------------- Roda Data -----------------")
        print(roda_data)

        return jsonify(roda_data), 200  # Returns the Roda data as JSON with a 200 OK status
    except Exception as e:  # Catches any errors during the import process
        return jsonify({'status': 'error', 'message': str(e)}), 500  # Returns an error response with the exception message and a 500 Internal Server Error status

# Export Roda JSON data to Google Sheets via POST request
@app.route('/export', methods=['POST'])
def export_data_to_sheet():
    print("\n---------- HTTP Headers ----------")
    print(request.headers)

    data = request.get_json()  # Retrieves JSON data from the POST request body
    if not data:  # Checks if no data was provided
        return make_response(jsonify({"error": "No data provided"}), 400)  # Returns a 400 Bad Request response if data is missing
    
    try:
        sheet = gc.open_by_key(SPREADSHEET_KEY).sheet1  # Opens the Google Sheet using the default spreadsheet key and first sheet
        sheet.clear()  # Clears all existing data in the sheet before exporting new data

        print("\n---------------- Data for Export ----------------")
        print(data)

        # Standardize data format
        if isinstance(data, dict):  # Checks if the data is a dictionary
            data = list(data.values())  # Converts the dictionary values into a list of dictionaries for processing

        if isinstance(data, list) and all(isinstance(item, dict) for item in data):  # Ensures data is a list of dictionaries
            headers = sorted(data[0].keys()) if data else []  # Extracts and sorts headers from the first dictionary, or sets empty if no data
            print("\n-------------- Headers -----------------")
            print(headers)

            rows = [[item.get(header, "") for header in headers] for item in data]  # Creates a list of rows from the data, filling missing values with empty strings
            print("\n-------------- Rows -----------------")
            print(rows)
        else:  # Handles invalid data format
            return make_response(jsonify({"error": "Invalid data format"}), 400)  # Returns a 400 Bad Request response if data format is wrong

        # Prepare complete data to upload in one call
        complete_data = [headers] + rows  # Combines headers and rows into a single list for Google Sheets
        sheet.append_rows(complete_data, value_input_option='USER_ENTERED')  # Appends all rows to the Google Sheet, preserving formats as entered by a user

        return jsonify({"success": True, "message": "Data exported successfully"})  # Returns a success response with a confirmation message
    except Exception as e:  # Catches any errors during the export process
        return jsonify({'status': 'error', 'message': str(e)}), 500  # Returns an error response with the exception message and a 500 Internal Server Error status

if __name__ == '__main__':  # Entry point for running the Flask app
    app.run(debug=True, port=HOST_PORT)  # Starts the Flask application in debug mode on the specified port
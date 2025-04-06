---
icon: bootstrap/file-earmark-arrow-up
---

On the Export page, data files can be exported in multiple ways.

- Select a data file that you want to export

=== "DataStore"
    ![Export to DataStore](/roda-docs/img/export-datastore.gif){ width="406" class="center" data-caption-position="top" data-title="Export to DataStore" data-description="" }

    - Enter new or existing DataStore name
    - Enter new or existing Key
    - Click "Export" 

    !!! note "Tip"
        To quickly check the saved data, you can use the Roda Tool "Get DataStore Data". Insert the Datastore name and click "Print".

=== "API"
    ![Export to API](/roda-docs/img/export-api.gif){ width="406" class="center" data-caption-position="top" data-title="Export to API" data-description="" }

    - Select JSON or CSV as Format
    - Enter the URL of your API's export route
    - Optionally, add custom HTTP headers if needed
    - Click "POST"


    ??? note "Outgoing Data Examples"
        - JSON
        ```json
        [
            {
                "id": 1,
                "miningTime": 0.375,
                "salvageableMats": "",
                "upgradePathId": 12
                "isUpgradable": true,
            },
            {
                "id": 2,
                "miningTime": 1.25,
                "salvageableMats": "",
                "upgradePathId": 14
                "isUpgradable": true,
            }
        ]

        ```

        - CSV
        ```csv
        id;miningTime;salvageableMats;upgradePathId;isUpgradable
        1;0.375;;12;true
        2;1.25;;14;true

        ```

    !!! note "Set up an API"
        If you need help creating an API, check out: [Example - Google Sheets API](/roda-docs/pages/examples-export-import-gs)

=== "File"
    ![Export to File](/roda-docs/img/export-file.gif){ width="406" class="center" data-caption-position="top" data-title="Export to File" data-description="" }
    
    - Select JSON or CSV as Format and click "Export"
        - The exported file will be parented to the selected data file.
        - The exported file is a ModuleScript with a string of either JSON or CSV data.
    
    !!! note "CSV Delimiter"
        The CSV delimiter can be edited in [Global Settings](/roda-docs/pages/global-settings/)
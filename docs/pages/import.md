---
icon: bootstrap/file-earmark-arrow-down
---

On the Import page, data files can be imported in multiple ways.

- Select a data file that you want to import data into

=== "DataStore"
    ![Import from DataStore](/roda-docs/img/import-datastore.gif){ width="406" class="center" data-caption-position="top" data-title="Import from DataStore" data-description="" }

    - Enter an existing DataStore name
    - Enter an existing Key
    - Click "Import"

=== "API"
    ![Import from API](/roda-docs/img/import-api.gif){ width="406" class="center" data-caption-position="top" data-title="Import from API" data-description="" }

    - Select JSON or CSV as Format
    - Enter the URL of your API's import route
    - Optionally, add custom HTTP headers if needed
    - Click "GET"

    ??? note "Expected Data Example"
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
    ![Import from File](/roda-docs/img/import-file.gif){ width="406" class="center" data-caption-position="top" data-title="Import from File" data-description="" }
    
    - Select the Format
    - Select a file in the Explorer that contains the data you want to import
    - Click "Pick" to set it and finally click "Import"
        
    
    !!! note "CSV Delimiter"
        The CSV delimiter can be edited in [Global Settings](/roda-docs/pages/global-settings/)
    
    ??? note "Side Effect..."
        A side effect of importing a ModuleScript is that it can essentially act as a script executor. For instance, if this were the content of the ModuleScript you’re importing:
            ```luau
            local module = {}

            local function doSomething()
                print("This can be used as a script runner...")
            end

            doSomething()

            return module
            ```
        Alongside a warning indicating that no data can be imported, you’ll see this message printed in the Studio Output: 'This can be used as a script runner...'

        No data would be imported into the selected target data file, so it remains unchanged. However, because ```require()``` is called on the ModuleScript you’re importing, its code will execute. This allowes you to run custom scripts or functions in Studio. :bootstrap-exclamation-triangle-fill:{ .exclamation-triangle } That said, be careful not to select a file that could potentially harm your code or project when executed with require().
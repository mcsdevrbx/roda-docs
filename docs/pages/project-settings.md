---
icon: bootstrap/gear
---

---

### Project Name and Icon

You can edit both the project name and icon.

![Edit Project Name and Icon](/roda-docs/img/edit-project-name-icon.gif){ width="600" class="center" data-caption-position="top" data-title="Project Name and Icon" data-description="You can edit both the project name and icon." }

---

### Adding a Data File Configuration
To add a data file configuration, 

- create a ModuleScript in Studio to serve as the data file (source file).
- Name the ModuleScript as you like. 
- Then click the <img src="/roda-docs/img/add-button-s.png" alt="Plus Button" width="60" class="skip-lightbox"> button in the "Data File Configs" section. 
- And finally select the data file configuration and (with the ModuleScript selected in Explorer) click <img src="/roda-docs/img/pick-button.png" alt="Pick Button" width="70" class="skip-lightbox"> to set the path to the selceted file.

![Adding a Data File Configuration](/roda-docs/img/add-datafile-config.gif){ width="600" class="center" data-caption-position="top" data-title="Adding a Data File Configuration" data-description=".desc-add-data-file-configuration" }

<div class="glightbox-desc desc-add-data-file-configuration">
  <p>To add a data file configuration, </p>
  <p>- create a ModuleScript in Studio to serve as the data file (source file).</p>
  <p>- Name the ModuleScript as you like.</p>  
  <p>- Then click the + button in the 'Data File Configs' section. </p>  
  <p>- And finally select the data file configuration and (with the ModuleScript selected in Explorer) click 'Pick' to set the path to the selceted file.</p>  
</div>

!!! note "Important Notes"
    Once set, the data file path cannot be changed. To use a different data file, you must delete the data file configuration and create a new one.
    When you "Pick" a selected ModuleScript in the Explorer, its contents will be backed up (if enabled in [Global Settings](/roda-docs/pages/global-settings/)) and cleared. If the file is already in use in another data
    file configuration, you cannot set it here - a warning will appear in the Studio output, indicating which project and data file configuration is using it.

--- 

### Specifying the Table Type
After setting the data file, you need to specify its table type. By default, Array is selected.

- Array: Refers to a sequential Lua table.
- Dict: Represents a dictionary or hashmap structure (with only strings available as primary keys).

![Table Type](/roda-docs/img/select-table-type.gif){ width="600" class="center" data-caption-position="top" data-title="Specifying the Table Type" data-description=".desc-table-type" }

<div class="glightbox-desc desc-table-type">
  <p>After setting the data file, you need to specify its table type. By default, Array is selected.</p>
  <p>- Array: Refers to a sequential Lua table.</p>
  <p>- Dict: Represents a dictionary or hashmap structure (with only strings available as primary keys).</p>  
  </br>  
  <p>Please note that this setting cannot be changed later. Once the first property is created, the table type is locked.</p>  
</div>

!!! note "Important Notes"
    This setting cannot be changed later. Once the first property is created, the table type is locked.

--- 

### Setting a Secondary Data File `optional`
You can set a secondary data file. The data from the main file will also be written to this additional one.

![Secondary Data File](/roda-docs/img/select-additional-df.gif){ width="600" class="center" data-caption-position="top" data-title="Secondary Data File" data-description="You can set a secondary data file. The data from the main file will also be written to this additional one." }

---

### Setting an Image Pool `optional`
You can set an image pool, which can be:

- A ModuleScript containing image IDs.
- Or a folder containing Decals, ImageLabels, Textures or ModuleScripts (containing image IDs).

After creating an image property in the data file settings (add a property, set its data type to string, and choose 'T.Box with Image Selection' as the UI Element), you can quickly assign images to items on the editor page.

![Image Pool](/roda-docs/img/set-image-pool.gif){ width="600" class="center" data-caption-position="top" data-title="Image Pool" data-description=".desc-image-pool" }

<div class="glightbox-desc desc-image-pool">
  <p>You can set an image pool, which can be:</p>
  <p>- A ModuleScript containing image IDs.</p>
  <p>- Or a folder containing Decals, ImageLabels, Textures or ModuleScripts (containing image IDs).</p>
  <p>After creating an image property in the data file settings (add a property, set its data type to string, and choose 'T.Box with Image Selection' as the UI Element), you can quickly assign images to items on the editor page.</p>
</div>


---  

### Adding Properties
You can add properties to the data file configuration in several ways:

- Click the <img src="/roda-docs/img/add-button-s.png" alt="Plus Button" width="60" class="skip-lightbox"> button in the "Data File Settings" section, then specify the key name, value data type, default value and UI element.
![Add Properties Manually](/roda-docs/img/add-prop-manually.gif){ width="600" class="center" data-caption-position="top" data-title="Adding Properties" data-description="Click the '+' button in the 'Data File Settings' section, then specify the key name, value data type, default value and UI element." }

- From Common Game-Related Properties - Select from a collection of pre-defined, game-related properties.
![Common Game-Related Properties](/roda-docs/img/add-prop-f-collection.gif){ width="600" class="center" data-caption-position="top" data-title="Adding Properties from collection" data-description="Select from a collection of pre-defined, game-related properties." }

- By Parsing Code: Import properties by parsing existing Lua code, such as an item table with multiple properties, to quickly add them.
![Parsing Code](/roda-docs/img/add-prop-f-code.gif){ width="600" class="center" data-caption-position="top" data-title="Adding Properties by parsing code" data-description="Import properties by parsing existing Lua code, such as an item table with multiple properties, to quickly add them." }


!!! note "Editing Properties"
    You can reorder properties, which affects how items are displayed in the editable area and in the tabs on the Editor page. Note that only the first four properties of each item are visible in the tabs.

    You can also edit properties even after adding items to the data file. However, exercise caution, as this can lead to data loss in the current source file (though data is backed up if enabled in [Global Settings](/roda-docs/pages/global-settings/)). For example:

    If you rename the key of a property, all values associated with that key in the source file will be reset to their default values, and the previous key’s values will be removed. Changing primary keys can be particularly problematic, potentially requiring tedious data restoration. Be especially careful with these changes.

!!! note "Naming Keys"    
    Key names can only contain letters (A-Z, a-z), digits (0-9), and underscores, and cannot start with a digit. [More info](https://create.roblox.com/docs/luau/variables#name-variables){:target="_blank"}

!!! note "Values"    
    - String values (on the Edit page) may include any characters except for square brackets -> [ ]
    - In the Data File Settings, default values for properties with string value types are additionally restricted from using " and \ characters.

---

### Dropdown Properties
When you choose Dropdown as a UI Element of a property, you must also define its source. The source can be either:

- A list of manually defined values

![Dropdown Source](/roda-docs/img/dd-source-fixed-list.gif){ width="600" class="center" data-caption-position="top" data-title="Dropdown Source" data-description="Fixed List" }

- Or a reference to another data file’s key (acting as a foreign key), drawing its options from the values created in that other file.

![Dropdown Source](/roda-docs/img/dd-source-from-df.gif){ width="600" class="center" data-caption-position="top" data-title="Dropdown Source" data-description="From Data File" }

</br>

#### Display Dropdown as a Tab
For Dropdown UI Elements, there’s an option in the "Data File Settings" to display them as additional tabs on the editor page. This feature allows you to click on a value within the tab to list all associated items.

![Display as Tab](/roda-docs/img/dd-display-as-tab.gif){ width="600" class="center" data-caption-position="top" data-title="Display Dropdown as a Tab" data-description="For Dropdown UI Elements, there’s an option in the 'Data File Settings' to display them as additional tabs on the editor page. This feature allows you to click on a value within the tab to list all associated items." }

---


### Copying an Existing Data File Configuration
You can copy an existing data file configuration from any project. This process:

- Backs up the current data file source (if enabled in [Global Settings](/roda-docs/pages/global-settings/)) and clears it.
- Imports the properties and table type (Array or Dict) from the copied data file.
- Retains other settings, such as the selected data file source, additional data file, and image pool, as they are.

This feature is useful for organizational purposes, such as splitting a main items table into separate data files (e.g., weapons, consumables) while maintaining identical properties that can be combined into a single table at runtime. It can also serve as a templating tool — for example, creating a template for NPCs and copying it wherever needed.

![Copy DF Config](/roda-docs/img/copy-df-config.gif){ width="600" class="center" data-caption-position="top" data-title="Copying an Existing Data File Configuration" data-description="This feature is useful for organizational purposes, such as splitting a main items table into separate data files (e.g., weapons, consumables) while maintaining identical properties that can be combined into a single table at runtime. It can also serve as a templating tool — for example, creating a template for NPCs and copying it wherever needed." }

---

### Backing Up the Data File
You can manually back up the data file by clicking the "Backup Data File" button. This creates a backup of the actual data (not the configuration) and saves it to the specified folder (default: ServerStorage.Backup, editable in [Global Settings](/roda-docs/pages/global-settings/)).

<img class ="center" src="/roda-docs/img/backup-df.png" alt="Home Page" width="264">

---

### Backing Up the Project
You can save the entire project configuration, including all data file configurations (but not the source files data) to the DataStore.

<img class ="center" src="/roda-docs/img/save-project.png" alt="Home Page" width="264">

!!! note
    The experience must be saved to Roblox, and Studio API services must be enabled in the game settings.

This feature is designed to synchronise project configurations in Team Create or between different machines: [Load Project from DataStore](/roda-docs/pages/home/#load-project-from-datastore)

---

### Delete Data File Configuration / Project
 - Delete the Data File Configuration
 
 <img class ="center" src="/roda-docs/img/delete-df.png" alt="Data File Configuration Button" width="264">

 - Delete the Project including all Data File Configurations
 
 <img class ="center" src="/roda-docs/img/delete-project.png" alt="Delete Project Button" width="264">

!!! note
    In both cases only the configuration is removed. The source data files remain untouched.

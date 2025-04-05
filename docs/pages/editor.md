---
icon: bootstrap/pencil-square
---


### Edit Data

- This is where you can edit data, including adding, modifying, deleting, and restoring items.

![Edit Data](/img/editor-basic-overview.gif){ width="600" class="center" data-caption-position="top" data-title="Edit Data" data-description="This is where you can edit data, including adding, modifying, deleting, and restoring items." }

!!! note "Restore Items"
    Deleted items are stored in a dedicated table linked to the data file configuration. However, if any property in the data file configuration is modified, the deleted items table for that configuration will be cleared to prevent conflicts.
    
??? note "Data File Size Limitation"
    ### Data File Size Limitation
    - Data files (ModuleScripts) are limited to 200,000 characters due to Roblox’s [StringValue](https://create.roblox.com/docs/reference/engine/classes/StringValue){:target="_blank"} constraint. This cap applies when programmatically setting the source of a ModuleScript as items are added, modified, or removed. However, 200,000 characters are typically more than sufficient and won’t be a problem in most scenarios. 
    - To overcome this limit if needed, consider organizing your data by splitting items into different data files based on categories (e.g., weapons, armor, food) with identical properties, then combining them into a single table at game runtime using Lua scripts. For example, you could create separate data files like WeaponsData, ArmorData, and FoodData, each with properties like name, value, type, ... and use a script to merge them into a unified ItemsTable on game start.
    - You can temporarily exceed 100% of the 200,000-character limit during plugin runtime. However, any data beyond this threshold will not be written to the ModuleScript and will be lost when Studio restarts. Warnings will appear in the Studio output to indicate this issue.

---

### Search

- The search tab on the Editor page lets you find items in your data file. Set conditions by using logical (AND/OR) and relational operators (e.g., ==, >, <) and insert the values to find matching items.

![Search Tab](/img/editor-search-tab.gif){ width="600" class="center" data-caption-position="top" data-title="Search Tab" data-description="The search tab on the Editor page lets you filter items in your data file by properties, using logical (AND/OR) and relational operators (e.g., ==, >, <). It quickly finds matching items saving time and boosting efficiency. Customize searches with multiple conditions for precise results, perfect for managing complex in-game data." }

---

### Tabs

- For Dropdown UI Elements, there’s an option in the 'Data File Settings' to display them as additional tabs on the editor page. This feature allows you to click on a value within the tab to list all associated items.

![Display as Tab](/img/dd-display-as-tab.gif){ width="600" class="center" data-caption-position="top" data-title="Display Dropdown as a Tab" data-description="For Dropdown UI Elements, there’s an option in the 'Data File Settings' to display them as additional tabs on the editor page. This feature allows you to click on a value within the tab to list all associated items." }
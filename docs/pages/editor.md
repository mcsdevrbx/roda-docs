---
icon: bootstrap/pencil-square
---


### Edit Data

- This is where you can edit data, including adding, modifying, deleting, and restoring items.

![Edit Data](/roda-docs/img/editor-basic-overview.gif){ width="600" class="center" data-caption-position="top" data-title="Edit Data" data-description="This is where you can edit data, including adding, modifying, deleting, and restoring items." }

!!! note "Restore Items"
    Deleted items are stored in a dedicated table linked to the data file configuration. However, if any property in the data file configuration is modified, the deleted items table for that configuration will be cleared to prevent conflicts.

--

### Search

- The search tab on the Editor page lets you find items in your data file. Set conditions by using logical (AND/OR) and relational operators (e.g., ==, >, <) and insert the values to find matching items.

![Search Tab](/roda-docs/img/editor-search-tab.gif){ width="600" class="center" data-caption-position="top" data-title="Search Tab" data-description="The search tab on the Editor page lets you filter items in your data file by properties, using logical (AND/OR) and relational operators (e.g., ==, >, <). It quickly finds matching items saving time and boosting efficiency. Customize searches with multiple conditions for precise results, perfect for managing complex in-game data." }

---

### Tabs

- For Dropdown UI Elements, there’s an option in the 'Data File Settings' to display them as additional tabs on the editor page. This feature allows you to click on a value within the tab to list all associated items.

![Display as Tab](/roda-docs/img/dd-display-as-tab.gif){ width="600" class="center" data-caption-position="top" data-title="Display Dropdown as a Tab" data-description="For Dropdown UI Elements, there’s an option in the 'Data File Settings' to display them as additional tabs on the editor page. This feature allows you to click on a value within the tab to list all associated items." }
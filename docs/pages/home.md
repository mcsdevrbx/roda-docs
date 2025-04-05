---
icon: bootstrap/house
---

### New Project

- Enter a name for your project in the provided field.
- Press "Enter" or click the <img src="/roda-docs/img/add-button-s.png" alt="Plus Button" width="60" class="skip-lightbox"> button to create the project.

![New Project](/roda-docs/img/new-project.gif){ width="600" class="center" data-caption-position="top" data-title="New Project" data-description="Enter a name for your project in the provided field and hit 'Enter' or click the + Button to create a new project." }

---

### Load Project from DataStore
The Load Project from DataStore feature in Roda enables you to manage and synchronize project configurations across different scenarios, ensuring flexibility in both solo and collaborative workflows. Below are the two primary use cases:

- #### Synchronize Configurations in Team Create
Manual synchronization of project configurations among developers in Team Create. When working collaboratively, developers can [save the Project Settings](/pages/project-settings#backing-up-the-project) to the DataStore and share them with the team. Other developers can then load these settings to align their configurations, ensuring consistency across the team. Once all team members share the same project configuration, any changes to data file configurations or edits to the data itself are automatically synced to everyone. This means that if one developer updates a configuration or modifies data, those updates are reflected for all other team members with the same project setup. The initial sharing of the project configuration is done manually, but after that, the plugin handles synchronization automatically.

- #### Transfer Project Configurations Between Machines
This also enables you to transfer a project configuration between different computers. All settings are stored locally, and every project is accessible across all experiences. If you work on multiple machines and need to access a specific project on another computer, you can [save the Project Settings](/pages/project-settings#backing-up-the-project) to the DataStore from your initial machine and then load them on the second machine within the same Roblox experience.
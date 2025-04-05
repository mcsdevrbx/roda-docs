This section provides a beginner-friendly example of using a ModuleScript in Roblox as a simple database for storing and managing game data, demonstrating how to set up, populate, and interact with data in a Roblox game.


- <img src="/roda-docs/img/Roblox_Studio_logo.svg" alt="Roda Logo" width="20" class="skip-lightbox"> Create a new expirience in Roblox Studio
- <img src="/roda-docs/img/Roblox_Studio_logo.svg" alt="Roda Logo" width="20" class="skip-lightbox"> Create a ModuleScript in ServerStorage and name it "Items"
- <img src="/roda-docs/img/roda_logo_lightgray.svg" alt="Roda Logo" width="20" class="skip-lightbox"> Create a new Project in Roda
- <img src="/roda-docs/img/roda_logo_lightgray.svg" alt="Roda Logo" width="20" class="skip-lightbox"> Create a new Data File Configuration
- <img src="/roda-docs/img/roda_logo_lightgray.svg" alt="Roda Logo" width="20" class="skip-lightbox"> Pick the Items ModuleScript as the Data File
- <img src="/roda-docs/img/roda_logo_lightgray.svg" alt="Roda Logo" width="20" class="skip-lightbox"> Set the Table Type to Dict
- <img src="/roda-docs/img/roda_logo_lightgray.svg" alt="Roda Logo" width="20" class="skip-lightbox"> Add properties to the Data File Settings
    - <img src="/roda-docs/img/roda_logo_lightgray.svg" alt="Roda Logo" width="20" class="skip-lightbox"> Click "Add From Code", paste the following Lua snippet, and click "Parse":
        ```luau
        name = "name"
        value = 0
        image = "image"
        ```
    - <img src="/roda-docs/img/roda_logo_lightgray.svg" alt="Roda Logo" width="20" class="skip-lightbox"> Set the UI Element of image property to "T.Box with Image Selection"
- <img src="/roda-docs/img/Roblox_Studio_logo.svg" alt="Roda Logo" width="20" class="skip-lightbox"> Upload some images (if you don’t have any, find free images on websites like [Craftpix](https://craftpix.net/freebies/filter/free-icons-for-games/){:target="_blank"})
- <img src="/roda-docs/img/Roblox_Studio_logo.svg" alt="Roda Logo" width="20" class="skip-lightbox"> Insert the images and move them into a Folder
- <img src="/roda-docs/img/roda_logo_lightgray.svg" alt="Roda Logo" width="20" class="skip-lightbox"> Set this Folder as Image Pool in the Data File Settings
- <img src="/roda-docs/img/roda_logo_lightgray.svg" alt="Roda Logo" width="20" class="skip-lightbox"> Add some items on the Editor Page
- <img src="/roda-docs/img/Roblox_Studio_logo.svg" alt="Roda Logo" width="20" class="skip-lightbox"> Create the scripts, run the game, stop, edit items, run again...

    === ":bootstrap-file-earmark-code-fill: Script.lua"

        ```luau title="ServerScriptService.Script"

        --8<-- "./docs/snippets/ServerScriptService.Script.lua"

        ```

    === ":bootstrap-file-earmark-code-fill:{ .local-script } LocalScript.lua"

        ```luau title="StarterPlayer.StarterPlayerScripts.LocalScript"
        
        --8<-- "./docs/snippets/StarterPlayer.StarterPlayerScripts.LocalScript.lua"

        ```

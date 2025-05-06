To ensure compatibility with Roblox [DataStore](https://create.roblox.com/docs/reference/engine/classes/DataStore){:target="_blank"}, Roda only supports primitive data types (strings, numbers, booleans). Having nested tables and complex types at runtime in your table can be achieved very easy using the provided [code generation](/roda-docs/pages/project-settings#generating-table-assembler-code).

If for some reasons you don't want to use the code generation, here are some basic examples of converting primitives into complex Roblox types. 

### Color3

=== ":bootstrap-file-earmark-code-fill: Server.lua"

    ```luau title="Script"

    local colors = require(game.ReplicatedStorage.Colors)   -- Adjust as needed
    local items = require(game.ReplicatedStorage.Items)     -- Adjust as needed

    for _, item in pairs(items) do    
        local colorData = colors[item.colorKey] or error("Color not found: " .. item.colorKey)
        
        item.color = Color3.fromRGB(colorData.R, colorData.G, colorData.B) 
    end

    ```

=== ":bootstrap-file-earmark-code-fill:{ .module-script } Items.lua"

    ```luau title="ModuleScript"

    local items = {
        {
            id = 1,
            colorKey = "orange",
            -- ..
        },
    }

    return items

    ```

=== ":bootstrap-file-earmark-code-fill:{ .module-script } Colors.lua"

    ```luau title="ModuleScript"

    local colors = {
        ["orange"] = {
            colorKey = "orange",
            R = 255,
            G = 176,
            B = 0,
        },
    }

    return colors

    ```

---

### Vector3

=== ":bootstrap-file-earmark-code-fill: Server.lua"
    
    ```luau title="Script"

    local positions = require(game.ReplicatedStorage.Positions) -- Adjust as needed
    local items = require(game.ReplicatedStorage.Items)         -- Adjust as needed

    for _, item in pairs(items) do    
        local pos = positions[item.posKey] or error("Position not found: " .. item.posKey)

        item.position = Vector3.new(pos.X, pos.Y, pos.Z)
    end

    ```

=== ":bootstrap-file-earmark-code-fill:{ .module-script } Items.lua"

    ```luau title="ModuleScript"
    
    local items = {
        {
            id = 1,
            posKey = "startPosition",
            -- ..
        },
        {
            id = 2,
            posKey = "endPosition",
            -- ..
        },
    }

    return items

    ```

=== ":bootstrap-file-earmark-code-fill:{ .module-script } Positions.lua"

    ```luau title="ModuleScript"

    local positions = {
        ["startPosition"] = {
            posKey = "startPosition",
            X = 10,
            Y = 5,
            Z = 0,
        },
        ["endPosition"] = {
            posKey = "endPosition",
            X = 15,
            Y = 8,
            Z = 0,
        },
    }

    return positions

    ```

---

### Vector2

=== ":bootstrap-file-earmark-code-fill: Server.lua"

    ```luau title="Script"
 
    local sizes = require(game.ReplicatedStorage.Sizes)      -- Adjust as needed
    local items = require(game.ReplicatedStorage.Items)      -- Adjust as needed

    for _, item in pairs(items) do    
        local sizeData = sizes[item.sizeKey] or error("Size not found: " .. item.sizeKey)
        
        item.size = Vector2.new(sizeData.X, sizeData.Y) 
    end

    ```

=== ":bootstrap-file-earmark-code-fill:{ .module-script } Items.lua"

    ```luau title="ModuleScript"
     
    local items = {
        {
            id = 1,
            sizeKey = "uiSize",
            -- ..
        },
        {
            id = 2,
            sizeKey = "iconSize",
            -- ..
        },
    }

    return items

    ```

=== ":bootstrap-file-earmark-code-fill:{ .module-script } Sizes.lua"

    ```luau title="ModuleScript"
     
    local sizes = {
        ["uiSize"] = {
            sizeKey = "uiSize",
            X = 50,
            Y = 100,
        },
        ["iconSize"] = {
            sizeKey = "iconSize",
            X = 30,
            Y = 30,
        },
    }

    return sizes

    ```

---

### UDim2

=== ":bootstrap-file-earmark-code-fill: Server.lua"

    ```luau title="Script"

    local uiSizes = require(game.ReplicatedStorage.UISizes) -- Adjust as needed
    local items = require(game.ReplicatedStorage.Items)     -- Adjust as needed

    for _, item in pairs(items) do    
        local sizeData = uiSizes[item.sizeKey] or error("UISize not found: " .. item.sizeKey)
        
        item.size = UDim2.new(sizeData.ScaleX, sizeData.OffsetX, sizeData.ScaleY, sizeData.OffsetY) 
    end

    ```

=== ":bootstrap-file-earmark-code-fill:{ .module-script } Items.lua"

    ```luau title="ModuleScript"

    local items = {
        {
            id = 1,
            sizeKey = "buttonSize",
            -- ..
        },
        {
            id = 2,
            sizeKey = "panelSize",
            -- ..
        },
    }

    return items

    ```

=== ":bootstrap-file-earmark-code-fill:{ .module-script } UISizes.lua"

    ```luau title="ModuleScript"

    local uiSizes = {
        ["buttonSize"] = {
            sizeKey = "buttonSize",
            ScaleX = 0.5,
            ScaleY = 0.5,
            OffsetX = 0,
            OffsetY = 0,
        },
        ["panelSize"] = {
            sizeKey = "panelSize",
            ScaleX = 0.8,
            ScaleY = 0.8,
            OffsetX = 0,
            OffsetY = 0,
        },
    }

    return uiSizes

    ```

---

### UDim

=== ":bootstrap-file-earmark-code-fill: Server.lua"

    ```luau title="Script"

    local uiScales = require(game.ReplicatedStorage.UIScales)   -- Adjust as needed
    local items = require(game.ReplicatedStorage.Items)         -- Adjust as needed

    for _, item in pairs(items) do    
        local scaleData = uiScales[item.scaleKey] or error("UIScale not found: " .. item.scaleKey)
        
        item.size = UDim.new(scaleData.Scale, scaleData.Offset) 
    end

    ```

=== ":bootstrap-file-earmark-code-fill:{ .module-script } Items.lua"

    ```luau title="ModuleScript"

    local items = {
        {
            id = 1,
            scaleKey = "buttonScale",
            -- ..
        },
        {
            id = 2,
            scaleKey = "panelScale",
            -- ..
        },
    }

    return items

    ```

=== ":bootstrap-file-earmark-code-fill:{ .module-script } UIScales.lua"

    ```luau title="ModuleScript"

    local uiScales = {
        ["buttonScale"] = {
            scaleKey = "buttonScale",
            Scale = 0.5,
            Offset = 0,
        },
        ["panelScale"] = {
            scaleKey = "panelScale",
            Scale = 0.8,
            Offset = 0,
        },
    }

    return uiScales

    ```

---

### CFrame

=== ":bootstrap-file-earmark-code-fill: Server.lua"

    ```luau title="Script"

    local cFrames = require(game.ReplicatedStorage.CFrames)   -- Adjust as needed
    local items = require(game.ReplicatedStorage.Items)       -- Adjust as needed

    for _, item in pairs(items) do    
        local cFrameData = cFrames[item.cFrameKey] or error("CFrame not found: " .. item.cFrameKey)
        
        item.cFrame = CFrame.new(cFrameData.PositionX, cFrameData.PositionY, cFrameData.PositionZ) 
            * CFrame.fromEulerAngles(math.rad(cFrameData.RotationX), math.rad(cFrameData.RotationY), math.rad(cFrameData.RotationZ)) 
    end

    ```

=== ":bootstrap-file-earmark-code-fill:{ .module-script } Items.lua"

    ```luau title="ModuleScript"

    local items = {
        {
            id = 1,
            cFrameKey = "objectPosition1",
            -- ..
        },
        {
            id = 2,
            cFrameKey = "objectPosition2",
            -- ..
        },
    }

    return items

    ```

=== ":bootstrap-file-earmark-code-fill:{ .module-script } CFrames.lua"

    ```luau title="ModuleScript"

    local cFrames = {
        ["objectPosition1"] = {
            cFrameKey = "objectPosition1",
            PositionX = 0,
            PositionY = 5,
            PositionZ = 0,
            RotationX = 45, -- In degrees
            RotationY = 0,
            RotationZ = 0,
        },
        ["objectPosition2"] = {
            cFrameKey = "objectPosition2",
            PositionX = 10,
            PositionY = 8,
            PositionZ = 5,
            RotationX = 0,
            RotationY = 0,
            RotationZ = 90, -- In degrees
        },
    }

    return cFrames

    ```
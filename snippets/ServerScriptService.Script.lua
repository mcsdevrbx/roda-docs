-- Load the items data from a ModuleScript located in ServerStorage
local items = require(game.ServerStorage.Items)

-- Create a RemoteEvent for clients to request the items table from the server
local GetItems = Instance.new("RemoteEvent") -- Creates a new RemoteEvent object
GetItems.Name = "GetItems" -- Names it "GetItems" for identification
GetItems.Parent = game.ReplicatedStorage -- Places it in ReplicatedStorage for server-client communication

-- Create a new RemoteEvent for notifying clients when an item is collected
local ItemCollected = Instance.new("RemoteEvent") -- Creates another RemoteEvent object
ItemCollected.Name = "ItemCollected" -- Names it "ItemCollected" for item collection events
ItemCollected.Parent = game.ReplicatedStorage -- Places it in ReplicatedStorage for server-client communication

-- Handle client requests for the items table
GetItems.OnServerEvent:Connect(function(player) -- Listens for when a client fires this event
	GetItems:FireClient(player, items) -- Sends the items table back to the requesting client
end)

-- System to spawn spheres with GUIs and handle item collection
local spawnAreaSize = 50 -- Defines the size of the 50x50 stud area where spheres spawn
local spawnPoint = game.Workspace:WaitForChild("SpawnLocation").Position or Vector3.new(0, 0, 0) -- Gets the position of SpawnLocation or defaults to (0, 0, 0) if not found
local maxSpheres = 200 -- Sets the maximum number of spheres allowed in the game at once
local sphereCount = 0 -- Tracks the current number of active spheres

-- List of colors for the spheres
local colors = {
	Color3.fromRGB(255, 99, 51), -- Bright red-orange
	Color3.fromRGB(255, 105, 180), -- Hot pink
	Color3.fromRGB(144, 238, 144), -- Light green
	Color3.fromRGB(230, 69, 217), -- Bright purple
	Color3.fromRGB(255, 165, 0), -- Orange
	Color3.fromRGB(255, 255, 62), -- Bright yellow
	Color3.fromRGB(30, 51, 240), -- Deep blue
	Color3.fromRGB(88, 255, 249), -- Cyan
}

-- Create a table of item names (keys) for random selection from the items dictionary
local itemNames = {} -- Initializes an empty table to store item names
for name, _ in pairs(items) do -- Loops through the items dictionary to get all keys (item names)
	table.insert(itemNames, name) -- Adds each item name to the itemNames table
end

-- Function to spawn a sphere with an invisible outer sphere for touch detection
local function spawnSphere()
	if sphereCount >= maxSpheres then
		return
	end -- Stops spawning if the maximum number of spheres is reached

	local randomItemName = itemNames[math.random(1, #itemNames)] -- Randomly selects an item name from the list
	local item = items[randomItemName] or error("Item not found: " .. randomItemName) -- Gets the item data or throws an error if not found

	local shapes = { -- List of possible shapes for the sphere
		Enum.PartType.Ball,
		Enum.PartType.Block,
		Enum.PartType.Cylinder,
		Enum.PartType.Wedge,
		Enum.PartType.CornerWedge,
	}
	local randomShape = shapes[math.random(1, #shapes)] -- Randomly picks a shape from the list
	local randomColor = colors[math.random(1, #colors)] -- Randomly picks a color from the colors list

	-- Create the visible inner sphere (small, colored)
	local innerSphere = Instance.new("Part") -- Creates a new Part for the visible sphere
	innerSphere.Shape = randomShape -- Sets the shape to a random type (e.g., Ball, Block)
	innerSphere.Size = Vector3.new(1, 1, 1) -- Sets a small size for the visible sphere
	innerSphere.Position = Vector3.new( -- Sets a random position within the spawn area
		spawnPoint.X + math.random(-spawnAreaSize / 2, spawnAreaSize / 2), -- Random X position
		spawnPoint.Y + math.random(5, 25), -- Random Y position (5 to 25 studs above ground) for dropping
		spawnPoint.Z + math.random(-spawnAreaSize / 2, spawnAreaSize / 2) -- Random Z position
	)
	innerSphere.Anchored = false -- Allows the sphere to fall due to physics
	innerSphere.BrickColor = BrickColor.new(randomColor) -- Applies a random color
	innerSphere.Parent = game.Workspace -- Places the sphere in the Workspace for visibility

	-- Create an invisible outer sphere for touch detection (larger, transparent)
	local outerSphere = Instance.new("Part") -- Creates a new Part for the invisible touch detection
	outerSphere.Shape = Enum.PartType.Ball -- Uses a Ball shape for consistent touch detection
	outerSphere.Size = Vector3.new(5, 5, 5) -- Sets a larger size for the touch area
	outerSphere.Position = innerSphere.Position -- Matches the position of the inner sphere
	outerSphere.Anchored = false -- Allows falling with the inner sphere
	outerSphere.Transparency = 1 -- Makes it fully invisible
	outerSphere.CanCollide = false -- Prevents physical collisions, only allowing touch detection
	outerSphere.Parent = game.Workspace -- Places it in the Workspace

	-- Weld the inner and outer spheres together
	local weld = Instance.new("WeldConstraint") -- Creates a WeldConstraint to connect the spheres
	weld.Part0 = innerSphere -- Sets the inner sphere as the base part
	weld.Part1 = outerSphere -- Sets the outer sphere to follow the inner sphere
	weld.Parent = innerSphere -- Parents the weld to the inner sphere for management

	-- Add item name as an attribute to the outer sphere (for touch event)
	outerSphere:SetAttribute("ItemId", item.name) -- Stores the item name as an attribute for identification

	-- Create a BillboardGui for the item display (attached to the inner sphere)
	local billboardGui = Instance.new("BillboardGui") -- Creates a GUI that displays above the sphere
	billboardGui.Size = UDim2.new(3, 0, 3, 0) -- Sets the size of the GUI (3x3 studs)
	billboardGui.StudsOffset = Vector3.new(0, 3, 0) -- Positions the GUI 3 studs above the inner sphere
	billboardGui.Adornee = innerSphere -- Attaches the GUI to the inner sphere
	billboardGui.Parent = innerSphere -- Parents the GUI to the inner sphere

	-- Add ImageLabel for the item image
	local imageLabel = Instance.new("ImageLabel") -- Creates an image label for the item’s image
	imageLabel.Size = UDim2.new(1, 0, 0.7, 0)
	imageLabel.Position = UDim2.new(0, 0, 0, 0) -- Positions it at the top-left of the GUI
	imageLabel.Image = item.image -- Sets the image from the item data
	imageLabel.BackgroundTransparency = 1 -- Makes the background fully transparent
	imageLabel.ScaleType = Enum.ScaleType.Fit -- Ensures the image fits within the label while maintaining aspect ratio
	imageLabel.Parent = billboardGui -- Parents it to the BillboardGui

	-- Add TextLabel for the value
	local valueLabel = Instance.new("TextLabel") -- Creates a text label for the item’s value
	valueLabel.Size = UDim2.new(1, 0, 0.3, 0) -- Sets the size to 30% of the GUI height
	valueLabel.Position = UDim2.new(0, 0, 0.7, 0) -- Positions it below the image (70% down)
	valueLabel.TextScaled = true -- Scales the text to fit the label
	valueLabel.Text = "$ " .. tostring(item.value) -- Displays the item’s value with a dollar sign
	valueLabel.TextColor3 = Color3.new(0.666667, 1, 0) -- Sets the text color to green
	valueLabel.Font = Enum.Font.Cartoon -- Sets the font to a cartoon style for a playful look
	valueLabel.BackgroundTransparency = 1 -- Makes the background fully transparent
	valueLabel.Parent = billboardGui -- Parents it to the BillboardGui

	-- Handle outer sphere touch to fire event to client and destroy both spheres
	outerSphere.Touched:Connect(function(hit) -- Detects when the outer sphere is touched
		local player = game.Players:GetPlayerFromCharacter(hit.Parent) -- Gets the player who touched the sphere
		if player and outerSphere and outerSphere.Parent then -- Checks if the player and outer sphere exist
			outerSphere.CanTouch = false -- Prevents the sphere from being touched multiple times
			local itemId = outerSphere:GetAttribute("ItemId") -- Retrieves the item name from the attribute
			if itemId then -- Ensures an item ID exists
				-- Fire the ItemCollected event to the player with the item data
				ItemCollected:FireClient(player, items[itemId]) -- Sends the item data to the client

				-- Destroy both spheres immediately
				if innerSphere and innerSphere.Parent then -- Checks if the inner sphere exists
					innerSphere:Destroy() -- Removes the visible inner sphere
				end
				if outerSphere and outerSphere.Parent then -- Checks if the outer sphere exists
					outerSphere:Destroy() -- Removes the invisible outer sphere
					sphereCount = sphereCount - 1 -- Decrements the sphere count
				end
			end
		end
	end)

	sphereCount = sphereCount + 1 -- Increments the sphere count for each new sphere
end

-- Spawn spheres continuously (every 0.25 seconds) up to maxSpheres
spawn(function()
	while true do -- Runs an infinite loop to keep spawning spheres
		if sphereCount < maxSpheres then -- Checks if we’re below the maximum number of spheres
			spawnSphere() -- Calls the function to spawn a new sphere
		end
		wait(0.25) -- Pauses for 0.25 seconds before spawning the next sphere
	end
end)

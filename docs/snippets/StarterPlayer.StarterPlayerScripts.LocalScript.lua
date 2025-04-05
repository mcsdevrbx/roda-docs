-- Get the local player (the player running this script on their client)
local player = game.Players.LocalPlayer

-- Create a ScreenGui to hold the inventory UI
local gui = Instance.new("ScreenGui") -- Creates a new ScreenGui object
gui.Name = "InventoryGui" -- Names it "InventoryGui" for identification
gui.Parent = player.PlayerGui -- Places it in the player's PlayerGui for client-side UI

-- Create a main frame for the inventory GUI
local frame = Instance.new("Frame") -- Creates a new Frame object for the GUI container
frame.Name = "GuiFrame" -- Names it "GuiFrame" for identification
frame.Size = UDim2.new(0.25, 0, 0.75, 0) -- Sets the size to 25% of the screen width and 75% of the screen height
frame.Position = UDim2.new(0, 0, 0.25, 0) -- Positions it at the top-left corner (0 from left, 25% from top)
frame.BackgroundTransparency = 1 -- Makes the background fully transparent
frame.Parent = gui -- Parents it to the ScreenGui

-- Create a UIListLayout to organize elements vertically in the frame
local layout = Instance.new("UIListLayout") -- Creates a new UIListLayout for layout management
layout.FillDirection = Enum.FillDirection.Vertical -- Arranges items vertically
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center -- Centers items horizontally
layout.VerticalAlignment = Enum.VerticalAlignment.Center -- Centers items vertically
layout.SortOrder = Enum.SortOrder.LayoutOrder -- Sorts items based on their LayoutOrder
layout.Parent = frame -- Parents it to the frame

-- Create cash label at the top of the frame
local cashLabel = Instance.new("TextLabel") -- Creates a new TextLabel for displaying cash
cashLabel.Name = "CashLabel" -- Names it "CashLabel" for identification
cashLabel.Size = UDim2.new(1, 0, 0.2, 0) -- Sets the size to 100% of the frame width and 20% of its height
cashLabel.BackgroundTransparency = 1 -- Makes the background fully transparent
cashLabel.Text = "Cash: $0" -- Sets the initial text to show zero cash
cashLabel.TextColor3 = Color3.new(0.666667, 1, 0) -- Sets the text color to green
cashLabel.Font = Enum.Font.Cartoon -- Sets the Font
cashLabel.TextScaled = true -- Scales the text to fit the label size
cashLabel.LayoutOrder = 1 -- Sets the order for layout
cashLabel.Parent = frame -- Parents it to the frame

-- Create the main inventory frame (scrollable) inside the GUI frame
local scrollingFrame = Instance.new("ScrollingFrame") -- Creates a new ScrollingFrame for scrollable items
scrollingFrame.Name = "InventoryFrame" -- Names it "InventoryFrame" for identification
scrollingFrame.Size = UDim2.new(1, 0, 0.8, 0) -- Sets the size to 100% of the frame width and 80% of its height
scrollingFrame.BackgroundColor3 = Color3.new(0, 0, 0) -- Sets the background color to black
scrollingFrame.BackgroundTransparency = 0.5 -- Makes the background semi-transparent (50% opacity)
scrollingFrame.ScrollBarThickness = 8 -- Sets the thickness of the scrollbar
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0) -- Initial canvas size for scrolling (auto-adjusts)
scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y -- Automatically adjusts the canvas height based on content
scrollingFrame.LayoutOrder = 2 -- Sets the order for layout
scrollingFrame.Parent = frame -- Parents it to the frame

-- Create a layout for scrollable items within the scrolling frame
local itemLayout = Instance.new("UIListLayout") -- Creates a new UIListLayout for organizing items
itemLayout.Padding = UDim.new(0, 5) -- Adds 5 pixels of padding between items
itemLayout.Parent = scrollingFrame -- Parents it to the scrolling frame

-- Fetch items from the server
local GetItems = game.ReplicatedStorage:WaitForChild("GetItems") -- Gets the GetItems RemoteEvent from ReplicatedStorage
local allItems = nil -- Initializes a variable to store the items table

GetItems:FireServer() -- Sends a request to the server to get the items
GetItems.OnClientEvent:Connect(function(itemsData) -- Listens for the response from the server
	allItems = itemsData -- Stores the received items table for later use
end)

local collectSounds = {
	"rbxassetid://6586979979",
	--"rbxassetid://.."
}

-- Create and store sound instances once on the client for item collection
local sounds = {} -- Initializes an empty table to store sound instances
for _, soundId in pairs(collectSounds) do -- Loops through the list of sound IDs
	local sound = Instance.new("Sound") -- Creates a new Sound object
	sound.SoundId = soundId -- Sets the sound ID from the list
	sound.Parent = player.PlayerGui -- Parents the sound to PlayerGui for client-side playback
	sound.Looped = false -- Ensures the sound doesn’t loop
	sound.Volume = 0.5 -- Sets the volume (optional, default is 1)
	table.insert(sounds, sound) -- Adds the sound to the sounds table
end

-- Track inventory and cash for the player
local inventory = {} -- Initializes an empty table to track collected items
local totalCash = 0 -- Initializes the total cash to zero

-- Handle item collection from server event
local ItemCollected = game.ReplicatedStorage:WaitForChild("ItemCollected") -- Gets the ItemCollected RemoteEvent from ReplicatedStorage
ItemCollected.OnClientEvent:Connect(function(item) -- Listens for when an item is collected on the client
	if item then -- Ensures an item was received
		local randomSound = sounds[math.random(1, #sounds)] -- Randomly selects a sound from the sounds table
		randomSound:Play() -- Plays the selected sound for item collection

		-- Add item to inventory (create GUI elements)
		local itemFrame = Instance.new("Frame") -- Creates a new Frame for the item in the inventory
		itemFrame.Size = UDim2.new(1, 0, 0.1, 0) -- Sets the size to 100% of the scrolling frame width and 10% of its height
		itemFrame.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569) -- Sets the background color to dark gray
		itemFrame.BackgroundTransparency = 0.6 -- Makes the background semi-transparent (60% opacity)
		itemFrame.Parent = scrollingFrame -- Parents it to the scrolling frame for display

		local image = Instance.new("ImageLabel") -- Creates an ImageLabel for the item’s image
		image.Size = UDim2.new(0.3, 0, 1, 0) -- Sets the size to 30% of the item frame width and 100% of its height
		image.Position = UDim2.new(0, 0, 0, 0) -- Positions it at the top-left of the item frame
		image.Image = item.image -- Sets the image from the item data
		image.BackgroundTransparency = 1 -- Makes the background fully transparent
		image.ScaleType = Enum.ScaleType.Fit -- Ensures the image fits within the label while maintaining aspect ratio
		image.Parent = itemFrame -- Parents it to the item frame

		local nameLabel = Instance.new("TextLabel") -- Creates a TextLabel for the item’s name
		nameLabel.Size = UDim2.new(0.7, 0, 1, 0) -- Sets the size to 70% of the item frame width, full height
		nameLabel.Position = UDim2.new(0.3, 0, 0, 0) -- Positions it to the right of the image (30% from left)
		nameLabel.Text = item.name -- Sets the text to the item’s name
		nameLabel.TextColor3 = Color3.new(1, 1, 1) -- Sets the text color to white
		nameLabel.BackgroundTransparency = 1 -- Makes the background fully transparent
		nameLabel.Font = Enum.Font.Cartoon -- Uses a cartoon-style font for a playful look
		nameLabel.TextScaled = true -- Scales the text to fit the label size
		nameLabel.Parent = itemFrame -- Parents it to the item frame

		-- Track the item in inventory by adding it to the list to prevent duplicates
		table.insert(inventory, item) -- Adds the item to the inventory table
		totalCash = totalCash + (item.value or 0) -- Adds the item’s value to the total cash (defaults to 0 if no value)
		cashLabel.Text = "Cash: $" .. totalCash -- Updates the cash label with the new total
	end
end)

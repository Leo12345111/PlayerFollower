local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local selectedPlayers = {}
local enabled = false
local savedCFrame = nil

local offsetX, offsetY, offsetZ = 0, 0, 2

local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 360, 0, 420)
frame.Position = UDim2.new(0, 200, 0, 200)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.Active = true

local border = Instance.new("UIStroke")
border.Parent = frame
border.Thickness = 2
border.Color = Color3.fromRGB(255, 255, 255)

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1, 0, 0, 25)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Player Follower Script"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.TextColor3 = Color3.new(1, 1, 1)

local subtitle = Instance.new("TextLabel")
subtitle.Parent = frame
subtitle.Size = UDim2.new(1, 0, 0, 20)
subtitle.Position = UDim2.new(0, 0, 0, 25)
subtitle.BackgroundTransparency = 1
subtitle.Text = "By: Leo1333877"
subtitle.Font = Enum.Font.SourceSansLight
subtitle.TextSize = 14
subtitle.TextColor3 = Color3.new(1, 1, 1)

local closeButton = Instance.new("TextButton")
closeButton.Parent = frame
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 5)
closeButton.Text = "X"
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 18
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(170, 40, 40)

closeButton.MouseButton1Click:Connect(function()
	gui:Destroy()
	enabled = false
end)

local dragging = false
local dragStart
local startPos

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
	end
end)

frame.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

local labelY = Instance.new("TextLabel")
labelY.Parent = frame
labelY.Position = UDim2.new(0, 10, 0, 50)
labelY.Size = UDim2.new(0, 40, 0, 20)
labelY.Text = "Y"
labelY.TextColor3 = Color3.new(1, 1, 1)
labelY.BackgroundTransparency = 1
labelY.Font = Enum.Font.SourceSansLight
labelY.TextSize = 14
labelY.TextXAlignment = Enum.TextXAlignment.Left

local inputY = Instance.new("TextBox")
inputY.Parent = frame
inputY.Position = UDim2.new(0, 40, 0, 50)
inputY.Size = UDim2.new(0, 50, 0, 20)
inputY.Text = tostring(offsetY)
inputY.ClearTextOnFocus = false
inputY.TextColor3 = Color3.new(0, 0, 0)
inputY.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
inputY.Font = Enum.Font.SourceSansLight
inputY.TextSize = 14

local labelX = Instance.new("TextLabel")
labelX.Parent = frame
labelX.Position = UDim2.new(0, 110, 0, 50)
labelX.Size = UDim2.new(0, 40, 0, 20)
labelX.Text = "X"
labelX.TextColor3 = Color3.new(1, 1, 1)
labelX.BackgroundTransparency = 1
labelX.Font = Enum.Font.SourceSansLight
labelX.TextSize = 14

local inputX = Instance.new("TextBox")
inputX.Parent = frame
inputX.Position = UDim2.new(0, 140, 0, 50)
inputX.Size = UDim2.new(0, 50, 0, 20)
inputX.Text = tostring(offsetX)
inputX.ClearTextOnFocus = false
inputX.TextColor3 = Color3.new(0, 0, 0)
inputX.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
inputX.Font = Enum.Font.SourceSansLight
inputX.TextSize = 14

local labelZ = Instance.new("TextLabel")
labelZ.Parent = frame
labelZ.Position = UDim2.new(0, 210, 0, 50)
labelZ.Size = UDim2.new(0, 40, 0, 20)
labelZ.Text = "Z"
labelZ.TextColor3 = Color3.new(1, 1, 1)
labelZ.BackgroundTransparency = 1
labelZ.Font = Enum.Font.SourceSansLight
labelZ.TextSize = 14

local inputZ = Instance.new("TextBox")
inputZ.Parent = frame
inputZ.Position = UDim2.new(0, 240, 0, 50)
inputZ.Size = UDim2.new(0, 50, 0, 20)
inputZ.Text = tostring(offsetZ)
inputZ.ClearTextOnFocus = false
inputZ.TextColor3 = Color3.new(0, 0, 0)
inputZ.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
inputZ.Font = Enum.Font.SourceSansLight
inputZ.TextSize = 14

inputY.FocusLost:Connect(function()
	local v = tonumber(inputY.Text)
	if v then offsetY = v end
end)

inputX.FocusLost:Connect(function()
	local v = tonumber(inputX.Text)
	if v then offsetX = v end
end)

inputZ.FocusLost:Connect(function()
	local v = tonumber(inputZ.Text)
	if v then offsetZ = v end
end)

local list = Instance.new("ScrollingFrame")
list.Parent = frame
list.Size = UDim2.new(1, 0, 1, -140)
list.Position = UDim2.new(0, 0, 0, 80)
list.BackgroundTransparency = 1
list.CanvasSize = UDim2.new(0, 0, 0, 0)
list.ScrollBarThickness = 6

local layout = Instance.new("UIListLayout")
layout.Parent = list

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	list.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
end)

local toggle = Instance.new("TextButton")
toggle.Parent = frame
toggle.Size = UDim2.new(1, -20, 0, 40)
toggle.Position = UDim2.new(0, 10, 1, -50)
toggle.Font = Enum.Font.SourceSansLight
toggle.TextSize = 14
toggle.Text = "TP OFF"
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.BackgroundColor3 = Color3.fromRGB(170, 40, 40)

local stroke = Instance.new("UIStroke")
stroke.Parent = toggle
stroke.Thickness = 2
stroke.Color = Color3.new(1, 1, 1)

toggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	local char = LocalPlayer.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	
	if enabled then
		toggle.Text = "TP ON"
		toggle.BackgroundColor3 = Color3.fromRGB(40, 170, 40)
		if hrp then
			savedCFrame = hrp.CFrame
		end
	else
		toggle.Text = "TP OFF"
		toggle.BackgroundColor3 = Color3.fromRGB(170, 40, 40)
		if hrp and savedCFrame then
			hrp.CFrame = savedCFrame
			hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
		end
	end
end)

local function addPlayer(player)
	local row = Instance.new("Frame")
	row.Parent = list
	row.Size = UDim2.new(1, 0, 0, 30)
	row.BackgroundTransparency = 1

	local select = Instance.new("TextButton")
	select.Parent = row
	select.Size = UDim2.new(0, 30, 1, 0)
	select.Text = "□"
	select.Font = Enum.Font.SourceSansLight
	select.TextSize = 16
	select.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

	local name = Instance.new("TextLabel")
	name.Parent = row
	name.Position = UDim2.new(0, 35, 0, 0)
	name.Size = UDim2.new(1, -35, 1, 0)
	name.Text = player.Name
	name.Font = Enum.Font.SourceSansLight
	name.TextSize = 16
	name.TextColor3 = Color3.new(1, 1, 1)
	name.BackgroundTransparency = 1
	name.TextXAlignment = Enum.TextXAlignment.Left

	select.MouseButton1Click:Connect(function()
		if selectedPlayers[player] then
			selectedPlayers[player] = nil
			select.Text = "□"
			select.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		else
			selectedPlayers[player] = true
			select.Text = "✓"
			select.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
		end
	end)
end

for _, p in pairs(Players:GetPlayers()) do
	if p ~= LocalPlayer then
		addPlayer(p)
	end
end

Players.PlayerAdded:Connect(function(p)
	if p ~= LocalPlayer then
		addPlayer(p)
	end
end)

Players.PlayerRemoving:Connect(function(p)
	selectedPlayers[p] = nil
	for _, v in pairs(list:GetChildren()) do
		if v:IsA("Frame") and v:FindFirstChildWhichIsA("TextLabel") and v.TextLabel.Text == p.Name then
			v:Destroy()
		end
	end
end)

RunService.Heartbeat:Connect(function()
	if not enabled then return end
	local char = LocalPlayer.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	for player, _ in pairs(selectedPlayers) do
		if player.Character then
			local targetHRP = player.Character:FindFirstChild("HumanoidRootPart")
			if targetHRP then
				local pos = targetHRP.Position + Vector3.new(offsetX, offsetY, offsetZ)
				hrp.CFrame = CFrame.new(pos)
			end
		end
	end
end)

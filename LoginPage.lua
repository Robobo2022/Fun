-- Gui to Lua
-- Version: 3.2

-- Instances:

local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Password = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local LockIcon = Instance.new("ImageLabel")
local GuestIcon = Instance.new("ImageLabel")
local UICorner_3 = Instance.new("UICorner")

--Properties:

Main.Name = "Main"
Main.Parent = game.StarterGui.LoginPage
Main.BackgroundColor3 = Color3.fromRGB(186, 182, 203)
Main.BackgroundTransparency = 0.250
Main.Position = UDim2.new(0.398787886, 0, 0.253894091, 0)
Main.Size = UDim2.new(0, 275, 0, 275)

UICorner.Parent = Main

Password.Name = "Password"
Password.Parent = Main
Password.BackgroundColor3 = Color3.fromRGB(57, 83, 117)
Password.BackgroundTransparency = 0.250
Password.BorderColor3 = Color3.fromRGB(57, 83, 117)
Password.Position = UDim2.new(0.172121137, 0, 0.425454527, 0)
Password.Size = UDim2.new(0, 179, 0, 41)
Password.ClearTextOnFocus = false
Password.Font = Enum.Font.SourceSans
Password.PlaceholderText = "Password"
Password.Text = ""
Password.TextColor3 = Color3.fromRGB(255, 255, 255)
Password.TextSize = 20.000
Password.TextWrapped = true

UICorner_2.Parent = Password

LockIcon.Name = "LockIcon"
LockIcon.Parent = Main
LockIcon.BackgroundColor3 = Color3.fromRGB(0, 38, 76)
LockIcon.BackgroundTransparency = 1.000
LockIcon.Position = UDim2.new(0.0181818157, 0, 0.425454527, 0)
LockIcon.Size = UDim2.new(0, 42, 0, 41)
LockIcon.Image = "http://www.roblox.com/asset/?id=647920914"

GuestIcon.Name = "GuestIcon"
GuestIcon.Parent = Main
GuestIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GuestIcon.BorderSizePixel = 0
GuestIcon.Position = UDim2.new(0.381212056, 0, -0.121670917, 0)
GuestIcon.Size = UDim2.new(0, 64, 0, 64)
GuestIcon.Image = "http://www.roblox.com/asset/?id=146330476"

UICorner_3.CornerRadius = UDim.new(1, 10)
UICorner_3.Parent = GuestIcon

-- Scripts:

local function YQMDQU_fake_script() -- Main.Dragify 
	local script = Instance.new('LocalScript', Main)

	local UserInputService = game:GetService("UserInputService")
	local runService = (game:GetService("RunService"));
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	function Lerp(a, b, m)
		return a + (b - a) * m
	end;
	
	local lastMousePos
	local lastGoalPos
	local DRAG_SPEED = (10);
	function Update(dt)
		if not (startPos) then return end;
		if not (dragging) and (lastGoalPos) then
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return 
		end;
	
		local delta = (lastMousePos - UserInputService:GetMouseLocation())
		local xGoal = (startPos.X.Offset - delta.X);
		local yGoal = (startPos.Y.Offset - delta.Y);
		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end;
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			lastMousePos = UserInputService:GetMouseLocation()
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	runService.Heartbeat:Connect(Update)
end
coroutine.wrap(YQMDQU_fake_script)()

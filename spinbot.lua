local char = game:GetService("Players").LocalPlayer.Character
local humanoid = char.Humanoid
local Spin = Instance.new("BodyAngularVelocity")
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
	Name = "Spinbot/bhop",
	LoadingTitle = "Spinbot/bhop",
	LoadingSubtitle = "by hydra#8270",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil, 
		FileName = "Big Hub"
	},
        Discord = {
        	Enabled = false,
        	Invite = "sirius", 
        	RememberJoins = true 
        },
	KeySystem = false,
	KeySettings = {
		Title = "Sirius Hub",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/sirius)",
		FileName = "SiriusKey",
		SaveKey = true,
		GrabKeyFromSite = false,
		Key = "Hello"
	}
})

getgenv().spinSpeed = 20
getgenv().bhop = false
getgenv().bhopwait = 1

local T1 = Window:CreateTab("SpinBot", 4483362458) 
local T2 = Window:CreateTab("Bhop", 4483362458) 

task.spawn(function()
	while task.wait(bhopwait) do
		if bhop then
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end)

function spin()
	local Spin = Instance.new("BodyAngularVelocity")
	Spin.Name = "Spinning"
	Spin.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	Spin.MaxTorque = Vector3.new(0, math.huge, 0)
	Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)
end

local Slider = T1:CreateSlider({
	Name = "SpinSpeed",
	Range = {0, 500},
	Increment = 10,
	Suffix = "Speed",
	CurrentValue = 1,
	Flag = "Slider1",
	Callback = function(Value)
		spinSpeed = Value
	end,
})

local Toggle = T1:CreateToggle({
	Name = "Spin-bot",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		if Value then
			spin()
		else
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Spinning:Destroy()
		end
	end,
})

local Slider = T2:CreateSlider({
	Name = "Bhop Delay",
	Range = {0.5, 50},
	Increment = 0.1,
	Suffix = "Delay",
	CurrentValue = 1,
	Flag = "Slider1",
	Callback = function(Value)
		bhopwait = Value
	end,
})

local Toggle = T2:CreateToggle({
	Name = "Bhop",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		bhop = Value
	end,
})

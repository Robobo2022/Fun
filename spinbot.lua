getgenv().spinSpeed = 20
local Spin = Instance.new("BodyAngularVelocity")
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
	Name = "Rayfield Example Window",
	LoadingTitle = "Rayfield Interface Suite",
	LoadingSubtitle = "by Sirius",
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

local Tab = Window:CreateTab("Tab Example", 4483362458)

function spin()
	local Spin = Instance.new("BodyAngularVelocity")
	Spin.Name = "Spinning"
	Spin.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	Spin.MaxTorque = Vector3.new(0, math.huge, 0)
	Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)
end

local Slider = Tab:CreateSlider({
	Name = "SpinSpeed",
	Range = {0, 500},
	Increment = 10,
	Suffix = "Bananas",
	CurrentValue = 10,
	Flag = "Slider1",
	Callback = function(Value)
		spinSpeed = Value
	end,
})

local Toggle = Tab:CreateToggle({
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

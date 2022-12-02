local Player = game:GetService("Players")
local PlayerName = Player.Name
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "Player Info",
	LoadingTitle = "Loading Player Info",
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

local Tab = Window:CreateTab("Player", 11721661401)
local Tab1 = Window:CreateTab("Information", 11721661401)

local WalkSpeed = Tab1:CreateLabel("WalkSpeed: ")
local JumpPower = Tab1:CreateLabel("JumpPower: ")
local MaxHealth = Tab1:CreateLabel("MaxHealth: ")


local Input = Tab:CreateInput({
	Name = "Player Name",
	PlaceholderText = "Player Name",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		PlayerName = Text

		if not Player:FindFirstChild(Text) then
			Rayfield:Notify({
				Title = "Player Chosen Doesn't Exist",
				Content = "Player Name: " .. PlayerName,
				Duration = 6.5,
				Image = 11721661420,
			})
			WalkSpeed:Set("WalkSpeed: Doesn't Exist")
			JumpPower:Set("JumpPower: Doesn't Exist")
			MaxHealth:Set("MaxHealth: Doesn't Exist")
		else
			Rayfield:Notify({
				Title = "Player Chosen",
				Content = "Player Name: " .. PlayerName,
				Duration = 6.5,
				Image = 11721661402,
			})

			WalkSpeed:Set("WalkSpeed: " .. Player[Text].Character.Humanoid.WalkSpeed)
			JumpPower:Set("JumpPower: " .. Player[Text].Character.Humanoid.JumpPower)
			MaxHealth:Set("MaxHealth: " .. Player[Text].Character.Humanoid.MaxHealth)
		end
	end,
})




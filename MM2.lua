local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "MM2",
    LoadingTitle = "Hydra Network",
    LoadingSubtitle = "by Hydra#8270",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = true,
       Invite = "YvwEyH2W6t",
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

getgenv().AutoFarm = false
local Time = 5

local Tab = Window:CreateTab("Auto Farm", 4483362458)

task.spawn(function()
    while task.wait() do
        if AutoFarm == true then
            for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                if v.Name == "Coin_Server" then
                    CFrameEnd = CFrame.new(v.Position)
                    local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
                    tween:Play()
                    tween.Completed:Wait()
                    if AutoFarm == false then
                        tween:Cancel()
                    end
                end
            end
        end
    end
end)


local Toggle = Tab:CreateToggle({
	Name = "Auto Farm",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
        AutoFarm = Value
	end,
})
local Slider = Tab:CreateSlider({
	Name = "Auto Farm delay",
	Range = {0, 10},
	Increment = 1,
	Suffix = "Seconds Delay",
	CurrentValue = 5,
	Flag = "Slider1",
	Callback = function(Value)
        Time = Value
	end,
})



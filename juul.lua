local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local Gui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local TextLabel = Instance.new("TextLabel")
local Extra = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Lookingat = Instance.new("TextLabel")
local Under = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local Bar = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local _100 = Instance.new("TextLabel")
local Health = Instance.new("TextLabel")
local Arrow = Instance.new("ImageLabel")
local Distance = Instance.new("TextLabel")
local highlight = Instance.new("Highlight")

mouse.move:Connect(function()
	local closestplr
	local closestpos = 1e+100
	for i,v in pairs(game.Players:GetPlayers()) do
        if v.Character ~= game.Players.LocalPlayer.Character then
            if v.Character then
                local mag = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.position - v.Character.HumanoidRootPart.CFrame.Position).Magnitude
                if  mag < closestpos then
                    closestplr = v
                    closestpos = mag
                end
            end
        end
                
        if closestplr then
            highlight.Parent = closestplr.Character
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillColor = Color3.new(0.917647, 0, 1)
            Gui.Name = "Gui"
            Gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
            Main.Name = "Main"
            Main.Parent = Gui
            Main.BackgroundColor3 = Color3.fromRGB(84, 85, 86)
            Main.BackgroundTransparency = 0.050
            Main.BorderColor3 = Color3.fromRGB(84, 85, 86)
            Main.Position = UDim2.new(0.41379407, 0, 0.058997184, 0)
            Main.Size = UDim2.new(0, 273, 0, 92)
            Main.ZIndex = 2
            
            UICorner.Parent = Main
            
            UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(207, 212, 221)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(207, 212, 221))}
            UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.10), NumberSequenceKeypoint.new(1.00, 0.10)}
            UIGradient.Parent = Main
            
            TextLabel.Parent = Main
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.Position = UDim2.new(0, 0, 0.00653625466, 0)
            TextLabel.Size = UDim2.new(0, 133, 0, 64)
            TextLabel.Font = Enum.Font.SourceSans
            TextLabel.Text = closestplr.Name..""
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.TextSize = 25.000
            
            Extra.Name = "Extra"
            Extra.Parent = Gui
            Extra.BackgroundColor3 = Color3.fromRGB(68, 70, 71)
            Extra.BackgroundTransparency = 0.400
            Extra.BorderColor3 = Color3.fromRGB(52, 53, 54)
            Extra.Position = UDim2.new(0.401771754, 0, 0.0209895372, 0)
            Extra.Size = UDim2.new(0, 159, 0, 59)
            Extra.ZIndex = 3
            
            UICorner_2.Parent = Extra
            
            Lookingat.Name = "Looking at"
            Lookingat.Parent = Extra
            Lookingat.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Lookingat.BackgroundTransparency = 1.000
            Lookingat.Position = UDim2.new(0.0472772941, 0, 0.127101064, 0)
            Lookingat.Size = UDim2.new(0, 142, 0, 37)
            Lookingat.Font = Enum.Font.SourceSans
            Lookingat.Text = closestplr.UserId..""
            Lookingat.TextColor3 = Color3.fromRGB(255, 255, 255)
            Lookingat.TextSize = 37.000
            Lookingat.TextWrapped = true
            
            Under.Name = "Under"
            Under.Parent = Gui
            Under.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
            Under.BackgroundTransparency = 0.100
            Under.BorderColor3 = Color3.fromRGB(51, 51, 51)
            Under.Position = UDim2.new(0.419083834, 0, 0.115057558, 0)
            Under.Size = UDim2.new(0, 167, 0, 22)
            Under.ZIndex = 3
            
            UICorner_3.Parent = Under
            
            Bar.Name = "Bar"
            Bar.Parent = Gui
            Bar.BackgroundColor3 = Color3.fromRGB(77, 255, 104)
            Bar.BackgroundTransparency = 0.100
            Bar.BorderColor3 = Color3.fromRGB(77, 255, 104)
            Bar.Position = UDim2.new(0.419083834, 0, 0.115057558, 0)
            Bar.Size = UDim2.new(0, 167, 0, 22)
            Bar.ZIndex = 3
            
            UICorner_4.Parent = Bar
            
            _100.Name = "/100"
            _100.Parent = Gui
            _100.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _100.BackgroundTransparency = 1.000
            _100.Position = UDim2.new(0.524678409, 0, 0.114537895, 0)
            _100.Size = UDim2.new(0, 54, 0, 23)
            _100.ZIndex = 3
            _100.Font = Enum.Font.SourceSans
            _100.Text = "/100"
            _100.TextColor3 = Color3.fromRGB(255, 255, 255)
            _100.TextSize = 25.000
            _100.TextWrapped = true
            
            Health.Name = "Health"
            Health.Parent = Gui
            Health.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Health.BackgroundTransparency = 1.000
            Health.Position = UDim2.new(0.505883515, 0, 0.106204569, 0)
            Health.Size = UDim2.new(0, 54, 0, 23)
            Health.ZIndex = 3
            Health.Font = Enum.Font.SourceSans
            Health.Text = math.floor(closestplr.Character.Humanoid.Health.."")
            Health.TextColor3 = Color3.fromRGB(255, 255, 255)
            Health.TextSize = 30.000
            Health.TextWrapped = true
            
            Arrow.Name = "Arrow"
            Arrow.Parent = Gui
            Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Arrow.BackgroundTransparency = 1.000
            Arrow.Position = UDim2.new(0.507819235, 0, 0.068454653, 0)
            Arrow.Rotation = 270.000
            Arrow.Size = UDim2.new(0, 47, 0, 38)
            Arrow.ZIndex = 3
            Arrow.Image = "http://www.roblox.com/asset/?id=11449963148"
            
            Distance.Name = "Distance"
            Distance.Parent = Gui
            Distance.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Distance.BackgroundTransparency = 1.000
            Distance.Position = UDim2.new(0.531131506, 0, 0.068454653, 0)
            Distance.Size = UDim2.new(0, 41, 0, 41)
            Distance.ZIndex = 3
            Distance.Font = Enum.Font.SourceSans
            Distance.Text = math.floor(closestpos.."")
            Distance.TextColor3 = Color3.fromRGB(255, 255, 255)
            Distance.TextSize = 30.000
            Distance.TextWrapped = true

            if closestplr.Character.Humanoid.Health < 50 then
                Bar.BackgroundColor3 = Color3.fromRGB(255, 162, 0)
                Bar.Size = UDim2.new(0, 77, 0, 26)
            end

            if closestplr.Character.Humanoid.Health < 20 then
                Bar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                Bar.Size = UDim2.new(0, 30, 0, 26)
            end

            if closestplr.Character.Humanoid.Health == 0 then
                Bar.BackgroundTransparency = 1
            end

        end
    end
end)




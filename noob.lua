local players = game:GetService("Players")
local guiservice = game:GetService("GuiService")
local runservice = game:GetService("RunService")
local renderstepped = runservice.RenderStepped
local localPlayer = players.LocalPlayer
local currentCamera = game:GetService("Workspace").CurrentCamera
local mouse = localPlayer:GetMouse()

if not getgenv().fov_color then
    getgenv().fov_color = Color3.fromRGB(255, 0, 68)
end

if not getgenv().SilentAim then
    getgenv().SilentAim = {
        Enabled = true,
        FOVRep = true,
        TeamCheck = false,
        VisibleCheck = true,
        FOV = 150,
        HitChance = 100,
    }
end


local circle = Drawing.new("Circle")
function updateCircle()
    if circle.__OBJECT_EXISTS then
        circle.Transparency = 1
        circle.Visible = SilentAim["FOVRep"]
        circle.Thickness = 2
        circle.Color = getgenv().fov_color
        circle.NumSides = 12
        circle.Radius = (SilentAim["FOV"] * 6) / 2
        circle.Filled = false
        circle.Position = Vector2.new(mouse.X, mouse.Y + (guiservice.GetGuiInset(guiservice).Y))
    end
end
renderstepped.Connect(renderstepped, updateCircle)


function isPartVisible(part)
    local camera = game.GetService(game, "Workspace").CurrentCamera
    local character = game.GetService(game, "Players").LocalPlayer.Character.GetDescendants(game.GetService(game, "Players").LocalPlayer.Character)
    local castPoints = {part.Position}
    return camera.GetPartsObscuringTarget(camera, castPoints, character)
end

setreadonly(math, false); math.chance = function(percentage) local percentage = math.floor(percentage); local chance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100)/100; return chance <= percentage/100 end; setreadonly(math, true);

local getClosestPlayerToCursor = function()
    local closestPlayer = nil
    local chance = math.chance(SilentAim["HitChance"])
    local shortestDistance = math.huge
    for i, v in pairs(players.GetPlayers(players)) do
        if v ~= localPlayer and v.Character and v.Character.FindFirstChild(v.Character, "Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character.PrimaryPart ~= nil and v.Character.FindFirstChild(v.Character, "Head") then
            if SilentAim["VisibleCheck"] and not isPartVisible(v.Character.PrimaryPart) then
                return (chance and closestPlayer or localPlayer)
            end
            if SilentAim["TeamCheck"] then
                if v.Team ~= localPlayer.Team then
                    local pos = currentCamera.WorldToViewportPoint(currentCamera, v.Character.PrimaryPart.Position)
                    local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
                    if magnitude < (SilentAim["FOV"] * 6 - 8) then
                        if magnitude < shortestDistance then
                            closestPlayer = v
                            shortestDistance = magnitude
                        end
                    end
                end
            else
                local pos = currentCamera.WorldToViewportPoint(currentCamera, v.Character.PrimaryPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
                if magnitude < (SilentAim["FOV"] * 6 - 8) then
                    if magnitude < shortestDistance then
                        closestPlayer = v
                        shortestDistance = magnitude
                    end
                end
            end
        end
    end
    return (chance and closestPlayer or localPlayer)
end

local remot = game:GetService("ReplicatedStorage").Assets.Remotes.fire
local OldNamecall
OldNamecall = hookmetamethod(game, "__namecall", function(Self, ...)
    local args = {...}
    local method = getnamecallmethod()
    if Self == remot and method == "FireServer" and getgenv().SilentAim.Enabled == true then
        args[2][1] = Vector3.new(getClosestPlayerToCursor().Character.Head)
        return OldNamecall(Self,unpack(args))
    end
    return OldNamecall(Self, ...)
end)

game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.Z then
        localPlayer.Character.HumanoidRootPart.CFrame = getClosestPlayerToCursor().Character.HumanoidRootPart.CFrame
    end 
end)


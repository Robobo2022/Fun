local Player = game:GetService("Players").LocalPlayer 
repeat wait(1) until Player.Character 
local Character = Player.Character 

local Humanoid = Character:FindFirstChild("Humanoid") 
local RunService = game:GetService("RunService") 

local debounce = false

local function IsPlayerMoving()
	if debounce == false then
		debounce = true
		if Humanoid.MoveDirection.Magnitude > 0 then 
            Player.Character.Humanoid.Jump = true
		end
		debounce = false
	end
end

RunService.RenderStepped:Connect(IsPlayerMoving)
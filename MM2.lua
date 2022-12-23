local Time = 5
for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
    if v.Name == "Coin_Server" then
        CFrameEnd = CFrame.new(v.Position)
        local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
        tween:Play()
        tween.Completed:Wait()
    end
end
local highlight = Instance.new("Highlight")

game:GetService("Workspace").DescendantAdded:Connect(function(descendant)
	if descendant:IsA("Part") and descendant.Name == "newBullet" then
        highlight.Parent = descendant
	end
end)
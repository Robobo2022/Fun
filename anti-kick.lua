local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local Players = game:GetService("Players")
local OldNameCall = nil

OldNameCall = hookmetamethod(game, "__namecall", function(Self, ...)
    local NameCallMethod = getnamecallmethod()

    if tostring(string.lower(NameCallMethod)) == "kick" then
            local notif = Notification.new("success", "Anti-Kick", "Kick got successfully blocked.")
            notif:deleteTimeout(3)
        
        return nil
    end
    
    return OldNameCall(Self, ...)
end)

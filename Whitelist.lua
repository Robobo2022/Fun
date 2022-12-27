local filename = "Whitelist.txt"
local json
local HttpService = game:GetService("HttpService")
local Http_Request = request;
local Body = Http_Request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
local Decoded = game:GetService('HttpService'):JSONDecode(Body)
local GetHwid = Decoded.headers["Sw-Fingerprint"];
local GAMENAME = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Time = os.clock()

_G.Settings = {
    ["key"] = _G.Key,
    ["site"] = "noob",
    ["text"] = "Youre not whitelisted please contact our staff/owner";
}
local abc = game:HttpGet(_G.Settings.site .. _G.Settings.key)
if abc == "true" then
    print("[Whitelist] Loading...")
    wait(0.2)
    print("[Whitelist] ".. identifyexecutor())
    wait(0.2)
    
    print("[Whitelist] Checking Whitelist...")
    
    if (writefile) then
        json = HttpService:JSONEncode({["hwid"] = GetHwid})
        writefile(filename, json)
    else
        json = readfile(filename)
    end
    
    print("[Whitelist] Took: " .. math.round(os.clock() - Time) .. "s")
    
    if (not json) then
        print("[Whitelist] Failed to load whitelist.")
        return
    end
    
    if (not HttpService:JSONDecode(json)) then
        print("[Whitelist] Failed to load whitelist.")
        return
    end
elseif abc == "false" then
game.Players.LocalPlayer:Kick(_G.Settings.text)
else
    print("noob")
end




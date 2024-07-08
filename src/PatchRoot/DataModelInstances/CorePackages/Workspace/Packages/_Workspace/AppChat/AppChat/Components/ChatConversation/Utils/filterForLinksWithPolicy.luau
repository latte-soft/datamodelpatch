local v0 = require(script:FindFirstAncestor("AppChat").Parent.ArgCheck);
local v1 = require(script.Parent.filterForLinks);
local v2 = {
    "roblox.com", 
    "sitetest%d%.robloxlabs.com", 
    "gametest%d%.robloxlabs.com", 
    "roblox.cn", 
    "roblox.qq.com", 
    "roblox%-cn.com"
};
return function(v3)
    v0.isType(v3, "table", "filterForLinks.text");
    return v1(v3, v2);
end;

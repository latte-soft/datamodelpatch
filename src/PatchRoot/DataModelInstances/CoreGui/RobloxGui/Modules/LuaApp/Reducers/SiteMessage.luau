local v0 = require(game:GetService("CorePackages").Cryo);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Actions.ProcessSiteAlertInfoPayload);
local v3 = require(l_Modules_0.LuaApp.Actions.RefreshSiteAlertInfo);
local v4 = require(l_Modules_0.LuaApp.Actions.ApplySetNavigationLocked);
local v5 = require(l_Modules_0.LuaApp.Actions.ApplyRoactNavigationHistory);
return function(v6, v7)
    v6 = v6 or {};
    if v7.type == v2.name then
        return {
            Text = not not v7.visible and v7.text or nil, 
            Link = not not v7.visible and v7.link or nil, 
            timestamp = v7.timestamp or nil, 
            updateRequested = false
        };
    elseif v7.type == v3.name then
        return v0.Dictionary.join(v6, {
            updateRequested = v7.updateRequested
        });
    else
        for _, v9 in ipairs({
            v4, 
            v5
        }) do
            if v7.type == v9.name then
                return v0.Dictionary.join(v6, {
                    updateRequested = true
                });
            end;
        end;
        return v6;
    end;
end;

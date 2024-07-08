local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Immutable);
local v2 = require(l_Modules_0.Shell.Actions.RequestCrossPlayEnabled);
local v3 = require(l_Modules_0.Shell.Actions.SetCrossPlayEnabled);
local v4 = require(l_Modules_0.Shell.Actions.PostCrossPlayEnabledFailed);
local v5 = require(l_Modules_0.Shell.Actions.GetCrossPlayEnabledFailed);
return function(v6, v7)
    v6 = v6 or {};
    assert(v6, "");
    if v7.type == v2.name then
        return (v1.Set(v6, "isRequesting", true));
    elseif v7.type == v3.name then
        if v7.enabled ~= nil then
            return {
                enabled = v7.enabled, 
                lastUpdated = v7.timestamp, 
                isRequesting = false
            };
        else
            return {};
        end;
    elseif v7.type == v4.name then
        return (v1.Set(v6, "isRequesting", false));
    else
        if v7.type == v5.name then
            v6 = v1.Set(v6, "isRequesting", false);
        end;
        return v6;
    end;
end;

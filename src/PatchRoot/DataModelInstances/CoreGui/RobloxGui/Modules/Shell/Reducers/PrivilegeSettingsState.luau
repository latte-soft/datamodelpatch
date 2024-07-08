local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Immutable);
local v2 = require(l_Modules_0.Shell.Actions.FetchPrivilegeSettings);
local v3 = require(l_Modules_0.Shell.Actions.SetPrivilegeSettings);
return function(v4, v5)
    v4 = v4 or {};
    if v5.type == v2.name then
        return (v1.Set(v4, "isRequesting", true));
    else
        if v5.type == v3.name then
            if not v5.Multiplayer or not v5.SharedContent then
                v4 = {};
            else
                return {
                    Multiplayer = v1.JoinDictionaries(v4.Multiplayer or {}, v5.Multiplayer), 
                    SharedContent = v1.JoinDictionaries(v4.SharedContent or {}, v5.SharedContent), 
                    lastUpdated = v5.timestamp, 
                    isRequesting = false
                };
            end;
        end;
        return v4;
    end;
end;

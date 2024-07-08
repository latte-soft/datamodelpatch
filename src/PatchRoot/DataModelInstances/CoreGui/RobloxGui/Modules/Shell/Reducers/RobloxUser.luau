local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.Shell.Actions.SetRobloxUser);
return function(v1, v2)
    v1 = v1 or {};
    if v2.type == v0.name then
        return {
            robloxName = v2.robloxName, 
            rbxuid = v2.rbxuid, 
            under13 = v2.under13
        };
    else
        return v1;
    end;
end;

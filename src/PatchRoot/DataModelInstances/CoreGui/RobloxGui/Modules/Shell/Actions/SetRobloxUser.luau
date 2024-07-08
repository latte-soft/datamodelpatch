return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)("SetRobloxUser", function(v0)
    v0 = v0 or {};
    return {
        robloxName = v0.robloxName, 
        rbxuid = v0.rbxuid, 
        under13 = v0.under13
    };
end);

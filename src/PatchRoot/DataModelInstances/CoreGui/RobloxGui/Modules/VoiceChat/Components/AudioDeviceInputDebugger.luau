local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Packages.Roact);
return function(v3)
    local l_instances_0 = v3.instances;
    local l_mutedPlayers_0 = v3.mutedPlayers;
    return v2.createElement("ScreenGui", {
        AutoLocalize = false, 
        DisplayOrder = 100, 
        IgnoreGuiInset = true, 
        OnTopOfCoreBlur = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, v2.createFragment(v1.List.map(v1.Dictionary.keys(l_instances_0), function(v6, v7)
        local l_Player_0 = v6.Player;
        return v2.createElement("TextLabel", {
            Text = "ADI: " .. (not l_Player_0 and "Unnamed" or l_Player_0.Name) .. " " .. (not v6.Active and "Inactive " or "Active ") .. ((not not l_Player_0 and l_mutedPlayers_0[l_Player_0.UserId]) and "localmuted" or "not-localmuted"), 
            Size = UDim2.fromOffset(200, 25), 
            AutomaticSize = Enum.AutomaticSize.X, 
            Position = UDim2.fromOffset(10, v7 * 28)
        });
    end)));
end;

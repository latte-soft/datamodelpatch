local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXWidgetsByContext);
return v2.makeActionCreator(script.Name, function(v4, v5)
    return {
        query = v4, 
        context = if not v3() then nil else v5
    };
end);

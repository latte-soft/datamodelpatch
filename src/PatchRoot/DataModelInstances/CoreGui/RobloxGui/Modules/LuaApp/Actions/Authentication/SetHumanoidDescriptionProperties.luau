local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return require(l_Modules_0.Common.Action)(script.Name, function(v3)
    v2.isType(v3, "table", "tableOfHumanoidDescriptionProperties passed into SetHumanoidDescriptionProperties");
    for v4, v5 in pairs(v3) do
        v2.isNonEmptyString(v4, "tableOfHumanoidDescriptionProperties's key (outfitId)");
        v2.isType(v5, "table", "tableOfHumanoidDescriptionProperties's value (table of HumanoidDescription properties)");
    end;
    return {
        tableOfHumanoidDescriptionProperties = v3
    };
end);

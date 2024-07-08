local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v5 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXWidgetsByContext);
return v2.makeActionCreator(script.Name, function(v6, v7, v8, v9)
    v3.isType(v6, "table", "SetWidgetInfo expects widgetInfo");
    return {
        widgetInfo = v6, 
        requestId = v7, 
        query = v8, 
        context = if not v5() then nil else v9
    };
end);

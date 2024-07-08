local v0 = require(game:GetService("CorePackages").Rodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Context.WidgetInfoContext);
return v0.makeActionCreator(script.Name, function(v4, v5, v6, v7, v8, v9, v10, v11)
    return {
        itemType = v4, 
        itemSubType = v5, 
        itemId = v6, 
        selectedInTryOnManager = v7, 
        overrideOrder = v8, 
        bundleInfo = v9, 
        widgetInfo = v10, 
        receivedBundleInfo = v11
    };
end);

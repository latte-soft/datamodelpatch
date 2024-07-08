local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Action);
local v2 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppAddSortsTopicLayoutDataInAppend);
return v1(script.Name, function(v3, v4, v5)
    return {
        groupId = v3, 
        sorts = v4, 
        sortsTopicLayoutData = if not v2() then nil else v5
    };
end);

local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Action);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
return v1(script.Name, function(v3, v4, v5)
    return {
        topicKey = v3, 
        topicContents = v4, 
        isAppend = v5
    };
end);

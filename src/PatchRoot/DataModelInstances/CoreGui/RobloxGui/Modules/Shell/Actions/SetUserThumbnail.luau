local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(l_CoreGui_0.RobloxGui.Modules.Common.Action);
local v2 = require(l_CoreGui_0.RobloxGui.Modules.LuaApp.mutedError);
return v1("SetUserThumbnail", function(v3)
    v3 = v3 or {};
    if v3.imageUrl and string.find(v3.imageUrl, "rbxthumb") == nil then
        v2("SetUserThumbnail thumbnailInfo.imageUrl isn't rbxthumb");
    end;
    return {
        success = v3.success, 
        rbxuid = v3.rbxuid, 
        imageUrl = v3.imageUrl, 
        thumbnailType = v3.thumbnailType, 
        thumbnailSize = v3.thumbnailSize, 
        isFinal = v3.isFinal, 
        timestamp = v3.timestamp
    };
end);

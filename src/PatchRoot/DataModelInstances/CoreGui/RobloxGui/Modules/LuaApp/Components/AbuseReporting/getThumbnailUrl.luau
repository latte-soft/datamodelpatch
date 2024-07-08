local _ = game:GetService("CorePackages");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.AbuseReporting.Constants);
return function(v2, v3)
    local v4 = nil;
    local v5 = nil;
    if not (v3 ~= "Profile") or v3 == "Chat" then
        v4 = v1.PROFILE_THUMBNAIL_DATA.Type;
        v5 = v1.PROFILE_THUMBNAIL_DATA.Size;
    elseif v3 == "ExperienceDetails" then
        v4 = v1.EXP_THUMBNAIL_DATA.Type;
        v5 = v1.EXP_THUMBNAIL_DATA.Size;
    elseif v3 == "Item" then
        v4 = v1.ITEM_THUMBNAIL_DATA.Type;
        v5 = v1.ITEM_THUMBNAIL_DATA.Size;
    end;
    if not v4 then
        return nil;
    else
        return string.format("rbxthumb://type=%s&id=%s&w=%d&h=%d", v4, v2, v5, v5);
    end;
end;

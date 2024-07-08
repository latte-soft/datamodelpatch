local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local l_Images_0 = v1.UIBlox.App.ImageSet.Images;
local v4 = require(l_Parent_0.Common.NotLocalizedStrings);
local v5 = require(l_Parent_0.Utils.isUserInGame);
local v6 = {};
local v7 = {
    [l_PresenceType_0.Offline] = "", 
    [l_PresenceType_0.Online] = "component_assets/circle_16", 
    [l_PresenceType_0.InGame] = "icons/menu/games_small", 
    [l_PresenceType_0.InStudio] = "icons/logo/studiologo_small"
};
v6.getPresenceIcon = function(v8)
    local v9 = v7[v8];
    return (not not v9 and v9 ~= "") and l_Images_0[v9] or nil;
end;
v6.getPresenceText = function(v10, v11, v12)
    if not v5(v10, v11) then
        if v10 == l_PresenceType_0.InStudio then
            if v11 and v11 ~= "" then
                return v11;
            else
                return v4.StudioPresenceTextGlobal.rawValue();
            end;
        else
            return v12;
        end;
    else
        return v11;
    end;
end;
return v6;

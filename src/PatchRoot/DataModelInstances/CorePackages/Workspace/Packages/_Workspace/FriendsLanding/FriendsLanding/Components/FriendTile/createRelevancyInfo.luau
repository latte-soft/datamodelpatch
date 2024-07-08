local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_UIBlox_0 = v1.UIBlox;
local v3 = require(l_script_FirstAncestor_0.Friends.isUserInGame);
local v4 = require(l_script_FirstAncestor_0.Friends.getCorrectUserPresence);
local v5 = require(l_script_FirstAncestor_0.Enums.NotLocalizedStrings);
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local v8 = UDim2.fromOffset(12, 12);
return function(v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
    local v19 = {};
    local v20 = v4(v9);
    v19.icon = not not v11 and l_Images_0[v11] or nil;
    if v20 == l_PresenceType_0.Online then
        if not v18 then
            v19.iconSize = v8;
        end;
        v19.iconColor = v13.OnlineStatus.Color;
        v19.iconTransparency = v13.OnlineStatus.Transparency;
    end;
    if not v9.isDeleted then
        if not v3(v9) then
            if v9.userPresenceType == l_PresenceType_0.InStudio then
                if v9.lastLocation and v9.lastLocation ~= "" then
                    v19.text = v9.lastLocation;
                else
                    v19.text = not not v15 and v5.StudioPresenceTextLuobu.rawValue() or v5.StudioPresenceTextGlobal.rawValue();
                end;
            else
                v19.text = v10;
            end;
        else
            v19.text = v9.lastLocation;
            v19.onActivated = v12(v9.universeId, v9.id, v14);
        end;
    else
        v19.text = v17;
    end;
    if not (v18 or not v16) then
        v19.fontStyle = not not v3(v9) and v16.CaptionHeader or v16.CaptionBody;
    end;
    return v19;
end;

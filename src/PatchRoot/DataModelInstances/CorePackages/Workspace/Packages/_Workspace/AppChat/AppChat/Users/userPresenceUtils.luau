local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_PresenceType_0 = require(l_script_FirstAncestor_0.Http.RoduxPresence).Enums.PresenceType;
local v3 = require(l_Parent_0.UIBlox).App.ImageSet.Images["component_assets/circle_25"];
local v4 = {
    [l_PresenceType_0.Offline] = "Common.Presence.Label.Offline", 
    [l_PresenceType_0.Online] = "Common.Presence.Label.Online", 
    [l_PresenceType_0.InGame] = "", 
    [l_PresenceType_0.InStudio] = ""
};
local v5 = {
    [l_PresenceType_0.Offline] = "", 
    [l_PresenceType_0.Online] = v3, 
    [l_PresenceType_0.InGame] = v3, 
    [l_PresenceType_0.InStudio] = v3
};
return {
    getUserDisplayPresence = function(v6, v7)
        if v6 then
            local v8, v9, v10;
            if v7 then
                v8 = {
                    text = v4[l_PresenceType_0.Online], 
                    image = v5[l_PresenceType_0.Online]
                };
                if v8 then
                    goto label0;
                end;
            end;
            v8 = {};
            v9 = v6.userPresenceType;
            v10 = v6.lastLocation;
            v8.text = if v9 == l_PresenceType_0.Offline then v4[l_PresenceType_0.Offline] else if v9 == l_PresenceType_0.Online then v4[l_PresenceType_0.Online] else if not (v9 ~= l_PresenceType_0.InGame) or v9 == l_PresenceType_0.InStudio then if v10 then tostring(v10) else v4[l_PresenceType_0.Online] else "";
            v8.image = v5[v6.userPresenceType];
            ::label0::;
            return v8;
        else
            return {
                text = ""
            };
        end;
    end, 
    getUserPresenceText = function(v11)
        local l_userPresenceType_0 = v11.userPresenceType;
        local l_lastLocation_0 = v11.lastLocation;
        if l_userPresenceType_0 == l_PresenceType_0.Offline then
            return v4[l_PresenceType_0.Offline];
        elseif l_userPresenceType_0 == l_PresenceType_0.Online then
            return v4[l_PresenceType_0.Online];
        elseif not (l_userPresenceType_0 ~= l_PresenceType_0.InGame) or l_userPresenceType_0 == l_PresenceType_0.InStudio then
            if not l_lastLocation_0 then
                return v4[l_PresenceType_0.Online];
            else
                return (tostring(l_lastLocation_0));
            end;
        else
            return "";
        end;
    end, 
    userPresenceImage = v5, 
    userPresenceText = v4
};

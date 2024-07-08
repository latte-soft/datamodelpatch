local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(l_Parent_0.Common.NotLocalizedStrings);
local v3 = require(l_Parent_0.Common.TextKeys);
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local v5 = {
    [l_PresenceType_0.Offline] = v3.PresenceOffline, 
    [l_PresenceType_0.Online] = v3.PresenceOnline
};
return function(v6)
    local v7 = {
        textKey = v5[v6.presence]
    };
    if v6.presence == l_PresenceType_0.InGame then
        v7.text = v6.lastLocation;
        v7.font = not not v6.font and v6.font.CaptionHeader or nil;
        v7.colorStyle = not not v6.theme and v6.theme.TextEmphasis or nil;
        return v7;
    else
        if v6.presence == l_PresenceType_0.InStudio then
            if v6.lastLocation and v6.lastLocation ~= "" then
                v7.text = v6.lastLocation;
                v7.font = not not v6.font and v6.font.CaptionHeader or nil;
                v7.colorStyle = not not v6.theme and v6.theme.TextEmphasis or nil;
                return v7;
            else
                v7.text = v2.StudioPresenceTextGlobal;
            end;
        end;
        return v7;
    end;
end;

local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_RoduxPresence_0 = v0.RoduxPresence;
local l_UserModel_0 = v0.UserModel;
local l_t_0 = v0.t;
local l_PresenceType_0 = l_RoduxPresence_0.Enums.PresenceType;
local v5 = {
    InGame = 3, 
    Online = 2, 
    InStudio = 1, 
    Offline = 0
};
local v6 = {
    [l_PresenceType_0.InGame.rawValue()] = v5.InGame, 
    [l_PresenceType_0.Online.rawValue()] = v5.Online, 
    [l_PresenceType_0.InStudio.rawValue()] = v5.InStudio, 
    [l_PresenceType_0.Offline.rawValue()] = v5.Offline
};
local v7 = {
    [l_UserModel_0.PresenceType.IN_GAME] = v5.InGame, 
    [l_UserModel_0.PresenceType.ONLINE] = v5.Online, 
    [l_UserModel_0.PresenceType.IN_STUDIO] = v5.InStudio, 
    [l_UserModel_0.PresenceType.OFFLINE] = v5.Offline
};
local function _(v8)
    return not not l_t_0.number(v8) and v6[v8] or v6[l_PresenceType_0.Offline];
end;
local function _(v10)
    return not not l_t_0.string(v10) and v7[v10] or v7[l_UserModel_0.PresenceType.OFFLINE];
end;
local function v18(v12, v13)
    local v14 = 0;
    local v15 = 0;
    if not v12.userPresenceType or not v13.userPresenceType then
        if not (not v12.presence or not v13.presence) then
            local l_presence_0 = v12.presence;
            v14 = not not l_t_0.string(l_presence_0) and v7[l_presence_0] or v7[l_UserModel_0.PresenceType.OFFLINE];
            l_presence_0 = v13.presence;
            v15 = not not l_t_0.string(l_presence_0) and v7[l_presence_0] or v7[l_UserModel_0.PresenceType.OFFLINE];
        end;
    else
        local v17 = v12.userPresenceType.rawValue();
        v14 = not not l_t_0.number(v17) and v6[v17] or v6[l_PresenceType_0.Offline];
        v17 = v13.userPresenceType.rawValue();
        if l_t_0.number(v17) then
            v15 = v6[v17];
            if v15 then
                goto label0;
            end;
        end;
        return v14, v6[l_PresenceType_0.Offline];
    end;
    ::label0::;
    return v14, v15;
end;
local function _(v19, v20)
    return (v19.username or v19.name) or "", (v20.username or v20.name) or "";
end;
return function(v22, v23)
    local v24, v25 = v18(v22, v23);
    if v24 ~= v25 then
        return v25 < v24;
    else
        local v26 = not not l_t_0.number(v22.friendRank) and v22.friendRank or 0;
        local v27 = not not l_t_0.number(v23.friendRank) and v23.friendRank or 0;
        if v26 ~= v27 then
            return v26 < v27;
        else
            local v28 = not not l_t_0.string(v22.displayName) and v22.displayName or "";
            local v29 = not not l_t_0.string(v23.displayName) and v23.displayName or "";
            if string.lower(v28) ~= string.lower(v29) then
                return string.lower(v28) < string.lower(v29);
            else
                return string.lower((v22.username or v22.name) or "") < string.lower((v23.username or v23.name) or "");
            end;
        end;
    end;
end;

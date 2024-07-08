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
    local l_userPresenceType_0 = v8.userPresenceType;
    local v10 = v8.lastLocation or "";
    if (not (l_userPresenceType_0 ~= l_PresenceType_0.InGame) or l_userPresenceType_0 == l_PresenceType_0.InStudio) and #v10 == 0 then
        return l_PresenceType_0.Online.rawValue();
    else
        return l_userPresenceType_0.rawValue();
    end;
end;
local function _(v12)
    local l_presence_0 = v12.presence;
    local v14 = v12.lastLocation or "";
    if (not (l_presence_0 ~= l_UserModel_0.PresenceType.IN_GAME) or l_presence_0 == l_UserModel_0.PresenceType.IN_STUDIO) and #v14 == 0 then
        return l_UserModel_0.PresenceType.ONLINE;
    else
        return l_presence_0;
    end;
end;
local function _(v16)
    local l_userPresenceType_1 = v16.userPresenceType;
    local v18 = if (not (l_userPresenceType_1 ~= l_PresenceType_0.InGame) or l_userPresenceType_1 == l_PresenceType_0.InStudio) and #(v16.lastLocation or "") == 0 then l_PresenceType_0.Online.rawValue() else l_userPresenceType_1.rawValue();
    return not not l_t_0.number(v18) and v6[v18] or v6[l_PresenceType_0.Offline];
end;
local function _(v20)
    local l_presence_1 = v20.presence;
    local v22 = if (not (l_presence_1 ~= l_UserModel_0.PresenceType.IN_GAME) or l_presence_1 == l_UserModel_0.PresenceType.IN_STUDIO) and #(v20.lastLocation or "") == 0 then l_UserModel_0.PresenceType.ONLINE else l_presence_1;
    return not not l_t_0.string(v22) and v7[v22] or v7[l_UserModel_0.PresenceType.OFFLINE];
end;
local function _(v24, v25)
    local v26 = 0;
    local v27 = 0;
    if not v24.userPresenceType or not v25.userPresenceType then
        if not (not v24.presence or not v25.presence) then
            local l_presence_2 = v24.presence;
            local v29 = if (not (l_presence_2 ~= l_UserModel_0.PresenceType.IN_GAME) or l_presence_2 == l_UserModel_0.PresenceType.IN_STUDIO) and #(v24.lastLocation or "") == 0 then l_UserModel_0.PresenceType.ONLINE else l_presence_2;
            v26 = not not l_t_0.string(v29) and v7[v29] or v7[l_UserModel_0.PresenceType.OFFLINE];
            l_presence_2 = v25.presence;
            v29 = if (not (l_presence_2 ~= l_UserModel_0.PresenceType.IN_GAME) or l_presence_2 == l_UserModel_0.PresenceType.IN_STUDIO) and #(v25.lastLocation or "") == 0 then l_UserModel_0.PresenceType.ONLINE else l_presence_2;
            v27 = not not l_t_0.string(v29) and v7[v29] or v7[l_UserModel_0.PresenceType.OFFLINE];
        end;
    else
        local l_userPresenceType_2 = v24.userPresenceType;
        local v31 = if (not (l_userPresenceType_2 ~= l_PresenceType_0.InGame) or l_userPresenceType_2 == l_PresenceType_0.InStudio) and #(v24.lastLocation or "") == 0 then l_PresenceType_0.Online.rawValue() else l_userPresenceType_2.rawValue();
        v26 = not not l_t_0.number(v31) and v6[v31] or v6[l_PresenceType_0.Offline];
        l_userPresenceType_2 = v25.userPresenceType;
        v31 = if (not (l_userPresenceType_2 ~= l_PresenceType_0.InGame) or l_userPresenceType_2 == l_PresenceType_0.InStudio) and #(v25.lastLocation or "") == 0 then l_PresenceType_0.Online.rawValue() else l_userPresenceType_2.rawValue();
        if l_t_0.number(v31) then
            v27 = v6[v31];
            if v27 then
                goto label0;
            end;
        end;
        return v26, v6[l_PresenceType_0.Offline];
    end;
    ::label0::;
    return v26, v27;
end;
local function _(v33, v34)
    return (v33.username or v33.name) or "", (v34.username or v34.name) or "";
end;
return function(v36, v37)
    local v38 = 0;
    local v39 = 0;
    if not v36.userPresenceType or not v37.userPresenceType then
        if not (not v36.presence or not v37.presence) then
            local l_presence_3 = v36.presence;
            local v41 = if (not (l_presence_3 ~= l_UserModel_0.PresenceType.IN_GAME) or l_presence_3 == l_UserModel_0.PresenceType.IN_STUDIO) and #(v36.lastLocation or "") == 0 then l_UserModel_0.PresenceType.ONLINE else l_presence_3;
            v38 = not not l_t_0.string(v41) and v7[v41] or v7[l_UserModel_0.PresenceType.OFFLINE];
            l_presence_3 = v37.presence;
            v41 = if (not (l_presence_3 ~= l_UserModel_0.PresenceType.IN_GAME) or l_presence_3 == l_UserModel_0.PresenceType.IN_STUDIO) and #(v37.lastLocation or "") == 0 then l_UserModel_0.PresenceType.ONLINE else l_presence_3;
            v39 = not not l_t_0.string(v41) and v7[v41] or v7[l_UserModel_0.PresenceType.OFFLINE];
        end;
    else
        local l_userPresenceType_3 = v36.userPresenceType;
        local v43 = if (not (l_userPresenceType_3 ~= l_PresenceType_0.InGame) or l_userPresenceType_3 == l_PresenceType_0.InStudio) and #(v36.lastLocation or "") == 0 then l_PresenceType_0.Online.rawValue() else l_userPresenceType_3.rawValue();
        v38 = not not l_t_0.number(v43) and v6[v43] or v6[l_PresenceType_0.Offline];
        l_userPresenceType_3 = v37.userPresenceType;
        v43 = if (not (l_userPresenceType_3 ~= l_PresenceType_0.InGame) or l_userPresenceType_3 == l_PresenceType_0.InStudio) and #(v37.lastLocation or "") == 0 then l_PresenceType_0.Online.rawValue() else l_userPresenceType_3.rawValue();
        v39 = not not l_t_0.number(v43) and v6[v43] or v6[l_PresenceType_0.Offline];
    end;
    local l_v38_0 = v38;
    local l_v39_0 = v39;
    if l_v38_0 ~= l_v39_0 then
        return l_v39_0 < l_v38_0;
    else
        v38 = not not l_t_0.number(v36.friendRank) and v36.friendRank or 0;
        v39 = not not l_t_0.number(v37.friendRank) and v37.friendRank or 0;
        if v38 ~= v39 then
            return v38 < v39;
        else
            local v46 = not not l_t_0.string(v36.displayName) and v36.displayName or "";
            local v47 = not not l_t_0.string(v37.displayName) and v37.displayName or "";
            if string.lower(v46) ~= string.lower(v47) then
                return string.lower(v46) < string.lower(v47);
            else
                return string.lower((v36.username or v36.name) or "") < string.lower((v37.username or v37.name) or "");
            end;
        end;
    end;
end;

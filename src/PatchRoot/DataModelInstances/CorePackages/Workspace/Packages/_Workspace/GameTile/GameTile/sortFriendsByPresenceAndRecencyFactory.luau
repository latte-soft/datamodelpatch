local l_UserModel_0 = require(script:FindFirstAncestor("GameTile").Parent.UserLib).Models.UserModel;
local v1 = {
    [l_UserModel_0.PresenceType.IN_GAME] = 3, 
    [l_UserModel_0.PresenceType.ONLINE] = 2, 
    [l_UserModel_0.PresenceType.IN_STUDIO] = 1, 
    [l_UserModel_0.PresenceType.OFFLINE] = 0
};
local function _(v2, v3)
    local v4 = false;
    if typeof(v2) == "number" then
        v4 = false;
        if typeof(v3) == "number" then
            v4 = v2 ~= v3;
        end;
    end;
    return v4;
end;
local function _(v6)
    local v7 = nil;
    if not (not v6 or not v6.presence) then
        v7 = v1[v6.presence];
    end;
    if v7 == nil then
        v7 = v1[l_UserModel_0.PresenceType.OFFLINE];
    end;
    return v7;
end;
return function(v9)
    return function(v10, v11)
        local v12 = nil;
        if not (not v10 or not v10.presence) then
            v12 = v1[v10.presence];
        end;
        if v12 == nil then
            v12 = v1[l_UserModel_0.PresenceType.OFFLINE];
        end;
        local l_v12_0 = v12;
        local v14 = nil;
        if not (not v11 or not v11.presence) then
            v14 = v1[v11.presence];
        end;
        if v14 == nil then
            v14 = v1[l_UserModel_0.PresenceType.OFFLINE];
        end;
        v12 = v14;
        if l_v12_0 == v12 then
            if v10.presence ~= l_UserModel_0.PresenceType.OFFLINE then
                local l_lastOnline_0 = v10.lastOnline;
                local l_lastOnline_1 = v11.lastOnline;
                v14 = false;
                if typeof(l_lastOnline_0) == "number" then
                    v14 = false;
                    if typeof(l_lastOnline_1) == "number" then
                        v14 = l_lastOnline_0 ~= l_lastOnline_1;
                    end;
                end;
                if v14 then
                    return v11.lastOnline < v10.lastOnline;
                end;
            end;
            return (v10[v9] or ""):lower() < (v11[v9] or ""):lower();
        else
            return v12 < l_v12_0;
        end;
    end;
end;

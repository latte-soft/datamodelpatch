local l_HttpService_0 = game:GetService("HttpService");
local v1 = nil;
pcall(function()
    v1 = game:GetService("PlatformService");
end);
local v2 = nil;
pcall(function()
    v2 = game:GetService("ThirdPartyUserService");
end);
local v3 = nil;
if v2 then
    v2.ActiveUserSignedOut:connect(function()
        v3 = {};
    end);
end;
local v4 = {};
local v7 = {
    addReloader = function(_, v6)
        if v4[v6] == nil then
            v4[v6] = {};
        end;
    end
};
v7.callReloader = function(_, v9, v10)
    if v4[v9] == nil then
        return ;
    else
        for v11, _ in pairs(v4[v9]) do
            v7:callReloaderFunc(v9, v11, v10);
        end;
        return ;
    end;
end;
v7.removeReloader = function(_, v14)
    if v4[v14] == nil then
        return ;
    else
        for v15, _ in pairs(v4[v14]) do
            v4[v14][v15] = nil;
        end;
        v4[v14] = nil;
        return ;
    end;
end;
local function _(v17, v18)
    if v17 and v18 then
        if not v4[v17] or not v4[v17][v18] then
            return ;
        else
            return v4[v17][v18];
        end;
    else
        return ;
    end;
end;
v7.addReloaderFunc = function(_, v21, v22, v23, v24)
    if not v4[v21] then
        v7:addReloader(v21);
        local v25 = l_HttpService_0:GenerateGUID();
        v4[v21][v25] = {
            reloaderFunc = v22, 
            interval = v23, 
            userRelated = v24, 
            lastUpdateTime = nil, 
            suspend = false, 
            mutex = false, 
            lastUserState = v24 and v3
        };
        spawn(function()
            while true do
                local l_v21_0 = v21;
                local l_v25_0 = v25;
                if if not not l_v21_0 and l_v25_0 then if v4[l_v21_0] and v4[l_v21_0][l_v25_0] then v4[l_v21_0][l_v25_0] else nil else nil then
                    l_v21_0 = v21;
                    l_v25_0 = v25;
                    local v28 = if not not l_v21_0 and l_v25_0 then if v4[l_v21_0] and v4[l_v21_0][l_v25_0] then v4[l_v21_0][l_v25_0] else nil else nil;
                    l_v21_0 = v28.interval;
                    if v28.lastUpdateTime then
                        l_v25_0 = tick() - v28.lastUpdateTime;
                        if l_v25_0 < l_v21_0 then
                            l_v21_0 = l_v21_0 - l_v25_0;
                        end;
                    end;
                    wait(l_v21_0);
                    l_v25_0 = v28.lastUserState;
                    if not v28.userRelated or l_v25_0 == v3 then
                        v7:callReloaderFunc(v21, v25, true);
                    else
                        v7:removeReloaderFunc(v21, v25);
                    end;
                else
                    break;
                end;
            end;
        end);
        return v25;
    else
        return ;
    end;
end;
v7.removeReloaderFunc = function(_, v30, v31)
    if not (v4[v30] ~= nil) or v4[v30][v31] == nil then
        return ;
    else
        v4[v30][v31] = nil;
        return ;
    end;
end;
v7.updateReloaderFunc = function(_, v33, v34, v35)
    local v36 = if not not v33 and v34 then if v4[v33] and v4[v33][v34] then v4[v33][v34] else nil else nil;
    if v36 then
        if v35 and type(v35) == "table" then
            for v37, v38 in pairs(v35) do
                v36[v37] = v38;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v7.suspendReloaderFunc = function(_, v40, v41)
    v7:updateReloaderFunc(v40, v41, {
        suspend = true
    });
end;
v7.resumeReloaderFunc = function(_, v43, v44)
    v7:updateReloaderFunc(v43, v44, {
        suspend = false
    });
end;
v7.callReloaderFunc = function(_, v46, v47, v48)
    local v49 = if not not v46 and v47 then if v4[v46] and v4[v46][v47] then v4[v46][v47] else nil else nil;
    if not (not v49 or not v49.reloaderFunc) then
        local v50 = false;
        if not v48 then
            if not v49.mutex then
                v50 = true;
            end;
        elseif not (v49.suspend or v49.mutex) and (not v49.lastUpdateTime or v49.interval <= tick() - v49.lastUpdateTime) then
            v50 = true;
        end;
        if v50 then
            v49.mutex = true;
            v49.lastUpdateTime = tick();
            v49.reloaderFunc();
            v49.mutex = false;
        end;
    end;
end;
if not UserSettings().GameSettings:InStudioMode() or game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows then
    pcall(function()
        v1.Resumed:connect(function()
            for _, v52 in pairs(v4) do
                spawn(function()
                    v7:callReloader(v52, true);
                end);
            end;
        end);
    end);
end;
return v7;

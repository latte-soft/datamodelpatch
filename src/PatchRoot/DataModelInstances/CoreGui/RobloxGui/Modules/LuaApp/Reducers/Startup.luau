local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Cryo);
local v2 = require(l_Modules_0.LuaApp.Reducers.GamesPageDataStatus);
local v3 = require(l_Modules_0.LuaApp.Reducers.HomePageDataStatus);
local v4 = require(l_Modules_0.LuaApp.Reducers.FetchHomePageDataStatusAll);
local v5 = require(l_Modules_0.LuaApp.Actions.SetPreloading);
local v6 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local function _(v7)
    local v8 = true;
    if v7 ~= v6.NotStarted then
        v8 = true;
        if v7 ~= v6.Fetching then
            v8 = true;
            if v7 ~= v6.Failed then
                v8 = v7 == v6.Done;
            end;
        end;
    end;
    return v8;
end;
local function v14(v10, v11)
    local l_v10_0 = v10;
    local v13 = true;
    if l_v10_0 ~= v6.NotStarted then
        v13 = true;
        if l_v10_0 ~= v6.Fetching then
            v13 = true;
            if l_v10_0 ~= v6.Failed then
                v13 = l_v10_0 == v6.Done;
            end;
        end;
    end;
    if not v13 then
        v10 = nil;
    end;
    l_v10_0 = v11;
    v13 = true;
    if l_v10_0 ~= v6.NotStarted then
        v13 = true;
        if l_v10_0 ~= v6.Fetching then
            v13 = true;
            if l_v10_0 ~= v6.Failed then
                v13 = l_v10_0 == v6.Done;
            end;
        end;
    end;
    if not v13 then
        v11 = nil;
    end;
    if v10 == nil then
        return v11;
    elseif v11 == nil then
        return v10;
    elseif not (v10 ~= v6.Failed) or v11 == v6.Failed then
        return v6.Failed;
    elseif v10 == v6.NotStarted and v11 == v6.NotStarted then
        return v6.NotStarted;
    elseif v10 == v6.Done and v11 == v6.Done then
        return v6.Done;
    else
        return v6.Fetching;
    end;
end;
return function(v15, v16)
    v15 = v15 or {};
    local v17 = v2(v15.GamesPageDataStatus, v16);
    local v18 = v3(v15.HomePageDataStatus, v16);
    local v19 = v4(v15.FetchHomePageDataStatusAll, v16);
    local v20 = v15.Preloading == nil and true or v15.Preloading;
    if v16.type == v5.name then
        v20 = v16.isPreloading;
    end;
    return {
        GamesPageDataStatus = v17, 
        HomePageDataStatus = v18, 
        FetchHomePageDataStatusAll = v19, 
        Preloading = v20, 
        AppDataStatus = v1.List.foldLeft({
            v17, 
            v18, 
            v19
        }, v14)
    };
end;

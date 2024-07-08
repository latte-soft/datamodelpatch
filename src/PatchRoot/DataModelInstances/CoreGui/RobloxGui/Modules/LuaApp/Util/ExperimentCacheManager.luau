local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_IXPService_0 = game:GetService("IXPService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.LuaApp.Flags.GetFFlagIXPExperimentCache);
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagExperimentCacheLogExposure);
local v8 = require(l_Modules_0.LuaApp.Flags.GetFFlagDisableCustomExposureLog);
local v9 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableExperimentCacheManagerInitFix);
local v10 = require(l_Modules_0.Personalization.Flags.FFlagLuaAppChartsExpCustomExposureLog);
local v11 = require(l_Modules_0.LuaApp.Enum.LocalStorageKey);
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local v14 = require(script.Parent.GetExperimentCacheLayers);
local v15 = require(l_Modules_0.Common.memoize);
local v16 = require(l_Modules_0.LuaApp.mutedError);
local v17 = {};
v17.__index = v17;
v17.new = function(v18, v19, v20)
    local v21 = {
        _ixpService = v18 or l_IXPService_0, 
        _eventIngest = v19 or l_EventIngest_0.new(l_EventIngestService_0), 
        _cache = {}, 
        _loadingStatusChanged = nil, 
        _layersToCache = v20 or v14(), 
        _exposureLoggingTable = {}
    };
    setmetatable(v21, v17);
    return v21;
end;
v17._getCachedVariables = function(_)
    local l_status_0, l_result_0 = pcall(function()
        return l_AppStorageService_0:GetItem(v11.ExperimentCache);
    end);
    if l_status_0 then
        local l_status_1, l_result_1 = pcall(function()
            return l_HttpService_0:JSONDecode(l_result_0);
        end);
        if l_status_1 then
            return l_result_1;
        end;
    end;
    return {};
end;
v17._flushToCache = function(_, v28)
    assert(type(v28) == "table", "expected table type for cache to persist");
    local l_status_2, l_result_2 = pcall(function()
        return l_HttpService_0:JSONEncode(v28);
    end);
    if l_status_2 then
        local l_status_3, l_result_3 = pcall(function()
            l_AppStorageService_0:SetItem(v11.ExperimentCache, l_result_2);
            l_AppStorageService_0:Flush();
        end);
        if not l_status_3 then
            warn(l_result_3);
        end;
    end;
end;
v17._onIXPInitialized = function(v33)
    local l_UserLayerLoadingStatus_0 = v33._ixpService:GetUserLayerLoadingStatus();
    if not (not (l_UserLayerLoadingStatus_0 ~= Enum.IXPLoadingStatus.Pending) or not v33._loadingStatusChanged) then
        v33._loadingStatusChanged:disconnect();
        v33._loadingStatusChanged = nil;
    end;
    if l_UserLayerLoadingStatus_0 == Enum.IXPLoadingStatus.Initialized then
        local v35 = {};
        for _, v37 in ipairs(v33._layersToCache) do
            local v38 = nil;
            do
                local l_v38_0 = v38;
                pcall(function()
                    l_v38_0 = v33._ixpService:GetUserLayerVariables(v37);
                end);
                v35[v37] = l_v38_0;
            end;
        end;
        v33:_flushToCache(v35);
    end;
end;
v17._logCustomExposure = function(v40, v41)
    assert(type(v41) == "string", "expected layerName to be a string");
    v40._eventIngest:setRBXEventStream("experimentCacheManager", "exposureLog", {
        layerName = v41
    });
end;
v17._containsLayer = function(v42, v43)
    return v15(function(v44)
        for _, v46 in ipairs(v42._layersToCache) do
            if v46 == v44 then
                return true;
            end;
        end;
        return false;
    end)(v43);
end;
v17.initialize = function(v47)
    if v6() then
        v47._cache = v47:_getCachedVariables();
        if v47._ixpService:GetUserLayerLoadingStatus() == Enum.IXPLoadingStatus.Initialized then
            v47:_onIXPInitialized();
            return ;
        else
            v47._loadingStatusChanged = v47._ixpService.OnUserLayerLoadingStatusChanged:Connect(function(v48)
                if not v9() then
                    v47:_onIXPInitialized();
                elseif v48 == Enum.IXPLoadingStatus.Initialized then
                    v47:_onIXPInitialized();
                    return ;
                end;
            end);
            return ;
        end;
    else
        return ;
    end;
end;
v17.getLayerVariables = function(v49, v50, v51)
    assert(type(v50) == "string", "expected layerName to be a string");
    if not v49:_containsLayer(v50) then
        v16("Layer " .. v50 .. " has not been configured to be cached, please add layer to `GetExperimentCacheLayers`");
    end;
    if not (v8() or v10 and v51) then
        if not v7() then
            v49:_logCustomExposure(v50);
        elseif v49._exposureLoggingTable[v50] == nil then
            v49:_logCustomExposure(v50);
            v49._exposureLoggingTable[v50] = true;
        end;
    end;
    return v49._cache[v50] or nil;
end;
v17.clearCache = function(v52)
    v52._cache = {};
    if v7() then
        v52._exposureLoggingTable = {};
    end;
    pcall(function()
        l_AppStorageService_0:SetItem(v11.ExperimentCache, "");
        l_AppStorageService_0:Flush();
    end);
end;
if v10 then
    v17.sendCustomExposureLog = function(v53, v54)
        if v53._exposureLoggingTable[v54] == nil then
            v53:_logCustomExposure(v54);
            v53._exposureLoggingTable[v54] = true;
        end;
    end;
end;
v17.default = v17.new();
return v17;

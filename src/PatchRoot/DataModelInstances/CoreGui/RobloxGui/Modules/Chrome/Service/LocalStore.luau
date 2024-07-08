local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_game_EngineFeature_0 = game:GetEngineFeature("InGameMenuStateStorageKey");
local v5 = require(script.Parent.Parent.Flags.GetFFlagEnableUnibarMaxDefaultOpen);
local l_GetFFlagChromeSurveySupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeSurveySupport;
local v7 = require(script.Parent.Parent.Flags.GetFFlagEnableChromeFTUX);
local v8 = nil;
local v9 = false;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v11 = "player_" .. tostring(not l_LocalPlayer_0 and 0 or l_LocalPlayer_0.UserId);
local function v12()
    if v8.LocalPlayer == nil then
        v8.LocalPlayer = {};
    end;
    if v8.LocalPlayer[v11] == nil then
        v8.LocalPlayer[v11] = {};
    end;
    if v8.AnyPlayer == nil then
        v8.AnyPlayer = {};
    end;
end;
local function v14(v13)
    if (not v13 or not v13.LocalPlayer) or not v13.LocalPlayer[v11] then
        return v13;
    else
        return v13.LocalPlayer[v11];
    end;
end;
local function v16(v15)
    if not v15 or not v15.AnyPlayer then
        return v15;
    else
        return v15.AnyPlayer;
    end;
end;
local function v21()
    if l_game_EngineFeature_0 then
        local l_status_0, l_result_0 = pcall(function()
            return l_AppStorageService_0:GetItem("InGameMenuState");
        end);
        if l_status_0 then
            v9 = true;
            if #l_result_0 > 0 then
                local l_status_1, l_result_1 = pcall(function()
                    return l_HttpService_0:JSONDecode(l_result_0);
                end);
                if not l_status_1 then
                    v8 = {};
                else
                    v8 = l_result_1;
                end;
            else
                v8 = {};
            end;
            v12();
        end;
        return ;
    else
        return ;
    end;
end;
local function v26()
    if l_game_EngineFeature_0 then
        if v9 then
            local l_status_2, l_result_2 = pcall(function()
                return l_HttpService_0:JSONEncode(v8);
            end);
            if not l_status_2 then
                error("Failed to encode JSON", 0);
            else
                local l_status_3, l_result_3 = pcall(function()
                    l_AppStorageService_0:SetItem("InGameMenuState", l_result_2);
                    l_AppStorageService_0:Flush();
                end);
                if not l_status_3 then
                    print(l_result_3);
                    error("Failed to write JSON to AppStorageService", 0);
                    return ;
                end;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
local function v27(v28)
    if type(v28) ~= "table" then
        return v28;
    else
        local v29 = {};
        for v30, v31 in pairs(v28) do
            v29[v30] = v27(v31);
        end;
        return v29;
    end;
end;
local function _(v32, v33, v34)
    if not v9 then
        v21();
    end;
    if v9 then
        local v35 = not not v34 and v34(v8) or v8;
        local v36 = v35[v32];
        v35[v32] = v27(v33);
        if v36 ~= v35[v32] then
            v26();
        end;
    end;
end;
local function _(v38, v39)
    if not v9 then
        v21();
    end;
    if v9 then
        local v40 = not not v39 and v39(v8) or v8;
        if v40 then
            return (v27(v40[v38]));
        end;
    end;
    return nil;
end;
local function _()
    if not ((not l_GetFFlagChromeSurveySupport_0() or not v5()) or not l_game_EngineFeature_0) then
        local l_v14_0 = v14;
        if not v9 then
            v21();
        end;
        local v43;
        if v9 then
            local v44 = not not l_v14_0 and l_v14_0(v8) or v8;
            if v44 then
                v43 = v27(v44.ChromeSeenCount);
                goto label0 --[[  true, true  ]];
            end;
        end;
        v43 = nil;
        ::label0::;
        if not (not v43 or not tonumber(v43)) then
            return v43;
        end;
    end;
    return 0;
end;
return {
    isEnabled = function()
        return l_game_EngineFeature_0;
    end, 
    storeForLocalPlayer = function(v46, v47)
        local l_v14_1 = v14;
        if not v9 then
            v21();
        end;
        if v9 then
            local v49 = not not l_v14_1 and l_v14_1(v8) or v8;
            local v50 = v49[v46];
            v49[v46] = v27(v47);
            if v50 ~= v49[v46] then
                v26();
            end;
        end;
    end, 
    loadForLocalPlayer = function(v51)
        local l_v14_2 = v14;
        if not v9 then
            v21();
        end;
        if v9 then
            local v53 = not not l_v14_2 and l_v14_2(v8) or v8;
            if v53 then
                return (v27(v53[v51]));
            end;
        end;
        return nil;
    end, 
    storeForAnyPlayer = function(v54, v55)
        local l_v16_0 = v16;
        if not v9 then
            v21();
        end;
        if v9 then
            local v57 = not not l_v16_0 and l_v16_0(v8) or v8;
            local v58 = v57[v54];
            v57[v54] = v27(v55);
            if v58 ~= v57[v54] then
                v26();
            end;
        end;
    end, 
    loadForAnyPlayer = function(v59)
        local l_v16_1 = v16;
        if not v9 then
            v21();
        end;
        if v9 then
            local v61 = not not l_v16_1 and l_v16_1(v8) or v8;
            if v61 then
                return (v27(v61[v59]));
            end;
        end;
        return nil;
    end, 
    clearCache = function()
        v9 = false;
        v8 = nil;
    end, 
    getChromeSeenCount = function()
        if not ((not l_GetFFlagChromeSurveySupport_0() or not v5()) or not l_game_EngineFeature_0) then
            local l_v14_3 = v14;
            if not v9 then
                v21();
            end;
            local v63;
            if v9 then
                local v64 = not not l_v14_3 and l_v14_3(v8) or v8;
                if v64 then
                    v63 = v27(v64.ChromeSeenCount);
                    goto label1 --[[  true, true  ]];
                end;
            end;
            v63 = nil;
            ::label1::;
            if not (not v63 or not tonumber(v63)) then
                return v63;
            end;
        end;
        return 0;
    end, 
    getValue = function(v65)
        if not v7() then
            return nil;
        else
            local l_v14_4 = v14;
            if not v9 then
                v21();
            end;
            if v9 then
                local v67 = not not l_v14_4 and l_v14_4(v8) or v8;
                if v67 then
                    return (v27(v67[v65]));
                end;
            end;
            return nil;
        end;
    end, 
    deleteValue = function(v68)
        if v7() then
            local l_v14_5 = v14;
            if not v9 then
                v21();
            end;
            if v9 then
                local v70 = not not l_v14_5 and l_v14_5(v8) or v8;
                local v71 = v70[v68];
                v70[v68] = v27(nil);
                if v71 ~= v70[v68] then
                    v26();
                end;
            end;
        end;
    end
};

local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_Modules_0.LuaApp.Thunks.FetchIXPUserInit);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v5 = require(l_Modules_0.LuaApp.Promise);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v7 = game:DefineFastString("LuaAppIXPLayerToLog", "AvatarMarketplace.RecommendationsAndSearch.Mobile");
local v8 = game:DefineFastFlag("LuaAppLogWaitUntilIXPUserInit", false);
return function(v9, v10, v11)
    local function v16(v12)
        if not v8 or v9 == nil then
            return ;
        else
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            l_Logger_0:info("[WaitUntilIXPUserInit] " .. v12 .. " -- LocalPlayer: {}", l_LocalPlayer_0 == nil and "nil" or ((not (l_LocalPlayer_0.UserId ~= 0) or l_LocalPlayer_0.UserId == nil) and "no User ID" or "valid"));
            local l_v9_UserLayerLoadingStatus_0 = v9:GetUserLayerLoadingStatus();
            local l_v9_UserStatusForLayer_0 = v9:GetUserStatusForLayer(v7);
            l_Logger_0:info("[WaitUntilIXPUserInit] UserLayerLoadingStatus: {}", l_v9_UserLayerLoadingStatus_0);
            if l_v9_UserStatusForLayer_0 ~= l_v9_UserLayerLoadingStatus_0 then
                l_Logger_0:info("[WaitUntilIXPUserInit] Status for layer {}: {}", v7, l_v9_UserStatusForLayer_0);
            end;
            return ;
        end;
    end;
    return function(v17)
        local v18 = v3.GetFetchingStatus(v17:getState(), v10, v9);
        if not (v18 ~= l_RetrievalStatus_0.Done) or v18 == l_RetrievalStatus_0.Failed then
            v16("resolve -- fetchStatus: " .. tostring(v18));
            return v5.resolve();
        else
            return v5.new(function(v19, _)
                v17:dispatch(v3.Fetch(v9, v10, v11)):andThen(function()
                    v16("resolve");
                    v19();
                end, function()
                    v16("reject");
                    v19();
                end);
            end);
        end;
    end;
end;

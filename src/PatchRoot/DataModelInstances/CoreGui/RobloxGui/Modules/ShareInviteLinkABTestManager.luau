local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_RobloxGui_0.Modules.Common.IXPServiceWrapper);
local l_game_EngineFeature_0 = game:GetEngineFeature("UniversalAppShareLinksStorageKey");
local v6 = require(l_Modules_0.Flags.GetFFlagShareInviteLinkContextMenuABTestEnabled);
local v7 = require(script.Parent.Flags.GetFStringLuaAppExperienceMenuLayer);
local v8 = {};
v8.__index = v8;
v8.new = function(v9)
    local v10 = {
        _currentSessionIsEnabled = nil, 
        _ixpServiceWrapper = v9 or v4
    };
    setmetatable(v10, v8);
    return v10;
end;
v8.initialize = function(v11)
    if v6() then
        local l_status_0, l_result_0 = pcall(function()
            return v11._ixpServiceWrapper:GetLayerData(v7());
        end);
        if l_status_0 then
            if v11._currentSessionIsEnabled == nil then
                v11._currentSessionIsEnabled = v11.getCachedValue();
            end;
            if not (not ((not not l_result_0 and l_result_0.share_invite_link_enabled) ~= v11._currentSessionIsEnabled) or not l_game_EngineFeature_0) then
                pcall(function()
                    l_AppStorageService_0:SetItem("ShareInviteLinkExperimentEnabled", (tostring(l_result_0.share_invite_link_enabled)));
                    l_AppStorageService_0:Flush();
                end);
            end;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v8.getCachedValue = function()
    if l_game_EngineFeature_0 then
        local l_status_1, l_result_1 = pcall(function()
            return l_AppStorageService_0:GetItem("ShareInviteLinkExperimentEnabled");
        end);
        if l_status_1 then
            return l_result_1 == "true";
        end;
    end;
    return false;
end;
v8.isShareInviteLinkEnabled = function(v16)
    if v16._currentSessionIsEnabled == nil then
        v16._currentSessionIsEnabled = v16.getCachedValue();
    end;
    return v16._currentSessionIsEnabled;
end;
v8.default = v8.new();
return v8;

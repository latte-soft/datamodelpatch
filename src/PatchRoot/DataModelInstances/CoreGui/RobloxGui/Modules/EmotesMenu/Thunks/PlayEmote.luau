local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local v8 = require(l_Parent_0.Analytics);
local v9 = require(l_Parent_0.Constants);
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v11 = require(l_Parent_1.RobloxTranslator);
local v12 = require(l_CoreGui_0.RobloxGui.Modules.EmotesMenu.Utility.MaybeSendEmoteFailureAnalyticsFromPlayer);
local v13 = require(l_Actions_0.HideMenu);
local v14 = require(l_Actions_0.HideError);
local v15 = require(l_Actions_0.ShowError);
local v16 = v8.new():withEventStream(l_EventStream_0.new(l_RbxAnalyticsService_0));
local function v21(v17, v18, v19, v20)
    if v18 then
        v16:onEmoteFailed(v19, v20, v18);
        v17:dispatch(v15((v11:FormatByKeyForLocale(v9.LocalizationKeys.ErrorMessages[v18], v17:getState().locale))));
        delay(v9.ErrorDisplayTimeSeconds, function()
            v17:dispatch(v14());
        end);
    end;
    v17:dispatch(v13());
end;
return function(_, v23, v24, _, _)
    return function(v27)
        local l_l_LocalPlayer_0_0 = l_LocalPlayer_0;
        if not v12(l_l_LocalPlayer_0_0, function(v29)
            v21(v27, v29, v23, v24);
        end) then
            v27:dispatch(v13());
            local l_Humanoid_0 = l_l_LocalPlayer_0_0.Character:FindFirstChildOfClass("Humanoid");
            local v31, v32, _ = pcall(function()
                return l_Humanoid_0:PlayEmoteAndGetAnimTrackById(v24);
            end);
            if not v31 or not v32 then
                v21(v27, v9.ErrorTypes.TemporarilyUnavailable, v23, v24);
                return ;
            else
                v16:onEmotePlayed(v23, v24);
                return ;
            end;
        else
            return ;
        end;
    end;
end;

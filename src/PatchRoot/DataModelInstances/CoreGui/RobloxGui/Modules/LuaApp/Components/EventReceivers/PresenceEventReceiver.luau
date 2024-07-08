local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v4 = require(l_CorePackages_0.RoactRodux);
local l_llama_0 = require(l_CorePackages_0.LuaSocialLibrariesDeps).llama;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_Modules_0.LuaApp.Constants);
local v8 = require(l_Modules_0.LuaApp.Thunks.Games.UpdateActivePresenceGamesDetails);
local v9 = require(l_Modules_0.LuaApp.Thunks.SetUserPresences);
local v10 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v11 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v12 = require(script.Parent.EventNetworking);
local l_NetworkStatus_0 = v12.RoduxNetworking.Enum.NetworkStatus;
local l_NetworkingPresence_0 = v12.NetworkingPresence;
local v15 = require(l_Modules_0.LuaApp.Components.EventReceivers.JoinYourFriendsRefreshEvent);
local l_FriendsCarouselPresenceUpdateSignal_0 = require(l_Modules_0.LuaApp.Components.FriendsCarousel.api).Signals.FriendsCarouselPresenceUpdateSignal;
local v17 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomeJoinYourFriendsPresenceFix);
local l_FFlagFriendsCarouselPresenceUpdatesEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFriendsCarouselPresenceUpdatesEnabled;
local v19 = require(l_Modules_0.LuaApp.Flags.FFlagPresencePropagationDelayMonitoringEnabledV2);
local v20 = game:DefineFastString("PresencePropagationDelayMetricName", "PresencePropagationDelay");
local v21 = v2.PureComponent:extend("PresenceEventReceiver");
v21.defaultProps = {
    networkImpl = v12.networkImpl
};
v21.init = function(v22)
    local l_RobloxEventReceiver_0 = v22.props.RobloxEventReceiver;
    local l_analytics_0 = v22.props.analytics;
    local l_eventIngestService_0 = v22.props.eventIngestService;
    local v26 = not not v22.props.dateTimeOverride and v22.props.dateTimeOverride.now or DateTime.now;
    v22.tokens = {
        l_RobloxEventReceiver_0:observeEvent("PresenceBulkNotifications", function(v27)
            v22.props.updateUserPresences((l_llama_0.List.map(v27, function(v28)
                return (tostring(v28.UserId));
            end))):andThen(function(v29)
                if l_FFlagFriendsCarouselPresenceUpdatesEnabled_0 then
                    l_FriendsCarouselPresenceUpdateSignal_0:Fire(v29);
                end;
                v22.props.updateActivePresenceGamesDetails(v22.props.networkImpl, v29);
            end);
            for _, v31 in v27, nil, nil do
                local l_Type_0 = v31.Type;
                if not v17() then
                    if l_Type_0 == v7.PresenceSignal.EventType then
                        v15:Fire();
                        return ;
                    end;
                else
                    local v33 = tostring(v31.UserId);
                    if l_Type_0 == v7.PresenceSignal.EventType and v33 ~= v22.props.localUserId then
                        v15:Fire();
                        return ;
                    end;
                end;
                if v19 and v31.SessionStarted ~= nil then
                    local v34 = DateTime.fromIsoDate(v31.SessionStarted);
                    if v34 ~= nil then
                        local l_UnixTimestampMillis_0 = v26().UnixTimestampMillis;
                        local l_UnixTimestampMillis_1 = v34.UnixTimestampMillis;
                        l_analytics_0.Diag:reportStats(v20, l_UnixTimestampMillis_0 - l_UnixTimestampMillis_1);
                        l_eventIngestService_0:sendEventDeferred("PresenceEventReceiver", "PresencePropagationDelay", {
                            deviceCurrentTimestampEpochMs = l_UnixTimestampMillis_0, 
                            sessionChangedTimestampEpochMs = l_UnixTimestampMillis_1
                        });
                    end;
                end;
            end;
        end)
    };
end;
v21.render = function(_)
    return nil;
end;
v21.willUnmount = function(v38)
    for _, v40 in pairs(v38.tokens) do
        v40:disconnect();
    end;
end;
local function _(v41, v42)
    return l_llama_0.List.filter(v42, function(v43)
        return l_NetworkingPresence_0.GetPresencesFromUserIds.getStatus(v41, v43) ~= l_NetworkStatus_0.Fetching;
    end);
end;
local function _(v45)
    return function(v46)
        local v47 = v46:getState();
        return v46:dispatch(l_NetworkingPresence_0.GetPresencesFromUserIds.API((l_llama_0.List.filter(v45, function(v48)
            return l_NetworkingPresence_0.GetPresencesFromUserIds.getStatus(v47, v48) ~= l_NetworkStatus_0.Fetching;
        end)))):andThen(function(v49)
            return v49.responseBody.userPresences or {};
        end);
    end;
end;
return v4.connect(function(v51, _)
    return {
        localUserId = if not v17() then nil else v51.LocalUserId
    };
end, function(v53)
    return {
        updateUserPresences = function(v54)
            return v53(function(v55)
                local v56 = v55:getState();
                return v55:dispatch(l_NetworkingPresence_0.GetPresencesFromUserIds.API((l_llama_0.List.filter(v54, function(v57)
                    return l_NetworkingPresence_0.GetPresencesFromUserIds.getStatus(v56, v57) ~= l_NetworkStatus_0.Fetching;
                end)))):andThen(function(v58)
                    return v58.responseBody.userPresences or {};
                end);
            end):andThen(function(v59)
                v53(v9(v59));
                return v59;
            end);
        end, 
        updateActivePresenceGamesDetails = function(v60, v61)
            v53(v8(v60, v61));
        end
    };
end)((l_RoactServices_0.connect({
    analytics = v10, 
    eventIngestService = v11
})(v21)));

local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("GuiService");
local l_SessionService_0 = game:GetService("SessionService");
local v3 = require(script:FindFirstAncestor("Modules").LuaApp.AppPage);
local v4 = require(l_CorePackages_0.Packages.ApolloClient);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Workspace.Packages.GraphQLServer);
local v7 = require(script.Parent.LaunchGameOnMount);
local v8 = require(l_CorePackages_0.Packages.React);
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_SetGamePlaySession_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SetGamePlaySession;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local v12 = require(l_CorePackages_0.Workspace.Packages.VirtualEvents);
local l_EventsList_0 = v12.EventsList;
local l_useQuery_0 = v4.useQuery;
local l_useMutation_0 = v4.useMutation;
local v16 = {
    pollInterval = 300000
};
return function(v17)
    local v18 = v5.Dictionary.join(v16, v17);
    local v19 = l_useNavigation_0();
    local _ = v8.useRef(true);
    local v21, v22 = v8.useState(nil);
    local v23 = v8.useMemo(function()
        return DateTime.now();
    end, {});
    local v24 = l_useQuery_0(v12.requests.GET_EVENTS_FOR_EXPERIENCE, {
        variables = {
            universeId = v18.universeId, 
            options = {
                fromUtc = v23:ToIsoDate()
            }
        }, 
        pollInterval = v18.pollInterval
    });
    local v31 = l_useMutation_0(v12.requests.UPDATE_RSVP_STATUS, {
        update = function(_, v26, v27)
            local l_virtualEvent_0 = v27.data.virtualEventRsvp.virtualEvent;
            v26:modify({
                id = v26:identify(l_virtualEvent_0), 
                fields = {
                    rsvpCounters = function(_, v30)
                        return v5.Dictionary.join(v30, {
                            going = v30.going + (l_virtualEvent_0.userRsvpStatus == "going" and 1 or -1)
                        });
                    end
                }
            });
        end
    });
    local v35 = v8.useCallback(function(v32, v33)
        v12.fireVirtualEventRSVP({
            virtualEventId = v32.id, 
            universeId = tostring(v32.universeId), 
            channel = v18.referralSource, 
            status = v33, 
            attendanceCount = if not not v32 and v32.experienceDetails then v32.experienceDetails.playing else 0
        });
        v31[1]({
            variables = {
                virtualEventId = v32.id, 
                rsvpStatus = v33
            }
        }):andThen(function(v34)
            if v34.data.virtualEventRsvp.shouldSeeNotificationsUpsellModal then
                v19.navigate(v3.EventNotificationsModal, {
                    extraProps = {
                        virtualEvent = v32, 
                        channel = v18.referralSource
                    }
                });
            end;
        end);
    end, {
        v18.referralSource
    });
    local v37 = v8.useCallback(function(v36)
        v19.navigate(v3.EventDetails, {
            extraProps = {
                currentTime = DateTime.now(), 
                virtualEventId = v36.id, 
                referralSource = v18.referralSource
            }
        });
    end, {
        v19
    });
    local v39 = v8.useCallback(function(v38)
        v12.fireVirtualEventImpression({
            virtualEventId = v38.id, 
            universeId = v38.universeId, 
            channel = v18.referralSource
        });
    end, {
        v18.referralSource
    });
    local v41 = v8.useCallback(function(v40)
        v22(v40);
    end, {});
    local v42 = v8.useCallback(function()
        l_SetGamePlaySession_0(l_SessionService_0, l_SessionType_0.StructuralIdentifier.GamePlayFromEventDetails, true);
        v12.fireVirtualEventJoined({
            virtualEventId = v21.id, 
            universeId = tostring(v21.universeId), 
            channel = v18.referralSource, 
            attendanceCount = if not not v21 and v21.experienceDetails then v21.experienceDetails.playing else 0
        });
    end, {
        v21
    });
    if not v24.data then
        return nil;
    else
        return (v8.createElement(v8.Fragment, nil, {
            GameLauncher = if not v21 then nil else v8.createElement(v7, {
                universeId = tostring(v21.universeId), 
                launchSource = v18.referralSource, 
                referralSource = v18.referralSource, 
                onGameLaunching = v42
            }), 
            EventsList = v8.createElement(l_EventsList_0, {
                layoutOrder = v18.layoutOrder, 
                virtualEvents = v24.data.virtualEventsByUniverseId.virtualEvents, 
                referralSource = v18.referralSource, 
                currentTime = v23, 
                onTileActivated = v37, 
                onRsvpChanged = v35, 
                onJoinEvent = v41, 
                onEventImpression = v39
            })
        }));
    end;
end;

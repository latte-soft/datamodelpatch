local l_CorePackages_0 = game:GetService("CorePackages");
local l_SessionService_0 = game:GetService("SessionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v4 = require(l_CorePackages_0.Packages.ApolloClient);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v7 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local _ = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local v14 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenGameDetails);
local v15 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_SetGamePlaySession_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SetGamePlaySession;
local v19 = require(l_CorePackages_0.Workspace.Packages.VirtualEvents);
local v20 = require(l_script_FirstAncestor_0.LuaApp.Enum.TransitionAnimation);
local v21 = require(script.Parent.LaunchGameOnMount);
local _ = v4.gql;
local l_useQuery_0 = v4.useQuery;
local l_useUserExperiment_0 = v6.useUserExperiment;
local l_useIXPService_0 = v6.useIXPService;
local l_getFFlagRemoveVirtualEventsExperiment_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagRemoveVirtualEventsExperiment;
local v27 = {
    referralSource = "link"
};
return function(v28)
    local v29 = v5.Dictionary.join(v27, v28);
    local v30 = l_useDispatch_0();
    local v31 = l_useNavigation_0();
    local v32, v33 = v7.useState(false);
    local v34 = v7.useRef(true);
    local l_l_GuiService_0_SafeZoneOffsets_0 = l_GuiService_0:GetSafeZoneOffsets();
    local v36 = l_useQuery_0(v19.requests.GET_VIRTUAL_EVENT, {
        variables = {
            virtualEventId = v29.virtualEventId
        }
    });
    local v37 = if not v36.data then nil else v36.data.virtualEvent;
    local v38 = if not not v37 and v37.universeId then tostring(v37.universeId) else nil;
    local v39 = not v37 and 0 or v37.experienceDetails.playing;
    local v40 = l_useLocalization_0({
        hostTitle = "Feature.GameDetails.Label.Developer"
    });
    local v41 = l_useIXPService_0();
    local v44 = if not l_getFFlagRemoveVirtualEventsExperiment_0() then l_useUserExperiment_0({
        "Ecosystems.EventsOnExperienceDetailsPage"
    }, function(v42)
        local v43 = v42["Ecosystems.EventsOnExperienceDetailsPage"];
        if not v43 then
            return nil;
        else
            return v43.virtualEventsMVPEnabled;
        end;
    end, false) else nil;
    local v45 = v7.useCallback(function()
        v31.goBack();
    end, {});
    local v46 = v7.useCallback(function()
        if v38 then
            v30(v14(v38));
        end;
    end, {
        v38
    });
    local v48 = v7.useCallback(function(v47)
        if l_default_0 then
            l_default_0:shareUrl({
                url = v47, 
                context = "eventDetailsPage"
            });
        end;
    end, {});
    local _ = v7.useCallback(function(v49)
        if v38 then
            v19.fireVirtualEventLinkCopied({
                virtualEventId = v29.virtualEventId, 
                virtualEventLink = v49, 
                universeId = v38, 
                attendanceCount = v39
            });
        end;
    end, {
        v29.virtualEventId, 
        v38, 
        v39
    });
    local v52 = v7.useCallback(function(v51)
        if v38 then
            v19.fireShareVirtualEventIconClicked({
                virtualEventId = v29.virtualEventId, 
                universeId = v38, 
                channel = "eventDetailsPage", 
                attendanceCount = v39
            });
            if not l_isSubjectToDesktopPolicies_0() then
                v48((l_UrlBuilder_0.virtualevents.appsflyer({
                    eventId = v29.virtualEventId
                })));
            else
                v31.navigate(v15.ShareVirtualEventModal, {
                    extraProps = {
                        virtualEventId = v29.virtualEventId, 
                        virtualEventLink = v51, 
                        universeId = v38, 
                        attendanceCount = v39
                    }
                });
                return ;
            end;
        end;
    end, {
        v29.virtualEventId, 
        v38, 
        v39
    });
    local v53 = v7.useCallback(function()
        v33(true);
    end, {});
    local v54 = v7.useCallback(function()
        l_SetGamePlaySession_0(l_SessionService_0, l_SessionType_0.StructuralIdentifier.GamePlayFromEventDetails, true);
        v19.fireVirtualEventJoined({
            virtualEventId = v37.id, 
            universeId = tostring(v37.universeId), 
            channel = "eventDetailsPage", 
            attendanceCount = v39
        });
    end, {
        v37, 
        v39
    });
    local v57 = v7.useCallback(function(v55, v56)
        v19.fireVirtualEventRSVP({
            virtualEventId = v37.id, 
            universeId = tostring(v37.universeId), 
            channel = "eventDetailsPage", 
            status = v55, 
            attendanceCount = v39
        });
        if v56 then
            if not l_getFFlagRemoveVirtualEventsExperiment_0() then
                v41:LogUserLayerExposure("Ecosystems.EventsOnExperienceDetailsPage");
                if v44 then
                    v31.navigate(v15.EventNotificationsModal, {
                        extraProps = {
                            virtualEvent = v37, 
                            channel = "eventDetailsPage"
                        }
                    });
                end;
            else
                v31.navigate(v15.EventNotificationsModal, {
                    extraProps = {
                        virtualEvent = v37, 
                        channel = "eventDetailsPage"
                    }
                });
                return ;
            end;
        end;
    end, {
        v37, 
        v31, 
        v39, 
        v44, 
        v41
    });
    v7.useEffect(function()
        if not (not v34.current or not v37) then
            v19.fireEventDetailsPageVisit({
                virtualEventId = v37.id, 
                universeId = tostring(v37.universeId), 
                channel = v29.referralSource
            });
            v34.current = false;
        end;
    end, {
        v37
    });
    return v7.createElement(v7.Fragment, nil, {
        GameLauncher = if not not v32 and v38 then v7.createElement(v21, {
            universeId = v38, 
            launchSource = "eventDetailsPage", 
            referralSource = v29.referralSource, 
            onGameLaunching = v54
        }) else nil, 
        Wrapper = v7.createElement("Frame", {
            Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, l_l_GuiService_0_SafeZoneOffsets_0.top), 
            Position = UDim2.fromOffset(0, l_l_GuiService_0_SafeZoneOffsets_0.top), 
            BackgroundTransparency = 1
        }, {
            EventDetailsPageLoader = v7.createElement(v19.EventDetailsPageLoader, {
                virtualEventId = v29.virtualEventId, 
                currentTime = DateTime.now(), 
                onClose = v45, 
                onShare = v52, 
                onRsvpChanged = v57, 
                onJoinEvent = v53, 
                onExperienceTileActivated = v46, 
                onHostActivated = v7.useCallback(function(v58)
                    v31.navigate(v15.GenericWebPage, {
                        detail = l_UrlBuilder_0.game.info.creator({
                            creatorType = v58.hostType == "group" and "Group" or "User", 
                            creatorId = v58.hostId
                        }), 
                        extraProps = {
                            title = v40.hostTitle, 
                            transitionAnimation = v20.SlideInFromRight
                        }
                    });
                end, {
                    v31, 
                    v40
                })
            })
        })
    });
end;

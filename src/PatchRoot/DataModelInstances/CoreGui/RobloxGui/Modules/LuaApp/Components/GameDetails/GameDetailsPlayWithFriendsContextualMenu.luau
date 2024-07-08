local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.Common.memoize);
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.UIBlox);
local v8 = require(l_CorePackages_0.Packages.Otter);
local l_IXPService_0 = game:GetService("IXPService");
local v10 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v12 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v14 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v15 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v16 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v17 = require(l_Modules_0.LuaApp.AppPage);
local v18 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v19 = require(l_Modules_0.LuaApp.Analytics.Events.Games.GameDetailsEvents);
local v20 = require(l_Modules_0.LuaApp.withLocalization);
local l_UserIconList_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).UserIconList;
local l_ShareGameToChat_0 = v19.ShareGameToChat;
local l_CreatePrivateGame_0 = v19.CreatePrivateGame;
local l_JoinFriendsInGame_0 = v19.JoinFriendsInGame;
local v25 = require(l_Modules_0.LuaApp.sortFriendsByPresenceAndRecency);
local v26 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_NetworkingSquads_0 = require(l_CorePackages_0.Workspace.Packages.Squads).NetworkingSquads;
local l_Images_0 = v7.App.ImageSet.Images;
local l_ContextualMenu_0 = v7.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v7.App.Menu.MenuDirection;
local v32 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v33 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
local l_GameInviteModalManager_0 = v33.GameInviteModalManager;
local l_GameInviteConstants_0 = v33.GameInviteConstants;
local l_GameInviteAnalyticsManager_0 = v33.GameInviteAnalyticsManager;
local l_GetFFlagEnableUniversalAppGameInviteUnification_0 = v10.GetFFlagEnableUniversalAppGameInviteUnification;
local l_GetFFlagLuaAppEnableSquadPage_0 = v10.GetFFlagLuaAppEnableSquadPage;
local l_GetFStringUniversalAppGameInviteMenuLayer_0 = v10.GetFStringUniversalAppGameInviteMenuLayer;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v41 = Vector2.new(64, 24);
local v48 = v4(function(v42, v43)
    if v42 and v43 then
        local v44 = {};
        for _, v46 in pairs(v43) do
            local v47 = v42[v46];
            if not (not v47 or not v47.isFriend) then
                table.insert(v44, v47);
            end;
        end;
        table.sort(v44, v25);
        return v44;
    else
        return {};
    end;
end);
local v49 = v5.PureComponent:extend("GameDetailsPlayWithFriendsContextualMenu");
v49.init = function(v50)
    v50.getMenuPos = function()
        if v50.props.menuPosition == nil then
            return UDim2.fromOffset(0, 0);
        else
            return v50.props.menuPosition;
        end;
    end;
    v50.getMenuSize = function()
        return UDim2.new(0, 300, 1, 0);
    end;
    v50.getMenuAnchor = function()
        if not (v50.props.menuPosition ~= nil) or v50.props.screenSize == nil then
            return nil;
        else
            return Vector2.new(0, 0);
        end;
    end;
end;
v49.getItems = function(v51, v52)
    local l_closeCallback_0 = v51.props.closeCallback;
    local l_createExperienceInvite_0 = v51.props.createExperienceInvite;
    local l_eventIngest_0 = v51.props.eventIngest;
    local l_rootPlaceId_0 = v51.props.rootPlaceId;
    local v57 = v48(v51.props.users, v51.props.inGameUsersByGame);
    local l_appTheme_0 = v51.props.appTheme;
    local l_privateServersEnabled_0 = v51.props.privateServersEnabled;
    local v60 = {};
    if l_GetFFlagLuaAppEnableSquadPage_0() then
        table.insert(v60, {
            text = "Drive Caravan", 
            icon = l_Images_0["icons/menu/groups"], 
            onActivated = function()
                l_createExperienceInvite_0(l_rootPlaceId_0);
                l_closeCallback_0();
            end
        });
    end;
    table.insert(v60, {
        text = v52.inviteFriends, 
        icon = l_Images_0["icons/actions/friends/friendInvite"], 
        onActivated = function()
            if v51.isMounted and l_rootPlaceId_0 then
                local v61 = false;
                if l_GetFFlagEnableUniversalAppGameInviteUnification_0() then
                    local v62 = l_GetFStringUniversalAppGameInviteMenuLayer_0();
                    local l_status_0, l_result_0 = pcall(function()
                        return l_IXPService_0:GetUserLayerVariables(v62);
                    end);
                    if l_status_0 then
                        l_IXPService_0:LogUserLayerExposure(v62);
                        v61 = not not l_result_0 and (l_result_0.inAppGameInviteUXRefresh2023 and true or false);
                    end;
                end;
                if not v61 then
                    v51.props.navigateDown({
                        name = v17.ShareGameToChat, 
                        detail = l_rootPlaceId_0, 
                        extraProps = {
                            source = "GameDetailsPlayWithFriendsContextualMenu"
                        }
                    });
                    l_ShareGameToChat_0(l_eventIngest_0, "GameDetailsPlayWithFriendsContextualMenu", l_rootPlaceId_0);
                else
                    l_GameInviteAnalyticsManager_0:withButtonName(l_GameInviteAnalyticsManager_0.ButtonName.GameDetailsPlayWithFriendsMenu);
                    l_GameInviteAnalyticsManager_0:inputShareGameEntryPoint(l_rootPlaceId_0, v51.props.universeId);
                    l_GameInviteModalManager_0:openModal({
                        trigger = l_GameInviteConstants_0.Triggers.GameDetailsPlayWithFriendsMenu, 
                        rootPlaceId = l_rootPlaceId_0, 
                        universeId = v51.props.universeId
                    });
                end;
                l_closeCallback_0();
                return ;
            else
                return ;
            end;
        end
    });
    if not (not v51.props.webViewSupport or not l_privateServersEnabled_0) then
        table.insert(v60, {
            text = v52.createPrivateGame, 
            icon = l_Images_0["icons/actions/edit/add"], 
            onActivated = function()
                if v51.isMounted and l_rootPlaceId_0 then
                    v51.props.navigateDown({
                        name = v17.GenericWebPage, 
                        detail = v26.game.info.serversPreopenCreateVip({
                            universeId = v51.props.universeId
                        }), 
                        extraProps = {
                            title = v52.createPrivateGame
                        }
                    });
                    l_CreatePrivateGame_0(l_eventIngest_0, "GameDetailsPlayWithFriendsContextualMenu", l_rootPlaceId_0);
                    l_closeCallback_0();
                    return ;
                else
                    return ;
                end;
            end
        });
    end;
    if v51.props.webViewSupport then
        table.insert(v60, {
            text = v52.joinFriendsInGame, 
            icon = l_Images_0["icons/actions/friends/friendsplaying"], 
            onActivated = function()
                if v51.isMounted and l_rootPlaceId_0 then
                    v51.props.navigateDown({
                        name = v17.GenericWebPage, 
                        detail = v26.game.info.servers({
                            universeId = v51.props.universeId
                        }), 
                        extraProps = {
                            title = v52.joinFriendsInGame
                        }
                    });
                    l_JoinFriendsInGame_0(l_eventIngest_0, "GameDetailsPlayWithFriendsContextualMenu", l_rootPlaceId_0);
                    l_closeCallback_0();
                    return ;
                else
                    return ;
                end;
            end, 
            renderRightSideGadget = function()
                return {
                    UserIconList = v5.createElement(l_UserIconList_0, {
                        users = v57, 
                        width = v41.X, 
                        height = v41.Y, 
                        maskColor = not not l_appTheme_0.Background and l_appTheme_0.Background.Color or nil
                    })
                };
            end, 
            rightSideGadgetSize = v41
        });
    end;
    return v60;
end;
v49.renderLandscapeContextualMenu = function(v65)
    local l_closeCallback_1 = v65.props.closeCallback;
    local l_screenSize_0 = v65.props.screenSize;
    return v20({
        inviteFriends = "Feature.GameDetails.Action.InviteFriends", 
        joinFriendsInGame = "Feature.GameDetails.Action.JoinFriendsInGame", 
        createPrivateGame = "Feature.GameDetails.Action.CreatePrivateGame"
    })(function(v68)
        return v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = v65.getMenuPos(), 
            Size = v65.getMenuSize()
        }, {
            ContextMenu = v5.createElement(l_ContextualMenu_0, {
                buttonProps = v65:getItems(v68), 
                open = true, 
                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                openPositionX = UDim.new(0, 0), 
                openPositionY = UDim.new(0, 0), 
                closeBackgroundVisible = false, 
                screenSize = l_screenSize_0, 
                onDismiss = l_closeCallback_1, 
                contextMenuWidthOverride = UDim.new(1, 0), 
                anchorPointOverride = v65:getMenuAnchor(), 
                motorOverrideOptions = {
                    motorCallback = v8.instant, 
                    open = {
                        targetValue = 1
                    }, 
                    close = {
                        targetValue = 0
                    }
                }
            })
        });
    end);
end;
v49.didMount = function(v69)
    v69.isMounted = true;
    local l_currentPage_0 = v69.props.currentPage;
    local l_closeCallback_2 = v69.props.closeCallback;
    if l_currentPage_0 ~= v17.GameDetail and l_currentPage_0 ~= v17.ExperienceDetail then
        l_closeCallback_2();
    end;
end;
v49.WillUnmount = function(v72)
    v72.isMounted = false;
end;
v49.renderPortraitContextualMenu = function(v73)
    local l_closeCallback_3 = v73.props.closeCallback;
    local l_screenSize_1 = v73.props.screenSize;
    return v20({
        inviteFriends = "Feature.GameDetails.Action.InviteFriends", 
        joinFriendsInGame = "Feature.GameDetails.Action.JoinFriendsInGame", 
        createPrivateGame = "Feature.GameDetails.Action.CreatePrivateGame"
    })(function(v76)
        return v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(if not (v73.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait) then (l_screenSize_1 ~= nil and l_screenSize_1.X > 0) and (v73.props.menuPosition.X.Offset / l_screenSize_1.X) / 2 or 0 else 0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            ContextMenu = v5.createElement(l_ContextualMenu_0, {
                buttonProps = v73:getItems(v76), 
                open = true, 
                menuDirection = l_MenuDirection_0.Up, 
                openPositionY = UDim.new(1, -76), 
                closeBackgroundVisible = false, 
                screenSize = l_screenSize_1, 
                onDismiss = l_closeCallback_3
            })
        });
    end);
end;
v49.render = function(v77)
    if not (v77.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait) then
        return v77:renderLandscapeContextualMenu();
    else
        return v77:renderPortraitContextualMenu();
    end;
end;
return l_RoactServices_0.connect({
    networking = v12, 
    localization = v14, 
    eventIngest = v15
})((l_RoactAppPolicy_0.connect(function(v78)
    return {
        webViewSupport = v78.getWebViewSupport()
    };
end)((v32((v6.connect(function(v79, v80)
    local v81 = v79.Navigation.history[#v79.Navigation.history];
    local v82 = v79.GameDetails[v80.universeId];
    local v83 = v79.Games[v80.universeId];
    return {
        rootPlaceId = (v82 and v82.rootPlaceId or v83 and v83.placeId) or nil, 
        currentPage = v81[#v81].name, 
        users = v79.Users, 
        inGameUsersByGame = v79.InGameUsersByGame[v80.universeId], 
        screenSize = v79.ScreenSize, 
        deviceOrientation = v79.DeviceOrientation, 
        privateServersEnabled = v79.GamePrivateServersEnabled[v80.universeId]
    };
end, function(v84)
    return {
        closeCallback = function()
            v84(v16());
        end, 
        navigateDown = function(v85)
            return v84(v18(v85));
        end, 
        createExperienceInvite = function(v86)
            return v84(l_NetworkingSquads_0.CreateExperienceInvite.API({
                userId = l_LocalPlayer_0.UserId, 
                placeId = v86, 
                membershipEntityId = "12345"
            }));
        end
    };
end)(v49)))))));

local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.withLocalization);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local v8 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_RoactAnalyticsCommonGameEvents_0 = v7.RoactAnalyticsCommonGameEvents;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v11 = require(l_Modules_0.LuaApp.Enum.FeatureContext);
local v12 = require(l_Modules_0.LuaApp.Thunks.OpenGameDetails);
local v13 = require(l_Modules_0.LuaApp.Models.User);
local l_PlayabilityStatusEnum_0 = require(l_CorePackages_0.Workspace.Packages.PlayabilityRodux).Enums.PlayabilityStatusEnum;
local l_ConvertUniverseIdToString_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).ConvertUniverseIdToString;
local v16 = require(l_Modules_0.LuaApp.Util.joinGame);
local v17 = require(l_Modules_0.LuaApp.Constants);
local v18 = require(l_Modules_0.LuaApp.Components.FitImageTextButton);
local v19 = require(l_Modules_0.LuaApp.Components.LoadingBarWithTheme);
local v20 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local l_EnableOptionalPlaceIdForUserIdGameJoins_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).EnableOptionalPlaceIdForUserIdGameJoins;
local l_SocialContextToastIxpConfig_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).SocialContextToastIxpConfig;
local l_GREEN_PRIMARY_0 = v17.Color.GREEN_PRIMARY;
local l_WHITE_0 = v17.Color.WHITE;
local l_VIEW_GAME_DETAILS_FROM_BUTTON_0 = v17.AnalyticsKeyword.VIEW_GAME_DETAILS_FROM_BUTTON;
local l_SmallRobuxIcon_0 = v17.SmallRobuxIcon;
local function v33(v27, v28, v29)
    assert(type(v27) == "number", "formatInteger expects a number; was given type: " .. type(v27));
    v28 = v28 or ",";
    v29 = v29 or 3;
    assert(v28, "cannot be nil");
    assert(v29, "cannot be nil");
    local v30 = string.format("%.0f", (math.abs(v27)));
    local v31 = #v30 % v29;
    if v31 == 0 then
        v31 = v29;
    end;
    local v32 = v30:sub(1, v31) .. v30:sub(v31 + 1):gsub("(" .. string.rep("%d", v29) .. ")", v28 .. "%1");
    if v27 < 0 then
        v32 = "-" .. v32;
    end;
    return v32;
end;
local v34 = {
    [v11.PeopleList] = {
        ViewDetailsEnabled = true, 
        JoinGameEnabled = true, 
        BuyToPlayButtonEnabled = true
    }, 
    [v11.PlacesList] = {
        ViewDetailsEnabled = false, 
        JoinGameEnabled = false, 
        BuyToPlayButtonEnabled = true
    }, 
    Default = {
        ViewDetailsEnabled = true, 
        JoinGameEnabled = true, 
        BuyToPlayButtonEnabled = true
    }
};
local v35 = v2.PureComponent:extend("GameButton");
v35.defaultProps = {
    showLoadingIndicatorWhenDataNotReady = false
};
v35.init = function(v36)
    v36.openGameDetailsFromButton = function()
        local l_universePlaceInfo_0 = v36.props.universePlaceInfo;
        if l_universePlaceInfo_0 then
            local l_analytics_0 = v36.props.analytics;
            local l_friend_0 = v36.props.friend;
            local l_index_0 = v36.props.index;
            local l_absolutePosition_0 = v36.props.absolutePosition;
            local l_callbackOnOpenGameDetails_0 = v36.props.callbackOnOpenGameDetails;
            local l_featureContext_0 = v36.props.featureContext;
            local l_universeRootPlaceId_0 = l_universePlaceInfo_0.universeRootPlaceId;
            local l_placeId_0 = l_universePlaceInfo_0.placeId;
            local l_universeId_0 = l_universePlaceInfo_0.universeId;
            if l_placeId_0 then
                if l_featureContext_0 == v11.PeopleList then
                    l_analytics_0.reportViewProfileFromPeopleList(l_friend_0.id, l_index_0, l_absolutePosition_0, l_universeRootPlaceId_0, l_VIEW_GAME_DETAILS_FROM_BUTTON_0);
                    l_analytics_0.reportOpenGameDetailFromPeopleList(l_friend_0.id, l_index_0, l_absolutePosition_0, l_universeRootPlaceId_0, l_universeId_0, "gameButton", "GameDetailFromGameButton");
                end;
                if l_callbackOnOpenGameDetails_0 then
                    l_callbackOnOpenGameDetails_0();
                end;
                v36.props.openGameDetails(l_universeId_0);
            end;
            return ;
        else
            return ;
        end;
    end;
    v36.joinGameByUser = function()
        local l_universePlaceInfo_1 = v36.props.universePlaceInfo;
        if l_universePlaceInfo_1 then
            local l_analytics_1 = v36.props.analytics;
            local l_friend_1 = v36.props.friend;
            local l_index_1 = v36.props.index;
            local l_callbackOnJoinGame_0 = v36.props.callbackOnJoinGame;
            local l_featureContext_1 = v36.props.featureContext;
            local l_absolutePosition_1 = v36.props.absolutePosition;
            local l_inGameFriendCount_0 = v36.props.inGameFriendCount;
            local l_source_0 = v36.props.source;
            local l_placeId_1 = l_universePlaceInfo_1.placeId;
            local l_universeRootPlaceId_1 = l_universePlaceInfo_1.universeRootPlaceId;
            if l_callbackOnJoinGame_0 then
                l_callbackOnJoinGame_0();
            end;
            local v58 = nil;
            local v59 = nil;
            if l_featureContext_1 == v11.PeopleList then
                v59 = v17.AnalyticsContext.PeopleListInHomePage;
                v58 = function(v60)
                    l_analytics_1.reportPeopleListJoinGame(l_friend_1.id, l_index_1, l_absolutePosition_1, l_placeId_1, l_universeRootPlaceId_1, l_friend_1.gameInstanceId, l_inGameFriendCount_0, v60, l_source_0);
                end;
            elseif l_featureContext_1 == v11.PlacesList then
                v59 = v17.AnalyticsContext.GamePlayIntentInPlacesList;
                v58 = function(v61)
                    l_analytics_1.reportJoinGameInPlacesList(l_friend_1.id, l_placeId_1, l_universeRootPlaceId_1, l_friend_1.gameInstanceId, v61);
                end;
            end;
            if not l_EnableOptionalPlaceIdForUserIdGameJoins_0() or not l_SocialContextToastIxpConfig_0.CheckIsFallbackPlaceIdParamEnabled() then
                v16:ByUser(l_friend_1, v59, v58);
                return ;
            else
                v16:ByUserAndPlaceId(l_friend_1, l_placeId_1, v59, v58);
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v35.render = function(v62)
    local l_universePlaceInfo_2 = v62.props.universePlaceInfo;
    if l_universePlaceInfo_2 or not v62.props.showLoadingIndicatorWhenDataNotReady then
        local l_localization_0 = v62.props.localization;
        local l_layoutOrder_0 = v62.props.layoutOrder;
        local l_maxWidth_0 = v62.props.maxWidth;
        local v67 = v34[v62.props.featureContext] or v34.Default;
        local v68 = false;
        local v69 = false;
        local v70 = nil;
        if l_universePlaceInfo_2 then
            v68 = v67.JoinGameEnabled and l_universePlaceInfo_2.isPlayable;
            v69 = v67.BuyToPlayButtonEnabled and l_universePlaceInfo_2.reasonProhibited == l_PlayabilityStatusEnum_0.PurchaseRequired;
            v70 = l_universePlaceInfo_2.price;
        end;
        local l_ViewDetailsEnabled_0 = v67.ViewDetailsEnabled;
        local function v92(v72, v73)
            local l_l_GREEN_PRIMARY_0_0 = l_GREEN_PRIMARY_0;
            local v75 = 0;
            local l_l_WHITE_0_0 = l_WHITE_0;
            local v77 = 0;
            local l_WHITE_1 = v17.Color.WHITE;
            local v79 = 0;
            local l_GRAY1_0 = v17.Color.GRAY1;
            local v81 = 0;
            local v82 = nil;
            if v72 then
                local l_Theme_0 = v72.Theme;
                local l_Font_0 = v72.Font;
                l_l_GREEN_PRIMARY_0_0 = l_Theme_0.ContextualPrimaryDefault.Color;
                v75 = l_Theme_0.ContextualPrimaryDefault.Transparency;
                l_l_WHITE_0_0 = l_Theme_0.ContextualPrimaryContent.Color;
                v77 = l_Theme_0.ContextualPrimaryContent.Transparency;
                l_WHITE_1 = l_Theme_0.SystemPrimaryDefault.Color;
                v79 = l_Theme_0.SystemPrimaryDefault.Transparency;
                l_GRAY1_0 = l_Theme_0.SystemPrimaryContent.Color;
                v81 = l_Theme_0.SystemPrimaryContent.Transparency;
                v82 = l_Font_0.Header2.Font;
            end;
            local l_l_l_GREEN_PRIMARY_0_0_0 = l_l_GREEN_PRIMARY_0_0;
            local l_v75_0 = v75;
            local l_l_l_WHITE_0_0_0 = l_l_WHITE_0_0;
            local l_v77_0 = v77;
            local v89 = nil;
            local v90 = nil;
            local v91 = nil;
            if not v68 then
                if not v69 then
                    if not l_ViewDetailsEnabled_0 then
                        return nil;
                    else
                        v89 = v73.viewDetailsText;
                        v90 = v62.openGameDetailsFromButton;
                        l_l_l_GREEN_PRIMARY_0_0_0 = l_WHITE_1;
                        l_v75_0 = v79;
                        l_l_l_WHITE_0_0_0 = l_GRAY1_0;
                        l_v77_0 = v81;
                    end;
                else
                    v90 = v62.openGameDetailsFromButton;
                    v91 = l_SmallRobuxIcon_0;
                end;
            else
                v89 = v73.joinText;
                v90 = v62.joinGameByUser;
            end;
            return v2.createElement(v18, {
                backgroundColor = l_l_l_GREEN_PRIMARY_0_0_0, 
                backgroundTransparency = l_v75_0, 
                backgroundImage = "rbxasset://textures/ui/LuaChat/9-slice/input-default.png", 
                layoutOrder = l_layoutOrder_0, 
                leftIconEnabled = v91 ~= nil, 
                leftIcon = v91, 
                maxWidth = l_maxWidth_0, 
                minWidth = 90, 
                textFont = v82, 
                text = not not v69 and v33(v70) or v89, 
                textColor = l_l_l_WHITE_0_0_0, 
                textTransparency = l_v77_0, 
                onActivated = v90
            });
        end;
        local function v95(v93)
            return l_withStyle_0(function(v94)
                return v92(v94, v93);
            end);
        end;
        if not v20() then
            return v95({
                joinText = l_localization_0:Format("Feature.Chat.Drawer.Join"), 
                viewDetailsText = l_localization_0:Format("Feature.Chat.Drawer.ViewDetails")
            });
        else
            return v5({
                joinText = "Feature.Chat.Drawer.Join", 
                viewDetailsText = "Feature.Chat.Drawer.ViewDetails"
            })(v95);
        end;
    else
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 104, 0, 32)
        }, {
            LoadingBar = v2.createElement(v19)
        });
    end;
end;
return (l_RoactServices_0.connect({
    analytics = l_RoactAnalyticsCommonGameEvents_0, 
    guiService = l_AppGuiService_0, 
    localization = v8
})((v3.connect(function(v96, v97)
    return {
        universePlaceInfo = v96.UniversePlaceInfos[l_ConvertUniverseIdToString_0(v97.universeId)], 
        inGameFriendCount = v96.FriendPresenceCounts[v13.PresenceType.IN_GAME]
    };
end, function(v98)
    return {
        openGameDetails = function(v99)
            v98(v12(v99));
        end
    };
end)(v35))));

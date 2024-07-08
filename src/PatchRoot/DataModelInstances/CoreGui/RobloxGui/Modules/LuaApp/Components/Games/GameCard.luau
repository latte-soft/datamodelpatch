local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local l_LaunchErrorLocalizationKeys_0 = require(l_CorePackages_0.Workspace.Packages.GameLaunch).LaunchErrorLocalizationKeys;
local l_ApiFetchPlayabilityStatus_0 = require(l_CorePackages_0.Workspace.Packages.PlayabilityRodux).PlayabilityStatus.ApiFetchPlayabilityStatus;
local v5 = require(l_CorePackages_0.Workspace.Packages.GameTile);
local l_SponsoredGamesRecordClick_0 = v5.SponsoredGamesRecordClick;
local l_OpenCentralOverlayForPlacesList_0 = v5.OpenCentralOverlayForPlacesList;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppGame_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGame;
local l_ImpressionsTagUtility_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ImpressionsTagUtility;
local l_ExperienceService_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).ExperienceService;
local l_UseExperienceService_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).Flags.UseExperienceService;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v14 = require(l_Modules_0.Common.Roact);
local v15 = require(l_Modules_0.Common.RoactRodux);
local v16 = require(l_Modules_0.Common.memoize);
local v17 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v18 = require(l_Modules_0.LuaApp.Constants);
local v19 = require(l_Modules_0.LuaApp.RoactMotion);
local v20 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v21 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v22 = require(l_Modules_0.LuaApp.AppPage);
local v23 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v24 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v25 = require(l_Modules_0.LuaApp.Thunks.NavigateSideways);
local v26 = require(l_Modules_0.LuaApp.Components.UIScaler);
local v27 = require(l_Modules_0.LuaApp.Components.Games.GameBasicStats);
local v28 = require(l_Modules_0.LuaApp.Components.Games.QuickLaunchAnimation);
local v29 = require(l_Modules_0.LuaApp.Components.GameThumbnail);
local v30 = require(l_Modules_0.LuaApp.Components.LocalizedTextLabel);
local v31 = require(l_Modules_0.LuaApp.Components.Games.FriendFooter);
local v32 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v33 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_FFlag_0 = settings():GetFFlag("EnableQuickGameLaunch");
local l_GRAY3_0 = v18.Color.GRAY3;
local l_WHITE_0 = v18.Color.WHITE;
local l_DEFAULT_GAME_ICON_0 = v18.DEFAULT_GAME_ICON;
local v38 = {
    [v18.GameCardLayoutType.Small] = {
        OuterMargin = 3, 
        InnerMargin = 3, 
        TitleTextSize = 16
    }, 
    [v18.GameCardLayoutType.Medium] = {
        OuterMargin = 6, 
        InnerMargin = 3, 
        TitleTextSize = 16
    }, 
    [v18.GameCardLayoutType.Large] = {
        OuterMargin = 6, 
        InnerMargin = 3, 
        TitleTextSize = 18
    }
};
local v39 = {
    GameCard = 2, 
    Sponsor = 3, 
    QuickLaunch = 4
};
local v40 = {
    HIDDEN = "Hidden", 
    SHORT_PRESS = "ShortPress", 
    PLAY_ANIMATION = "PlayAnimation", 
    REWIND_ANIMATION_BUTTON_UP = "RewindAnimationButtonUp", 
    REWIND_ANIMATION_BUTTON_DOWN = "RewindAnimationButtonDown", 
    HIDDEN_BUTTON_DOWN = "HiddenButtonDown"
};
local v41 = false;
local v42 = v14.PureComponent:extend("GameCard");
v42.defaultProps = {
    friendFooterEnabled = false
};
v42.isQuickLaunchVisible = function(v43)
    local v44 = true;
    if v43.state.quickLaunchState ~= v40.PLAY_ANIMATION then
        v44 = true;
        if v43.state.quickLaunchState ~= v40.REWIND_ANIMATION_BUTTON_DOWN then
            v44 = v43.state.quickLaunchState == v40.REWIND_ANIMATION_BUTTON_UP;
        end;
    end;
    return v44;
end;
v42.isAnimationRewind = function(v45)
    local v46 = true;
    if v45.state.quickLaunchState ~= v40.REWIND_ANIMATION_BUTTON_DOWN then
        v46 = v45.state.quickLaunchState == v40.REWIND_ANIMATION_BUTTON_UP;
    end;
    return v46;
end;
v42.isGameCardPressed = function(v47)
    local v48 = true;
    if v47.state.quickLaunchState ~= v40.SHORT_PRESS then
        v48 = true;
        if v47.state.quickLaunchState ~= v40.PLAY_ANIMATION then
            v48 = true;
            if v47.state.quickLaunchState ~= v40.REWIND_ANIMATION_BUTTON_DOWN then
                v48 = v47.state.quickLaunchState == v40.HIDDEN_BUTTON_DOWN;
            end;
        end;
    end;
    return v48;
end;
v42.eventDisconnect = function(v49)
    if v49.onAbsolutePositionChanged then
        v49.onAbsolutePositionChanged:Disconnect();
        v49.onAbsolutePositionChanged = nil;
    end;
end;
v42.setQuickLaunchState = function(v50, v51, v52)
    v50:setState({
        quickLaunchState = v51, 
        quickLaunchTriggerTime = not not l_FFlag_0 and v52 or 0
    });
end;
v42.Action_onButtonUp = function(v53)
    v53:eventDisconnect();
    v41 = false;
end;
v42.Action_onButtonDown = function(v54)
    v41 = true;
    v54:eventDisconnect();
    v54.onAbsolutePositionChanged = v54.gameCardRef.current and v54.gameCardRef.current:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
        v54.Event_buttonUp();
    end);
    if l_FFlag_0 and v54.props.playabilityFetchingStatus == v21.NotStarted then
        v54.props.fetchPlayabilityStatus(v54.props.networking, {
            v54.props.game.universeId
        });
    end;
end;
v42.Action_openGameDetails = function(v55)
    local l_universeId_0 = v55.props.game.universeId;
    if not v55.props.useSidewaysNavigation then
        v55.props.navigateDown({
            name = v22.GameDetail, 
            detail = l_universeId_0
        });
    else
        v55.props.navigateSideways({
            name = v22.GameDetail, 
            detail = l_universeId_0
        });
    end;
    v55.props.reportGameDetailOpened(v55.props.index);
    local l_networking_0 = v55.props.networking;
    local l_entry_0 = v55.props.entry;
    if l_entry_0.isSponsored then
        l_SponsoredGamesRecordClick_0(l_networking_0, l_entry_0.adId);
    end;
end;
v42.Action_launchGame = function(v59)
    if not l_UseExperienceService_0() then
        v59.props.game:launchGame({
            placeId = v59.props.game.placeId, 
            referralPage = "LuaGameCard"
        });
        return ;
    else
        l_ExperienceService_0:LaunchExperience({
            placeId = v59.props.game.placeId, 
            referralPage = "LuaGameCard"
        });
        return ;
    end;
end;
v42.Action_launchError = function(v60, v61)
    v60.props.setCurrentToastMessage({
        toastType = v20.QuickLaunchError, 
        toastMessage = l_LaunchErrorLocalizationKeys_0[v61], 
        toastSubMessage = "Feature.GamePage.QuickLaunch.ViewDetails", 
        universeId = v60.props.game.universeId, 
        placeId = v60.props.game.placeId
    });
end;
v42.init = function(v62)
    v62.gameCardRef = v14.createRef();
    v62.friendFooterRef = v14.createRef();
    v62.state = {
        quickLaunchState = v40.HIDDEN, 
        quickLaunchTriggerTime = 0
    };
    v62.Event_buttonDown = function()
        if not (v41 or v62:isGameCardPressed()) then
            v62:Action_onButtonDown();
            v62:setQuickLaunchState(v40.SHORT_PRESS, tick() + 0.125);
        end;
    end;
    v62.Event_buttonUp = function()
        local l_quickLaunchState_0 = v62.state.quickLaunchState;
        if not (l_quickLaunchState_0 ~= v40.SHORT_PRESS) or l_quickLaunchState_0 == v40.HIDDEN_BUTTON_DOWN then
            v62:Action_onButtonUp();
            v62:setQuickLaunchState(v40.HIDDEN);
            return ;
        else
            if not (l_quickLaunchState_0 ~= v40.PLAY_ANIMATION) or l_quickLaunchState_0 == v40.REWIND_ANIMATION_BUTTON_DOWN then
                v62:Action_onButtonUp();
                v62:setQuickLaunchState(v40.REWIND_ANIMATION_BUTTON_UP);
            end;
            return ;
        end;
    end;
    v62.Event_buttonShortPressed = function(v64)
        local l_game_0 = v62.props.game;
        local l_size_0 = v62.props.size;
        local l_openContextualMenu_0 = v62.props.openContextualMenu;
        local v68 = false;
        if v62.friendFooterRef.current then
            local l_Position_0 = v64.Position;
            local l_AbsoluteSize_0 = v62.friendFooterRef.current.AbsoluteSize;
            local l_AbsolutePosition_0 = v62.friendFooterRef.current.AbsolutePosition;
            local v72 = false;
            if l_AbsolutePosition_0.X <= l_Position_0.X then
                v72 = false;
                if l_Position_0.X <= l_AbsolutePosition_0.X + l_AbsoluteSize_0.X then
                    v72 = false;
                    if l_AbsolutePosition_0.Y <= l_Position_0.Y then
                        v72 = l_Position_0.Y <= l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y;
                    end;
                end;
            end;
            v68 = v72;
        end;
        if v62:isGameCardPressed() then
            v62:Action_onButtonUp();
            if not v68 then
                v62:Action_openGameDetails();
            else
                l_openContextualMenu_0(l_game_0, l_size_0, v62.getCardPosition());
            end;
            v62:setQuickLaunchState(v40.HIDDEN);
        end;
    end;
    v62.Event_animationDone = function()
        local v73 = v62.props.playabilityFetchingStatus == v21.Failed;
        local l_playabilityStatus_0 = v62.props.playabilityStatus;
        local v75 = not v73;
        local v76 = v73 and v21.Failed;
        if l_playabilityStatus_0 then
            v75 = l_playabilityStatus_0.isPlayable;
            v76 = l_playabilityStatus_0.playabilityStatus;
        end;
        if not v75 then
            v62:Action_launchError(v76);
            v62:setQuickLaunchState(v40.REWIND_ANIMATION_BUTTON_DOWN);
            return ;
        else
            v62:Action_launchGame();
            v62:Action_onButtonUp();
            v62:setQuickLaunchState(v40.HIDDEN);
            return ;
        end;
    end;
    v62.Event_rewindDone = function()
        if v62.state.quickLaunchState == v40.REWIND_ANIMATION_BUTTON_UP then
            v62:setQuickLaunchState(v40.HIDDEN);
            return ;
        else
            if v62.state.quickLaunchState == v40.REWIND_ANIMATION_BUTTON_DOWN then
                v62:setQuickLaunchState(v40.HIDDEN_BUTTON_DOWN);
            end;
            return ;
        end;
    end;
    v62.Event_routeChanged = function()
        if v62.state.quickLaunchState ~= v40.HIDDEN then
            v62:Action_onButtonUp();
            v62:setQuickLaunchState(v40.HIDDEN);
        end;
    end;
    v62.onButtonInputBegan = function(_, v78)
        if v78.UserInputState == Enum.UserInputState.Begin and (not (v78.UserInputType ~= Enum.UserInputType.Touch) or v78.UserInputType == Enum.UserInputType.MouseButton1) then
            v62.Event_buttonDown();
        end;
    end;
    v62.onButtonInputEnded = function(_, v80)
        if (v62.state.quickLaunchState == v40.SHORT_PRESS and v80.UserInputState == Enum.UserInputState.End) and (not (v80.UserInputType ~= Enum.UserInputType.Touch) or v80.UserInputType == Enum.UserInputType.MouseButton1) then
            v62.Event_buttonShortPressed(v80);
            return ;
        else
            v62.Event_buttonUp();
            return ;
        end;
    end;
    v62.renderSteppedCallback = function(_)
        local l_quickLaunchTriggerTime_0 = v62.state.quickLaunchTriggerTime;
        if l_quickLaunchTriggerTime_0 > 0 and l_quickLaunchTriggerTime_0 <= tick() then
            v62:setQuickLaunchState(v40.PLAY_ANIMATION);
        end;
    end;
    v62.getCardPosition = function()
        if not v62.gameCardRef.current then
            return Vector2.new(0, 0);
        else
            return v62.gameCardRef.current.AbsolutePosition;
        end;
    end;
    v62.getLayoutType = function(v83)
        if v83 >= 148 then
            return v18.GameCardLayoutType.Large;
        elseif v83 >= 100 then
            return v18.GameCardLayoutType.Medium;
        else
            return v18.GameCardLayoutType.Small;
        end;
    end;
    v62.getLayoutInfo = function(v84, v85)
        local l_size_1 = v62.props.size;
        local v87 = v2.Dictionary.join(v38[v84]);
        v87.TitleHeight = not not v85 and v87.TitleTextSize or v87.TitleTextSize * 2;
        v87.FooterHeight = l_size_1.Y - l_size_1.X;
        v87.FriendFooterHeight = (v87.FooterHeight - v87.OuterMargin * 2) - v87.TitleHeight;
        v87.FooterContentWidth = l_size_1.X - v87.OuterMargin * 2;
        return v87;
    end;
end;
v42.render = function(v88)
    local l_appTheme_0 = v88.props.appTheme;
    local l_size_2 = v88.props.size;
    local l_layoutOrder_0 = v88.props.layoutOrder;
    local l_entry_1 = v88.props.entry;
    local l_game_1 = v88.props.game;
    local l_friendFooterEnabled_0 = v88.props.friendFooterEnabled;
    local l_hasInGameFriends_0 = v88.props.hasInGameFriends;
    local l_name_0 = l_game_1.name;
    local l_universeId_1 = l_game_1.universeId;
    local l_totalDownVotes_0 = l_game_1.totalDownVotes;
    local l_totalUpVotes_0 = l_game_1.totalUpVotes;
    local l_playerCount_0 = l_entry_1.playerCount;
    local l_isSponsored_0 = l_entry_1.isSponsored;
    local v102 = l_friendFooterEnabled_0 and l_hasInGameFriends_0;
    local v103 = not l_isSponsored_0 and not v102;
    local v104 = l_isSponsored_0 and not v102;
    local v105 = v88.getLayoutType(l_size_2.X);
    local v106 = v88.getLayoutInfo(v105, l_isSponsored_0 or v102);
    local v107 = v88:isQuickLaunchVisible();
    local v108 = v88:isAnimationRewind();
    local v109 = v88:isGameCardPressed();
    local v110 = v88.props.gameCardTheme or l_appTheme_0.GameCard;
    local l_createElement_0 = v14.createElement;
    local v112 = "Frame";
    local v113 = {
        Size = UDim2.new(0, l_size_2.X, 0, l_size_2.Y), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_layoutOrder_0, 
        [v14.Ref] = v88.gameCardRef
    };
    local v114 = {
        GameButton = v14.createElement("TextButton", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            ZIndex = v39.GameCard, 
            [v14.Event.InputBegan] = v88.onButtonInputBegan, 
            [v14.Event.InputEnded] = v88.onButtonInputEnded
        }, {
            UIScaler = v14.createElement(v26, {
                scaleValue = v19.spring(not v109 and 1 or 0.9, 1000, 50, 0.5)
            }), 
            Icon = v14.createElement(v29, {
                Size = UDim2.new(0, l_size_2.X, 0, l_size_2.X), 
                universeId = l_universeId_1, 
                BackgroundColor3 = v18.Color.GRAY5, 
                loadingImage = l_DEFAULT_GAME_ICON_0, 
                ZIndex = v39.GameCard
            }), 
            GameInfoFooter = not v102 and v14.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v106.FooterHeight), 
                Position = UDim2.new(0, 0, 0, l_size_2.X), 
                BackgroundTransparency = v110.Background.Transparency, 
                BorderSizePixel = 0, 
                BackgroundColor3 = v110.Background.Color, 
                ZIndex = v39.GameCard
            }, {
                Layout = v14.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v106.InnerMargin)
                }), 
                Padding = v14.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v106.OuterMargin), 
                    PaddingRight = UDim.new(0, v106.OuterMargin), 
                    PaddingTop = UDim.new(0, v106.OuterMargin)
                }), 
                Title = v14.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, v106.TitleHeight), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    TextSize = v106.TitleTextSize, 
                    TextColor3 = v110.Title.Color, 
                    Font = v110.Title.Font, 
                    Text = l_name_0, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    TextWrapped = true
                }), 
                Info = v103 and v14.createElement(v27, {
                    LayoutOrder = 2, 
                    playerCount = l_playerCount_0, 
                    upVotes = l_totalUpVotes_0, 
                    downVotes = l_totalDownVotes_0, 
                    themeInfo = v110.GameBasicStats, 
                    layoutType = v18.GameBasicStatsLayoutType[v105]
                })
            }), 
            FriendFooter = v102 and v14.createElement("Frame", {
                Size = UDim2.new(0, l_size_2.X, 0, v106.FooterHeight), 
                Position = UDim2.new(0, 0, 0, l_size_2.X), 
                BackgroundTransparency = v110.Background.Transparency, 
                BackgroundColor3 = v110.Background.Color, 
                BorderSizePixel = 0, 
                ZIndex = v39.GameCard, 
                [v14.Ref] = v88.friendFooterRef
            }, {
                FriendFooter = v14.createElement(v31, {
                    universeId = l_universeId_1, 
                    innerMargin = v106.InnerMargin, 
                    outerMargin = v106.OuterMargin, 
                    titleTextSize = v106.TitleTextSize, 
                    footerContentWidth = v106.FooterContentWidth, 
                    footerContentHeight = v106.FriendFooterHeight
                })
            }), 
            Sponsor = v104 and v14.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 14 + v106.OuterMargin * 2), 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundColor3 = l_GRAY3_0, 
                BorderSizePixel = 0, 
                ZIndex = v39.Sponsor
            }, {
                SponsorText = v14.createElement(v30, {
                    Size = UDim2.new(1, -v106.OuterMargin * 2, 0, 14), 
                    Position = UDim2.new(0, v106.OuterMargin, 0, v106.OuterMargin), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    TextSize = 14, 
                    TextColor3 = l_WHITE_0, 
                    Font = Enum.Font.SourceSans, 
                    Text = "Feature.GamePage.Label.Sponsored"
                })
            }), 
            QuickLaunchAnimation = v107 and v14.createElement(v28, {
                Size = UDim2.new(1, 0, 1, 0), 
                ZIndex = v39.QuickLaunch, 
                gameCardHeight = l_size_2.Y, 
                rewindAnimation = v108, 
                onAnimationDoneCallback = v88.Event_animationDone, 
                onRewindDoneCallback = v88.Event_rewindDone
            })
        })
    };
    local v115 = false;
    if v88.state.quickLaunchTriggerTime > 0 then
        v115 = v14.createElement(v17, {
            event = l_RunService_0.renderStepped, 
            callback = v88.renderSteppedCallback
        });
    end;
    v114.renderStepped = v115;
    return l_createElement_0(v112, v113, v114);
end;
v42.didUpdate = function(v116, v117, _)
    if v117.currentRoute ~= v116.props.currentRoute then
        v116.Event_routeChanged();
    end;
    if not (v117.impressionsTag == v116.props.impressionsTag) or v117.index ~= v116.props.index then
        l_ImpressionsTagUtility_0.RemoveTag(v116.gameCardRef, v117.impressionsTag, v117.index);
        l_ImpressionsTagUtility_0.AddTag(v116.gameCardRef, v116.props.impressionsTag, v116.props.index);
    end;
end;
v42.didMount = function(v119)
    l_ImpressionsTagUtility_0.AddTag(v119.gameCardRef, v119.props.impressionsTag, v119.props.index);
end;
v42.willUnmount = function(v120)
    v120:Action_onButtonUp();
    l_ImpressionsTagUtility_0.RemoveTag(v120.gameCardRef, v120.props.impressionsTag, v120.props.index);
end;
v42 = v23(v42);
local v127 = v16(function(v121, v122, v123)
    if not (not v121 or not v122) and v123 then
        for _, v125 in pairs(v123) do
            if v125 ~= v121 then
                local v126 = v122[v125];
                if not (not v126 or not v126.isFriend) then
                    return true;
                end;
            end;
        end;
        return false;
    else
        return false;
    end;
end);
return l_RoactServices_0.connect({
    networking = v33, 
    game = l_AppGame_0
})((v15.connect(function(v128, v129)
    local l_universeId_2 = v129.entry.universeId;
    return {
        game = v128.Games[l_universeId_2], 
        hasInGameFriends = v127(v128.LocalUserId, v128.Users, v128.InGameUsersByGame[l_universeId_2]), 
        playabilityFetchingStatus = l_ApiFetchPlayabilityStatus_0.GetFetchingStatus(v128, l_universeId_2), 
        playabilityStatus = v128.PlayabilityStatus[l_universeId_2], 
        currentRoute = v128.Navigation.history[#v128.Navigation.history]
    };
end, function(v131)
    return {
        fetchPlayabilityStatus = function(v132, v133)
            return v131(l_ApiFetchPlayabilityStatus_0.Fetch(v132, v133));
        end, 
        setCurrentToastMessage = function(v134)
            return v131(v32(v134));
        end, 
        navigateDown = function(v135)
            v131(v24(v135));
        end, 
        navigateSideways = function(v136)
            v131(v25(v136));
        end, 
        openContextualMenu = function(v137, v138, v139)
            v131(l_OpenCentralOverlayForPlacesList_0(v137, v138, v139));
        end
    };
end)(v42)));

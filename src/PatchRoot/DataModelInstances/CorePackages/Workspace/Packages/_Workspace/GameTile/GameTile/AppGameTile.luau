local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local v2 = require(l_script_FirstAncestor_0.Footer.GridTileIconTextFooter);
local l_GridTileFriendFooter_0 = require(l_script_FirstAncestor_0.Footer.GridTileFriendFooter).GridTileFriendFooter;
local v4 = require(l_script_FirstAncestor_0.Footer.GridTileTextFooter);
local v5 = require(l_script_FirstAncestor_0.ZoomAnimatedFrame);
local v6 = require(l_script_FirstAncestor_0.AppGameTileLightweightOverlay);
local v7 = require(l_script_FirstAncestor_0.SponsoredGamesRecordClick);
local v8 = require(l_script_FirstAncestor_0.Footer.GameStats);
local v9 = require(l_script_FirstAncestor_0.Footer.UserIconList);
local v10 = require(l_script_FirstAncestor_0.Footer.ExperienceFooter);
local v11 = require(l_script_FirstAncestor_0.Footer.GridTileSponsoredFooter);
local v12 = require(l_script_FirstAncestor_0.Footer.GameTileOverlayPill);
local v13 = require(l_script_FirstAncestor_0.sortFriendsByPresenceAndRecencyFactory);
local v14 = require(l_script_FirstAncestor_0.OpenCentralOverlayForPlacesList);
local v15 = require(l_script_FirstAncestor_0.WideGameTileView);
local v16 = require(l_script_FirstAncestor_0.AppExperienceActionRow);
local v17 = require(l_script_FirstAncestor_0.WideGameTileActionRow);
local v18 = require(l_script_FirstAncestor_0.GameTileConstants);
local v19 = require(l_script_FirstAncestor_0.OpenSponsoredTooltip);
local _ = require(l_script_FirstAncestor_0.GameTileTypes);
local v21 = require(l_script_FirstAncestor_0.useIsHoveredTile);
local v22 = require(l_script_FirstAncestor_0.HoverTileCoordinator);
local v23 = require(l_script_FirstAncestor_0.Flags.getFFlagLuaAppSingleHoveredGridTile);
local v24 = require(l_script_FirstAncestor_0.Flags.getFFlagLuaAppSponsoredGridTiles);
local v25 = require(l_script_FirstAncestor_0.Flags.getFFlagLuaAppOverrideExperienceTitle);
local v26 = game:DefineFastFlag("LuaAppSocialFeaturePill", false);
local v27 = game:DefineFastFlag("LuaAppOverrideExperienceImage", false);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v29 = require(l_Parent_0.React);
local v30 = require(l_Parent_0.Roact);
local v31 = require(l_Parent_0.RoactRodux);
local v32 = require(l_Parent_0.Cryo);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_withNavigation_0 = require(l_Parent_0.RoactNavigation).withNavigation;
local v36 = require(l_Parent_0.t);
local v37 = require(l_Parent_0.DiscoveryUiBloxApi);
local l_withStyle_0 = v37.withStyle;
local l_Images_0 = v37.Images;
local l_ExperienceTileV3_0 = v37.ExperienceTileV3;
local l_AspectRatioModeEnum_0 = v37.AspectRatioModeEnum;
local l_withGridConfig_DEPRECATED_0 = v37.withGridConfig_DEPRECATED;
local l_ImpressionsTagUtility_0 = require(l_Parent_0.Impressions).ImpressionsTagUtility;
local l_useHoverState_0 = require(l_Parent_0.RoactUtils).Hooks.useHoverState;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_OpenGameDetails_0 = require(l_Parent_0.GameDetail).OpenGameDetails;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_IntervalPerformanceTracker_0 = require(l_Parent_0.IntervalPerformanceTracker).IntervalPerformanceTracker;
local l_GameIconReducer_0 = require(l_Parent_0.GameIconRodux).GameIcons.GameIconReducer;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_GetFFlagApolloClientFetchExperiences_0 = require(l_Parent_0.SharedFlags).GetFFlagApolloClientFetchExperiences;
local l_GetFFlagLightweightOverlayInVR_0 = require(l_Parent_0.SharedFlags).GetFFlagLightweightOverlayInVR;
local l_GetFFlagEnableNavigationPerformanceIntervals_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableNavigationPerformanceIntervals;
local l_FFlagLuaAppRefactorOpenGameDetail_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppRefactorOpenGameDetail;
local l_FFlagLuaAppGameTileProps_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileProps;
local l_FFlagLuaAppPlayButtonStyle_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPlayButtonStyle;
local v58 = game:DefineFastFlag("LuaAppWideTilePlayButtonStyle", false);
local l_FFlagLuaAppFixNavigationUidLogging_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFixNavigationUidLogging;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local l_game_EngineFeature_0 = game:GetEngineFeature("BatchThumbnailSupports256x144Asset");
local l_game_EngineFeature_1 = game:GetEngineFeature("BatchThumbnailSupports384x216Asset");
local v63 = game:DefineFastFlag("LuaAppHigherResGameThumbnail", false);
local v64 = UDim2.new(0.7, 0, 0, 0);
local v65 = UDim2.new(0.15, 0, 0.45, 0);
local v66 = {
    Voice = l_Images_0["icons/controls/voice/microphone_0_small_dark"], 
    Camera = l_Images_0["icons/controls/voice/video_on_small_dark"]
};
game:DefineFastInt("LuaAppGameTileHoverDelayMs", 130);
local function _()
    return game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000;
end;
local v68 = v30.PureComponent:extend("AppGameTile");
v68.validateProps = v36.strictInterface({
    entry = v36.table, 
    reportGameDetailOpened = v36.callback, 
    reportExperienceLaunched = v36.optional(v36.callback), 
    Size = if not l_FFlagLuaAppGameTileProps_0 then nil else v36.optional(v36.union(v36.UDim2, v36.table)), 
    ZIndex = if not l_FFlagLuaAppGameTileProps_0 then nil else v36.optional(v36.number), 
    size = if l_FFlagLuaAppGameTileProps_0 then nil else v36.optional(v36.Vector2), 
    useHoverTile = v36.optional(v36.boolean), 
    hasBackground = v36.boolean, 
    useGridTile = v36.boolean, 
    playerCountStyle = v36.optional(v36.string), 
    isSponsoredFooterAllowed = v36.optional(v36.boolean), 
    useExperienceTileMetadata = v36.boolean, 
    hideGameStats = v36.optional(v36.boolean), 
    gameTileLayoutType = v36.optional(v36.string), 
    topicId = v36.optional(v36.string), 
    playButtonStyle = if not l_FFlagLuaAppPlayButtonStyle_0 then nil else v36.optional(v36.string), 
    friendFooterEnabled = v36.optional(v36.boolean), 
    index = v36.optional(v36.number), 
    layoutOrder = v36.optional(v36.number), 
    source = v36.optional(v36.string), 
    referralSource = v36.optional(v36.string), 
    onPeekViewClosed = v36.optional(v36.callback), 
    rowNum = v36.optional(v36.number), 
    showFriendActivity = v36.boolean, 
    contentTextLineCount = v36.optional(v36.number), 
    thumbnailAspectRatioOverride = v36.optional(v36.string), 
    impressionsTag = v36.optional(v36.string), 
    launchExperienceEventContext = v36.optional(v36.string), 
    navigateToGameDetails = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then nil else v36.callback, 
    game = v36.optional(v36.table), 
    universeId = v36.string, 
    navigationUniverseId = v36.optional(v36.string), 
    name = v36.string, 
    totalUpVotes = v36.number, 
    totalDownVotes = v36.number, 
    friendActivityTitle = v36.optional(v36.string), 
    friendVisitedString = v36.optional(v36.string), 
    thumbnail = v36.string, 
    wideThumbnail = v36.optional(v36.string), 
    hasInGameFriends = v36.boolean, 
    users = v36.optional(v36.table), 
    inGameUsersByGame = v36.optional(v36.table), 
    rating = v36.optional(v36.string), 
    showAgeRating = v36.optional(v36.boolean), 
    ageRatingText = v36.optional(v36.string), 
    friendVisits = v36.table, 
    hidePlayButton = v36.boolean, 
    footerLayoutData = v36.optional(v36.table), 
    pill = if not v26 then nil else v36.optional(v36.strictInterface({
        types = v36.table
    })), 
    openGameDetails = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then v36.callback else nil, 
    openContextualMenu = v36.callback, 
    openSponsoredTooltip = v36.callback, 
    navigation = if not l_FFlagLuaAppRefactorOpenGameDetail_0 then v36.any else nil, 
    networking = v36.callback, 
    hoverRef = v36.table, 
    isHovered = v36.optional(v36.boolean)
});
v68.defaultProps = {
    useHoverTile = false, 
    hasBackground = false, 
    useExperienceTileMetadata = false, 
    useGridTile = false, 
    thumbnailAspectRatioOverride = l_AspectRatioModeEnum_0.Square, 
    contentTextLineCount = 2, 
    hideGameStats = false
};
v68.init = function(v69)
    v69.state = {
        isHovered = false
    };
    v69.reportExperienceLaunchedFromActionBar = function(...)
        v69.recordSponsoredGameClick();
        if not v23() then
            v69.props.reportExperienceLaunched(...);
        else
            if v69.props.isHovered then
                v22.default:reset();
            end;
            if v69.props.reportExperienceLaunched then
                v69.props.reportExperienceLaunched(...);
                return ;
            end;
        end;
    end;
    v69.renderAppExperienceActionRow = function(_)
        return v30.createElement(v16, {
            universeId = v69.props.navigationUniverseId, 
            referralSource = v69.props.referralSource, 
            launchSource = "ExperienceTile", 
            reportExperienceLaunched = if not v23() then v69.props.reportExperienceLaunched and v69.reportExperienceLaunchedFromActionBar else v69.reportExperienceLaunchedFromActionBar, 
            openGameDetails = v69.onActivated, 
            entry = v69.props.entry, 
            launchExperienceEventContext = v69.props.launchExperienceEventContext, 
            horizontalPadding = if not v69.props.useGridTile then nil else 0
        });
    end;
    v69.onHoverChanged = function(v71)
        v69:setState({
            isHovered = v71
        });
    end;
    v69.gameTileRef = v30.createRef();
    v69.getTilePosition = function()
        if not v69.gameTileRef.current then
            return nil;
        else
            return v69.gameTileRef.current.AbsolutePosition;
        end;
    end;
    v69.getTileSize = function()
        if l_FFlagLuaAppGameTileProps_0 or not v69.props.size then
            if not v69.gameTileRef.current then
                return nil;
            else
                return v69.gameTileRef.current.AbsoluteSize;
            end;
        else
            return v69.props.size;
        end;
    end;
    v69.recordSponsoredGameClick = function()
        local l_networking_0 = v69.props.networking;
        local l_entry_0 = v69.props.entry;
        if l_entry_0.isSponsored then
            v7(l_networking_0, l_entry_0.adId);
        end;
    end;
    v69.onActivated = function()
        if not (not v23() or not v69.props.isHovered) then
            v22.default:reset();
        end;
        if v69.isMounted then
            local l_navigationUniverseId_0 = v69.props.navigationUniverseId;
            local v75 = {
                source = v69.props.source, 
                index = v69.props.index, 
                referralSource = v69.props.referralSource, 
                onPeekViewClosed = v69.props.onPeekViewClosed
            };
            if l_GetFFlagEnableNavigationPerformanceIntervals_0() then
                l_IntervalPerformanceTracker_0:startTracking("AppGameTile_to_GameDetail", 2);
            end;
            if not l_FFlagLuaAppRefactorOpenGameDetail_0 then
                v69.props.openGameDetails(l_navigationUniverseId_0, v75, v69.props.navigation);
            else
                v69.props.navigateToGameDetails(l_navigationUniverseId_0, v75);
            end;
            local l_index_0 = v69.props.index;
            local l_reportGameDetailOpened_0 = v69.props.reportGameDetailOpened;
            if not l_FFlagLuaAppFixNavigationUidLogging_0 then
                l_reportGameDetailOpened_0(l_index_0);
            else
                l_reportGameDetailOpened_0(l_index_0, l_navigationUniverseId_0);
            end;
            v69.recordSponsoredGameClick();
        end;
    end;
    v69.onFriendFooterActivated = function()
        if v69.isMounted then
            v69.props.openContextualMenu(v69.props.game, v69.getTileSize(), v69.getTilePosition());
        end;
    end;
    v69.onActivateSponsoredTooltip = function()
        if v69.isMounted then
            v69.props.openSponsoredTooltip();
        end;
    end;
    v69.loadWideThumbnail = function()
        local l_wideThumbnail_0 = v69.props.wideThumbnail;
        if l_wideThumbnail_0 ~= nil then
            task.spawn(function()
                l_ContentProvider_0:PreloadAsync({
                    l_wideThumbnail_0
                });
            end);
        end;
    end;
    v69.getVisitedFriends = function()
        local v79 = {};
        local l_friendVisits_0 = v69.props.friendVisits;
        for v81 = 1, #l_friendVisits_0 do
            local v82 = tostring(l_friendVisits_0[v81].userId);
            if not (not v69.props.users or not v69.props.users[v82]) then
                table.insert(v79, {
                    userId = v82, 
                    displayName = v69.props.users[v82].displayName
                });
            end;
        end;
        return v79;
    end;
    v69.getSortedFriends = l_memoize_0(function(v83, v84)
        if v83 and v84 then
            local v85 = {};
            for _, v87 in pairs(v84) do
                local v88 = v83[v87];
                if not (not v88 or not v88.isFriend) then
                    if not v69.props.useGridTile then
                        table.insert(v85, v88);
                    else
                        table.insert(v85, {
                            userId = v88.id, 
                            displayName = v88.displayName
                        });
                    end;
                end;
            end;
            if not v69.props.useGridTile then
                table.sort(v85, (v13("name")));
                return v85;
            else
                table.sort(v85, (v13("displayName")));
                return v85;
            end;
        else
            return {};
        end;
    end);
    v69.renderOverlayPill = function()
        local v89 = {};
        if not (not v69.props.pill or not v69.props.pill.types) then
            for _, v91 in v69.props.pill.types, nil, nil do
                if not v66[v91] then
                    l_mutedError_0("Received invalid feature type for pill:" .. v91);
                else
                    table.insert(v89, v66[v91]);
                end;
            end;
        end;
        if #v89 > 0 then
            return (l_withStyle_0(function(v92)
                local l_Space_100_0 = v92.Tokens.Global.Space_100;
                return v29.createElement(v12, {
                    icons = v89, 
                    Position = UDim2.new(0, l_Space_100_0, 1, -l_Space_100_0), 
                    AnchorPoint = Vector2.new(0, 1)
                });
            end));
        else
            return nil;
        end;
    end;
end;
v68.renderFooter = function(v94)
    local _ = nil;
    local l_entry_1 = v94.props.entry;
    local l_isSponsored_0 = l_entry_1.isSponsored;
    local l_inGameUsersByGame_0 = v94.props.inGameUsersByGame;
    local l_playerCount_0 = l_entry_1.playerCount;
    local l_friendActivityTitle_0 = v94.props.friendActivityTitle;
    local l_useExperienceTileMetadata_0 = v94.props.useExperienceTileMetadata;
    local v102 = l_entry_1.isShowSponsoredLabel or v94.props.isSponsoredFooterAllowed;
    if not v94.props.useHoverTile and not l_useExperienceTileMetadata_0 then
        local l_friendFooterEnabled_0 = v94.props.friendFooterEnabled;
        local l_hasInGameFriends_0 = v94.props.hasInGameFriends;
        local l_totalUpVotes_0 = v94.props.totalUpVotes;
        local l_totalDownVotes_0 = v94.props.totalDownVotes;
        local v107 = v94.getSortedFriends(v94.props.users, l_inGameUsersByGame_0);
        local v108 = l_friendFooterEnabled_0 and l_hasInGameFriends_0;
        local v109 = {
            isSponsored = l_isSponsored_0, 
            isShowSponsoredLabel = v102, 
            playerCount = l_playerCount_0, 
            totalUpVotes = l_totalUpVotes_0, 
            totalDownVotes = l_totalDownVotes_0
        };
        if not l_isSponsored_0 or not v102 then
            if not v108 then
                if not l_friendActivityTitle_0 or not v94.props.showFriendActivity then
                    return (v30.createElement(v8, {
                        stats = v109, 
                        hideGameStats = v94.props.hideGameStats, 
                        onActivateSponsoredTooltip = v94.onActivateSponsoredTooltip
                    }));
                else
                    return (l_withStyle_0(function(v110)
                        local l_Font_0 = v110.Font;
                        local l_Theme_0 = v110.Theme;
                        return v30.createElement("TextLabel", {
                            Text = l_friendActivityTitle_0, 
                            TextColor3 = l_Theme_0.TextMuted.Color, 
                            Font = l_Font_0.CaptionSubHeader.Font, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.CaptionSubHeader.RelativeSize, 
                            Size = UDim2.new(1, 0, 1, 0), 
                            BorderSizePixel = 0, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Center, 
                            TextTransparency = l_Theme_0.TextMuted.Transparency, 
                            BackgroundTransparency = 1
                        });
                    end));
                end;
            else
                return (l_withStyle_0(function(v113)
                    return v30.createElement("TextButton", {
                        Text = "", 
                        Size = UDim2.new(1, 0, 0, 24), 
                        BackgroundTransparency = 1, 
                        [v30.Event.Activated] = v94.onFriendFooterActivated
                    }, {
                        UserIconList = v30.createElement(v9, {
                            users = v107, 
                            width = v94.getTileSize().X, 
                            height = 24, 
                            maskColor = v113.Theme.BackgroundDefault.Color
                        })
                    });
                end));
            end;
        else
            return (v30.createElement(v8, {
                stats = v109, 
                hideGameStats = v94.props.hideGameStats, 
                onActivateSponsoredTooltip = v94.onActivateSponsoredTooltip
            }));
        end;
    else
        return (v30.createElement(v10, {
            isSponsored = l_isSponsored_0, 
            isShowSponsoredLabel = v102, 
            isPlayable = true, 
            requiresPurchase = false, 
            rating = v94.props.rating, 
            playingCount = l_playerCount_0, 
            coPlayFriends = l_inGameUsersByGame_0, 
            showAgeRating = (v94.state.isHovered or l_useExperienceTileMetadata_0) and v94.props.showAgeRating, 
            localizedAgeRatingTextLabel = v94.props.ageRatingText, 
            friendActivityTitle = l_friendActivityTitle_0, 
            showFriendActivity = (l_friendActivityTitle_0 and v94.props.showFriendActivity) and not v94.state.isHovered, 
            useExperienceTileMetadata = l_useExperienceTileMetadata_0
        }));
    end;
end;
local function _(v114)
    if v114 == nil then
        return nil;
    elseif v114.type ~= "TextLabel" then
        return nil;
    else
        local l_text_0 = v114.text;
        if l_text_0 == nil then
            return nil;
        else
            return l_text_0.textLiteral;
        end;
    end;
end;
v68.renderGridTilesFooter = function(v117)
    local v118 = v117.props.useHoverTile or v117.props.useExperienceTileMetadata;
    local l_friendFooterEnabled_1 = v117.props.friendFooterEnabled;
    local l_hasInGameFriends_1 = v117.props.hasInGameFriends;
    local v121 = v117.getSortedFriends(v117.props.users, v117.props.inGameUsersByGame);
    local v122 = l_friendFooterEnabled_1 and l_hasInGameFriends_1;
    local v123 = v117.props.friendVisits and #v117.props.friendVisits > 0;
    local _ = nil;
    local l_footerLayoutData_0 = v117.props.footerLayoutData;
    local v126;
    if l_footerLayoutData_0 == nil then
        v126 = nil;
    elseif l_footerLayoutData_0.type ~= "TextLabel" then
        v126 = nil;
    else
        local l_text_1 = l_footerLayoutData_0.text;
        v126 = if l_text_1 == nil then nil else l_text_1.textLiteral;
    end;
    l_footerLayoutData_0 = false;
    if v126 ~= nil then
        l_footerLayoutData_0 = #v126 > 0;
    end;
    local v128 = nil;
    if v24() then
        local l_entry_2 = v117.props.entry;
        v128 = (l_entry_2.isShowSponsoredLabel or l_entry_2.isSponsored) or v117.props.isSponsoredFooterAllowed;
    end;
    if not v24() or not v128 then
        if not l_footerLayoutData_0 then
            if not v122 then
                if not v117.props.friendVisitedString then
                    if not v123 then
                        return (v30.createElement(v8, {
                            stats = {
                                totalUpVotes = v117.props.totalUpVotes, 
                                totalDownVotes = v117.props.totalDownVotes, 
                                playerCount = if v117.props.playerCountStyle == v18.PlayerCountStyleValues.Footer then v117.props.entry.playerCount else nil
                            }, 
                            isGridTile = v117.props.useGridTile, 
                            hideGameStats = v117.props.hideGameStats, 
                            useLargerFont = v118
                        }));
                    else
                        return (v30.createElement(l_GridTileFriendFooter_0, {
                            showOnlineBorder = false, 
                            friends = v117.getVisitedFriends(), 
                            useLargerFont = v118
                        }));
                    end;
                else
                    return (v30.createElement(v2, {
                        icon = l_Images_0["icons/menu/recent"], 
                        text = v117.props.friendVisitedString, 
                        iconSize = not v118 and 24 or 32, 
                        useLargerFont = v118
                    }));
                end;
            else
                return (v30.createElement(l_GridTileFriendFooter_0, {
                    showOnlineBorder = true, 
                    friends = v121, 
                    useLargerFont = v118
                }));
            end;
        else
            return (v29.createElement(v4, {
                text = v126, 
                useLargerFont = v118
            }));
        end;
    else
        return (v29.createElement(v11, {
            useLargerFont = v118, 
            onActivateSponsoredTooltip = v117.onActivateSponsoredTooltip
        }));
    end;
end;
v68.renderContent = function(v130, v131)
    local v132 = nil;
    v132 = if not l_FFlagLuaAppGameTileProps_0 then v130.props.size else v130.props.Size or UDim2.fromScale(1, 1);
    local l_useHoverTile_0 = v130.props.useHoverTile;
    local l_hasBackground_0 = v130.props.hasBackground;
    local l_wideThumbnail_1 = v130.props.wideThumbnail;
    local l_thumbnail_0 = v130.props.thumbnail;
    if not v130.props.useGridTile then
        return l_withStyle_0(function(v137)
            local v138 = {
                experienceName = v130.props.name, 
                thumbnail = l_thumbnail_0, 
                wideThumbnail = l_wideThumbnail_1, 
                footer = v130:renderFooter(), 
                thumbnailAspectRatioOverride = v130.props.thumbnailAspectRatioOverride, 
                contentTextLineCount = v130.props.contentTextLineCount, 
                onActivated = v130.onActivated, 
                isHoverEnabled = l_useHoverTile_0 and not l_IsVRAppBuild_0(), 
                onHoverChanged = if not l_useHoverTile_0 then nil else v130.onHoverChanged, 
                hoverDelay = game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000, 
                hasBackground = l_hasBackground_0, 
                hasOutline = l_hasBackground_0, 
                renderActionRow = if not l_useHoverTile_0 then nil else v130.renderAppExperienceActionRow, 
                styleProps = {
                    bottomContentPadding = {
                        Left = not l_hasBackground_0 and 0 or v137.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Leading, 
                        Right = not l_hasBackground_0 and 0 or v137.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Trailing, 
                        Top = v137.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Top, 
                        Bottom = v137.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Bottom
                    }
                }
            };
            local v140 = {
                Tile = l_withGridConfig_DEPRECATED_0({
                    gutter = 0, 
                    hoverTileTopOffset = 0, 
                    hoverTileBottomOffset = 0, 
                    hoverTileHorizontalOffset = 0
                })(function(v139)
                    return v30.createElement(v5, {
                        isZoomEnabled = v130.state.isHovered, 
                        expansionOffsetX = v139.gutter + v139.hoverTileHorizontalOffset, 
                        expansionOffsetTop = v139.hoverTileTopOffset, 
                        expansionOffsetBottom = v139.hoverTileBottomOffset, 
                        reducedMotion = v131
                    }, {
                        BaseTile = v30.createElement(l_ExperienceTileV3_0, v138)
                    });
                end)
            };
            if not l_GetFFlagLightweightOverlayInVR_0() then
                return v30.createElement("Frame", {
                    Size = if not l_FFlagLuaAppGameTileProps_0 then if v132 then UDim2.new(0, v132.X, 0, v132.Y) else UDim2.fromScale(1, 1) else v132, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v130.props.layoutOrder, 
                    ZIndex = if not l_FFlagLuaAppGameTileProps_0 then nil else v130.props.ZIndex, 
                    [v30.Ref] = v130.gameTileRef
                }, v140);
            else
                return v30.createElement(v6, {
                    size = v132, 
                    layoutOrder = v130.props.layoutOrder, 
                    [v30.Ref] = v130.gameTileRef, 
                    overlaySize = v64, 
                    overlayPosition = v65, 
                    overlayZIndex = 2, 
                    overlay = if not l_IsVRAppBuild_0() then nil else v130.renderAppExperienceActionRow
                }, v140);
            end;
        end);
    else
        local v141 = true;
        if v130.props.playerCountStyle ~= v18.PlayerCountStyleValues.Always then
            v141 = v130.props.isHovered and v130.props.playerCountStyle == v18.PlayerCountStyleValues.Hover;
        end;
        return v29.createElement("Frame", {
            Size = if not l_FFlagLuaAppGameTileProps_0 then if v132 then UDim2.new(0, v132.X, 0, v132.Y) else UDim2.fromScale(1, 1) else v132, 
            ZIndex = if not l_FFlagLuaAppGameTileProps_0 then nil else v130.props.ZIndex, 
            BackgroundTransparency = 1, 
            LayoutOrder = v130.props.layoutOrder, 
            ref = v130.gameTileRef
        }, {
            Tile = v29.createElement(v15, {
                Size = UDim2.fromScale(1, 1), 
                ageRatingText = v130.props.ageRatingText, 
                thumbnail = l_wideThumbnail_1, 
                title = v130.props.name, 
                onActivated = v130.onActivated, 
                reducedMotion = v131, 
                isHovered = v130.props.isHovered, 
                forwardRef = v130.props.hoverRef, 
                hidePlayButton = v130.props.hidePlayButton, 
                hoverActionRow = if v130.props.hidePlayButton then nil else v29.createElement(v17, {
                    universeId = v130.props.navigationUniverseId, 
                    referralSource = v130.props.referralSource, 
                    launchSource = "ExperienceTile", 
                    reportExperienceLaunched = if not v23() then v130.props.reportExperienceLaunched and v130.reportExperienceLaunchedFromActionBar else v130.reportExperienceLaunchedFromActionBar, 
                    openGameDetails = v130.onActivated, 
                    entry = v130.props.entry, 
                    launchExperienceEventContext = v130.props.launchExperienceEventContext, 
                    fetchDelayInSeconds = game:GetFastInt("LuaAppGameTileHoverDelayMs") / 1000
                }), 
                thumbnailOverlayPill = if not not v26 and v130.props.pill then v130.renderOverlayPill() else if v141 then v29.createElement(v8, {
                    stats = {
                        playerCount = v130.props.entry.playerCount, 
                        displayConcurrentUsersPill = true
                    }
                }) else nil, 
                footerMetadata = v130:renderGridTilesFooter(), 
                useLargerMetadataFontSize = v130.props.useHoverTile or v130.props.useExperienceTileMetadata
            })
        });
    end;
end;
v68.render = function(v142)
    if v142.props.game == nil then
        return nil;
    else
        return l_withStyle_0(function(v143)
            return v142:renderContent(v143.Settings.ReducedMotion);
        end);
    end;
end;
v68.didMount = function(v144)
    v144.isMounted = true;
    l_ImpressionsTagUtility_0.AddTag(v144.gameTileRef, v144.props.impressionsTag, v144.props.index);
    if v144.props.useGridTile then
        v144.loadWideThumbnail();
    end;
end;
v68.willUnmount = function(v145)
    v145.isMounted = false;
    l_ImpressionsTagUtility_0.RemoveTag(v145.gameTileRef, v145.props.impressionsTag, v145.props.index);
end;
v68.didUpdate = function(v146, v147)
    if not (v147.impressionsTag == v146.props.impressionsTag) or v147.index ~= v146.props.index then
        l_ImpressionsTagUtility_0.RemoveTag(v146.gameTileRef, v147.impressionsTag, v147.index);
        l_ImpressionsTagUtility_0.AddTag(v146.gameTileRef, v146.props.impressionsTag, v146.props.index);
    end;
    if v146.props.useGridTile and v147.universeId ~= v146.props.universeId then
        v146.loadWideThumbnail();
    end;
end;
local v154 = l_memoize_0(function(v148, v149, v150)
    if not (not v148 or not v149) and v150 then
        for _, v152 in pairs(v150) do
            if v152 ~= v148 then
                local v153 = v149[v152];
                if not (not v153 or not v153.isFriend) then
                    return true;
                end;
            end;
        end;
        return false;
    else
        return false;
    end;
end);
local function _(v155, v156)
    if v155 + v156 == 0 then
        return "--";
    else
        return tostring((math.floor((v155 / (v155 + v156)) * 100 + 0.5))) .. "%";
    end;
end;
local function _(v158, v159)
    if not v63 then
        if not (not l_game_EngineFeature_0 or not v158) and v158 ~= "0" then
            return (("rbxthumb://type=Asset&id=%*&w=256&h=144"):format(v158));
        else
            return (("rbxthumb://type=GameThumbnail&id=%*&w=256&h=144"):format(v159));
        end;
    else
        if v158 and v158 ~= "0" then
            if not l_game_EngineFeature_1 then
                if l_game_EngineFeature_0 then
                    return (("rbxthumb://type=Asset&id=%*&w=256&h=144"):format(v158));
                end;
            else
                return (("rbxthumb://type=Asset&id=%*&w=384&h=216"):format(v158));
            end;
        end;
        return (("rbxthumb://type=GameThumbnail&id=%*&w=384&h=216"):format(v159));
    end;
end;
local function _(v161, v162)
    if not v161 then
        return (("rbxthumb://type=GameIcon&id=%*&w=150&h=150"):format(v162));
    else
        return v161;
    end;
end;
local function _(v164, v165)
    if not (not ((not v164 or not v164.layoutDataBySort) or not v165) and v165 ~= "") or not v164.layoutDataBySort[v165] then
        if not v164 or not v164.defaultLayoutData then
            return {};
        else
            return v164.defaultLayoutData;
        end;
    else
        return v164.layoutDataBySort[v165];
    end;
end;
v68 = v31.connect(function(v167, v168)
    local l_universeId_0 = v168.entry.universeId;
    local v170 = if (not not v168.entry.navigationUniverseId and v168.entry.navigationUniverseId ~= "") and v168.entry.navigationUniverseId ~= "0" then v168.entry.navigationUniverseId else v168.entry.universeId;
    local v171 = if not l_GetFFlagApolloClientFetchExperiences_0() then v167.Games[l_universeId_0] else v168.entry;
    local v172 = not not v171 and v171.totalUpVotes or 0;
    local v173 = not not v171 and v171.totalDownVotes or 0;
    local v174 = not not v171 and v171.friendActivityTitle or nil;
    local v175 = nil;
    local v176 = nil;
    local v177 = not not v171 and v171.minimumAge or 0;
    local v178 = not not v171 and v171.ageRecommendationDisplayName or "";
    local v179 = nil;
    if l_FFlagLuaAppPlayButtonStyle_0 then
        v179 = if v168.gameTileLayoutType == "Event" then v168.playButtonStyle ~= v18.PlayButtonStyleValues.Enabled else if v58 then v168.gameTileLayoutType == "Wide" and v168.playButtonStyle == v18.PlayButtonStyleValues.Disabled else false;
    end;
    if not if not l_FFlagLuaAppPlayButtonStyle_0 then v168.gameTileLayoutType == "Event" else v179 then
        if v177 ~= 0 and v178 ~= "" then
            v175 = true;
            v176 = v178;
        else
            v175 = false;
        end;
    else
        v175 = false;
    end;
    local v180 = nil;
    local v181 = nil;
    if not v27 then
        v181 = not not v171 and v171.primaryWideAssetId or nil;
    else
        local l_topicId_0 = v168.topicId;
        v180 = if (((not not v171 and v171.layoutDataBySort) and l_topicId_0) and l_topicId_0 ~= "") and v171.layoutDataBySort[l_topicId_0] then v171.layoutDataBySort[l_topicId_0] else if v171 and v171.defaultLayoutData then v171.defaultLayoutData else {};
        v181 = ((v180 and v180.primaryMediaAsset) and v180.primaryMediaAsset.wideImageAssetId or v171 and v171.primaryWideAssetId) or nil;
    end;
    local l_v181_0 = v181;
    local l_placeId_0 = v168.entry.placeId;
    local v185 = if not v63 then if (l_game_EngineFeature_0 and l_v181_0) and l_v181_0 ~= "0" then ("rbxthumb://type=Asset&id=%*&w=256&h=144"):format(l_v181_0) else ("rbxthumb://type=GameThumbnail&id=%*&w=256&h=144"):format(l_placeId_0) else if l_v181_0 and l_v181_0 ~= "0" then if l_game_EngineFeature_1 then ("rbxthumb://type=Asset&id=%*&w=384&h=216"):format(l_v181_0) else if l_game_EngineFeature_0 then ("rbxthumb://type=Asset&id=%*&w=256&h=144"):format(l_v181_0) else ("rbxthumb://type=GameThumbnail&id=%*&w=384&h=216"):format(l_placeId_0) else ("rbxthumb://type=GameThumbnail&id=%*&w=384&h=216"):format(l_placeId_0);
    l_placeId_0 = if not v168.useGridTile then (not not v167[l_GameIconReducer_0.key][l_universeId_0] and v167[l_GameIconReducer_0.key][l_universeId_0].url or nil) or ("rbxthumb://type=GameIcon&id=%*&w=150&h=150"):format(l_universeId_0) else v185;
    local v186 = if v168.useHoverTile or v168.useExperienceTileMetadata then v172 + v173 == 0 and "--" or tostring((math.floor((v172 / (v172 + v173)) * 100 + 0.5))) .. "%" else nil;
    local v187 = not not v171 and v171.friendVisits or {};
    local v188 = if not not v171 and v171.friendVisitedString ~= "" then v171.friendVisitedString else nil;
    if not v27 then
        local l_topicId_1 = v168.topicId;
        v180 = if (((not not v171 and v171.layoutDataBySort) and l_topicId_1) and l_topicId_1 ~= "") and v171.layoutDataBySort[l_topicId_1] then v171.layoutDataBySort[l_topicId_1] else if v171 and v171.defaultLayoutData then v171.defaultLayoutData else {};
    end;
    local v190 = not not v180 and v180.footer or nil;
    local v191 = nil;
    if v25() then
        v191 = (not not v180 and v180.title or v171 and v171.name) or "";
    end;
    local v192 = nil;
    if v26 then
        v192 = not not v180 and v180.pill or nil;
    end;
    return {
        game = v171, 
        universeId = l_universeId_0, 
        navigationUniverseId = v170, 
        name = if not v25() then v171 and v171.name or "" else v191, 
        totalUpVotes = v172, 
        totalDownVotes = v173, 
        thumbnail = l_placeId_0, 
        wideThumbnail = v185, 
        friendActivityTitle = v174, 
        hasInGameFriends = v154(v167.LocalUserId, v167.Users, v167.InGameUsersByGame[l_universeId_0]), 
        users = v167.Users, 
        inGameUsersByGame = v167.InGameUsersByGame[l_universeId_0], 
        rating = v186, 
        showAgeRating = v175, 
        ageRatingText = v176, 
        friendVisits = v187, 
        friendVisitedString = v188, 
        hidePlayButton = if not l_FFlagLuaAppPlayButtonStyle_0 then v168.gameTileLayoutType == "Event" else v179, 
        footerLayoutData = v190, 
        pill = if not v26 then nil else v192
    };
end, function(v193)
    return {
        openGameDetails = not l_FFlagLuaAppRefactorOpenGameDetail_0 and function(v194, v195, v196)
            v193(l_OpenGameDetails_0(v194, v196, v195));
        end or nil, 
        openContextualMenu = function(v197, v198, v199)
            v193(v14(v197, v198, v199));
        end, 
        openSponsoredTooltip = function()
            return v193(v19());
        end
    };
end)(v68);
if not l_FFlagLuaAppRefactorOpenGameDetail_0 then
    v68 = l_withNavigation_0(v68);
end;
v68 = l_RoactServices_0.connect({
    networking = l_RoactNetworking_0
})(v68);
return function(v200)
    local v201 = v29.useRef(nil);
    local v202 = not l_IsVRAppBuild_0() and v200.useHoverTile;
    local v203 = nil;
    if not v23() then
        v203 = l_useHoverState_0(v201) and v202;
    else
        local v204 = ("%*_%*_%*"):format(v200.impressionsTag or "", v200.index or "0", v200.gameTileLayoutType or "Narrow");
        if not (v200.impressionsTag ~= nil) or v200.index == nil then
            v202 = false;
        end;
        v203 = v21(v201, v204, v202);
    end;
    local v205 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    local v206 = not not v205 or v200.useHoverTile;
    local _ = nil;
    return v29.createElement(v68, v32.Dictionary.join(v200, {
        useExperienceTileMetadata = if v200.useExperienceTileMetadata ~= nil then v200.useExperienceTileMetadata else v205, 
        hasBackground = v206, 
        hoverRef = v201, 
        isHovered = v203
    }));
end;

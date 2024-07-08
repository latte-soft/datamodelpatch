local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.React);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v11 = require(l_CorePackages_0.Packages.Dash);
local v12 = require(l_CorePackages_0.UIBlox);
local l_ResponsiveCarousel_0 = v12.App.Container.Carousel.ResponsiveCarousel;
local l_useResponsiveLayout_0 = v12.Core.Layout.Responsive.useResponsiveLayout;
local l_sortFriendsByCorrectedPresenceAndRank_0 = require(l_CorePackages_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).User.sortFriendsByCorrectedPresenceAndRank;
local v16 = require(l_Modules_0.Common.memoize);
local v17 = require(l_Modules_0.LuaApp.AppPage);
local v18 = require(l_Modules_0.LuaApp.Components.FriendsLanding.navigateToFriendsLandingEvent);
local v19 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local v21 = require(l_Modules_0.LuaApp.Components.GridHome.Tiles.Friends.UserTile);
local v22 = require(l_Modules_0.LuaApp.Components.GridHome.Tiles.Friends.AddFriendsTile);
local v23 = require(l_Modules_0.LuaApp.Components.GridHome.Tiles.Friends.BaseUserTile);
local l_TenFootUiGridCarouselHeader_0 = require(l_CorePackages_0.Workspace.Packages.TenFootUiSharedComponents).TenFootUiGridCarouselHeader;
local v25 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useDispatch_0 = v25.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v25.Hooks.RoactRodux.useSelector;
local l_useLocalUserId_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useLocalUserId;
local l_useCreateCarouselList_0 = require(l_Modules_0.LuaApp.Components.FriendsCarousel.api).useCreateCarouselList;
local v30 = require(l_Modules_0.LuaApp.Hooks.useSocialOnboardingButtonsUniversalWrapper);
local l_Sources_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Sources;
local l_GetFFlagGridCarouselHeaderHeightFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagGridCarouselHeaderHeightFix;
local l_FFlagFriendGridRowCreateCarouselList_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFriendGridRowCreateCarouselList;
local v34 = v2.PureComponent:extend("FriendGridRow");
v34.validateProps = v5.strictInterface({
    sortIndex = v5.optional(v5.number), 
    localUserId = v5.string, 
    list = v5.table, 
    navigateDown = v5.callback, 
    gridCarouselSeeAllTilesEnabled = v5.optional(v5.boolean), 
    horizontalMargin = v5.optional(v5.number), 
    tileRelativeHeight = v5.UDim, 
    headerHeight = if not l_GetFFlagGridCarouselHeaderHeightFix_0() then nil else v5.optional(v5.number), 
    headerPadding = if not l_GetFFlagGridCarouselHeaderHeightFix_0() then nil else v5.optional(v5.number)
});
v34.init = function(v35)
    v35.onSeeAll = function()
        v18({
            context = "homePage", 
            localUserId = v35.props.localUserId
        });
        v35.props.navigateDown({
            name = v17.ViewFriends, 
            extraProps = {
                navigateToFriendsLandingEventStart = {
                    startPage = v17.Home, 
                    startTime = os.clock()
                }
            }
        });
    end;
    v35.freezeList = function()
        v35:setState({
            frozenList = v35.props.list
        });
    end;
    v35.unfreezeList = function()
        v35:setState({
            frozenList = v2.None
        });
    end;
end;
v34.render = function(v36)
    return l_withLocalization_0({
        friendsText = "CommonUI.Features.Label.Friends", 
        seeAll = "Feature.Home.ActionSeeAll"
    })(function(v37)
        if not v36.props.gridCarouselSeeAllTilesEnabled then
            return v2.createElement(l_ResponsiveCarousel_0, {
                headerText = v37.friendsText, 
                buttonText = v37.seeAll, 
                onButtonClick = v36.onSeeAll, 
                layoutOrder = v36.props.sortIndex, 
                kind = l_LayoutConfig_0.Kind.Friends, 
                scrollable = false, 
                relativeHeight = UDim.new(1, 44), 
                data = v36.state.frozenList or v36.props.list, 
                keyExtractor = function(v38)
                    if not l_FFlagFriendGridRowCreateCarouselList_0 then
                        return tostring(v38.id) .. tostring(v38.presence);
                    elseif not v38.isCustomBtn and not v38.isAddButton then
                        return tostring(v38.id) .. tostring(v38.presence);
                    else
                        return tostring(v38.id) .. tostring(v38.extraId);
                    end;
                end, 
                getItem = function(v39, v40, v41)
                    if v40 <= v41.columns then
                        if not l_FFlagFriendGridRowCreateCarouselList_0 then
                            if v40 == 1 then
                                return {
                                    isAddButton = true
                                };
                            elseif v39[v40 - 1] then
                                return (v11.assign({
                                    isFriend = true, 
                                    index = v40
                                }, v39[v40 - 1]));
                            end;
                        else
                            return v39[v40];
                        end;
                    end;
                    return nil;
                end, 
                renderItem = function(v42)
                    if not v42.isAddButton then
                        if not v42.isFriend then
                            if not l_FFlagFriendGridRowCreateCarouselList_0 or not v42.isCustomBtn then
                                return nil;
                            else
                                return v2.createElement(v23, {
                                    icon = v42.icon, 
                                    text = v42.text, 
                                    onActivated = v42.onActivated, 
                                    noBorder = not not v42.backgroundColor or false, 
                                    backgroundColor = v42.backgroundColor, 
                                    iconColor = v42.iconColor
                                });
                            end;
                        else
                            return v2.createElement(v21, {
                                userId = v42.id, 
                                index = v42.index, 
                                onMenuOpen = v36.freezeList, 
                                onMenuClose = v36.unfreezeList
                            });
                        end;
                    else
                        return v2.createElement(v22, if not l_FFlagFriendGridRowCreateCarouselList_0 then nil else {
                            icon = v42.icon, 
                            noBorder = not not v42.backgroundColor or false, 
                            backgroundColor = v42.backgroundColor, 
                            iconColor = v42.iconColor
                        });
                    end;
                end
            });
        else
            local l_gridCarouselSeeAllTilesEnabled_0 = v36.props.gridCarouselSeeAllTilesEnabled;
            local v44 = v36.state.frozenList or v36.props.list;
            local v45 = not v44 and 0 or #v44;
            local v46 = nil;
            v46 = if not l_gridCarouselSeeAllTilesEnabled_0 then {
                headerText = v37.friendsText, 
                buttonText = v37.seeAll, 
                onButtonClick = v36.onSeeAll, 
                scrollable = false
            } else {
                scrollable = true, 
                clipsDescendants = false, 
                headerText = function(v47)
                    return v2.createElement(l_TenFootUiGridCarouselHeader_0, {
                        text = v37.friendsText, 
                        margin = v47.margin
                    });
                end, 
                getItemCount = function(_, _)
                    return v45;
                end
            };
            if l_GetFFlagGridCarouselHeaderHeightFix_0() then
                v46 = v3.Dictionary.join(v46, {
                    headerHeight = (v36.props.headerHeight or 0) + (v36.props.headerPadding or 0), 
                    headerPadding = 0
                });
            end;
            return v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v36.props.horizontalMargin), 
                    PaddingRight = UDim.new(0, v36.props.horizontalMargin)
                }), 
                GridCarousel = v2.createElement(l_ResponsiveCarousel_0, v3.Dictionary.join(v46, {
                    layoutOrder = v36.props.sortIndex, 
                    kind = l_LayoutConfig_0.Kind.Friends, 
                    relativeHeight = v36.props.tileRelativeHeight, 
                    data = v44, 
                    keyExtractor = function(v50)
                        if not l_FFlagFriendGridRowCreateCarouselList_0 then
                            return tostring(v50.id) .. tostring(v50.presence);
                        elseif not v50.isCustomBtn and not v50.isAddButton then
                            return tostring(v50.id) .. tostring(v50.presence);
                        else
                            return tostring(v50.id) .. tostring(v50.extraId);
                        end;
                    end, 
                    getItem = function(v51, v52, v53)
                        if v52 <= if not l_gridCarouselSeeAllTilesEnabled_0 then v53.columns else v45 then
                            if not l_FFlagFriendGridRowCreateCarouselList_0 then
                                if v52 == 1 then
                                    return {
                                        isAddButton = true
                                    };
                                elseif v51[v52 - 1] then
                                    return (v11.assign({
                                        isFriend = true, 
                                        index = v52
                                    }, v51[v52 - 1]));
                                end;
                            else
                                return v51[v52];
                            end;
                        end;
                        return nil;
                    end, 
                    renderItem = function(v54)
                        if not v54.isAddButton then
                            if not v54.isFriend then
                                if not l_FFlagFriendGridRowCreateCarouselList_0 or not v54.isCustomBtn then
                                    return nil;
                                else
                                    return v2.createElement(v23, {
                                        icon = v54.icon, 
                                        text = v54.text, 
                                        onActivated = v54.onActivated, 
                                        noBorder = not not v54.backgroundColor or false, 
                                        backgroundColor = v54.backgroundColor, 
                                        iconColor = v54.iconColor
                                    });
                                end;
                            else
                                return v2.createElement(v21, {
                                    userId = v54.id, 
                                    index = v54.index, 
                                    onMenuOpen = v36.freezeList, 
                                    onMenuClose = v36.unfreezeList
                                });
                            end;
                        else
                            return v2.createElement(v22, if not l_FFlagFriendGridRowCreateCarouselList_0 then nil else {
                                icon = v54.icon, 
                                noBorder = not not v54.backgroundColor or false, 
                                backgroundColor = v54.backgroundColor, 
                                iconColor = v54.iconColor
                            });
                        end;
                    end
                }))
            });
        end;
    end);
end;
local v61 = v16(function(v55)
    local v56 = {};
    for _, v58 in pairs(v55) do
        if v58.isFriend then
            v56[#v56 + 1] = v58;
        end;
    end;
    local v59, v60 = xpcall(function()
        table.sort(v56, l_sortFriendsByCorrectedPresenceAndRank_0);
    end, debug.traceback);
    if not v59 then
        l_Logger_0:info((tostring(v60)));
    end;
    assert(v59, (tostring(v60)));
    return v56;
end);
if not l_FFlagFriendGridRowCreateCarouselList_0 then
    v34 = v4.connect(function(v62, _)
        return {
            localUserId = v62.LocalUserId, 
            list = v61(v62.Users)
        };
    end, function(v64)
        return {
            navigateDown = function(v65)
                v64(v19(v65));
            end
        };
    end)(v34);
end;
local v68 = l_RoactAppPolicy_0.connect(function(v66, _)
    return {
        gridCarouselSeeAllTilesEnabled = v66.getGridCarouselSeeAllTilesEnabled()
    };
end)(v34);
return function(v69)
    local v70 = l_useDesignTokens_0();
    local v71 = v3.Dictionary.join(v69, {
        horizontalMargin = v70.Global.Space_800, 
        tileRelativeHeight = l_useResponsiveLayout_0("relativeHeight", v70.LuaApps.Layout.kinds.Friends)
    });
    if l_GetFFlagGridCarouselHeaderHeightFix_0() then
        v71 = v3.Dictionary.join(v71, {
            headerHeight = v70.Global.Size_350, 
            headerPadding = v70.Global.Space_100
        });
    end;
    if l_FFlagFriendGridRowCreateCarouselList_0 then
        local v72 = l_useLocalUserId_0();
        local v74 = l_useSelector_0(function(v73)
            return v61(v73.Users);
        end);
        local v75 = l_useDispatch_0();
        local function v77(v76)
            v75(v19(v76));
        end;
        local v79 = v6.useMemo(function()
            return v3.List.map(v74 or {}, function(v78)
                return (v3.Dictionary.join({
                    isFriend = true
                }, v78));
            end);
        end, {
            v74
        });
        local v80, v81 = v30({
            entryPoint = l_Sources_0.HomePageFriendsCarousel
        });
        v71 = v3.Dictionary.join(v71, {
            localUserId = v72, 
            list = l_useCreateCarouselList_0({
                users = v79, 
                friendCount = #v79, 
                socialOnboardingBtns = v80, 
                addFriendsBtn = v81, 
                includeAddFriendsBtn = true
            }), 
            navigateDown = v77
        });
    end;
    return v2.createElement(v68, v71);
end;

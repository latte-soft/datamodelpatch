local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local v3 = require(l_Parent_1.React);
local l_Roact_0 = v2.Roact;
local l_llama_0 = v2.llama;
local l_memoize_0 = v2.memoize;
local l_withLocalization_0 = v2.withLocalization;
local l_useDesignTokens_0 = v2.Hooks.useDesignTokens;
local l_useUiModeInfo_0 = v2.Hooks.useUiModeInfo;
local l_UiMode_0 = v2.RobloxAppEnums.UiMode;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local v12 = require(l_Parent_0.Components.FindFriendsTile);
local v13 = require(l_Parent_0.Components.FindFriendsHint);
local v14 = require(l_Parent_0.Components.CarouselUserTile);
local v15 = require(l_Parent_0.Components.LoadingTile);
local v16 = require(l_Parent_0.Components.ButtonTileCircular);
local _ = require(l_Parent_0.Components.PaginatedCarousel.useCarouselList);
local v18 = require(l_Parent_0.Components.useCreateCarouselList);
local _ = require(l_Parent_0.Common.LocalTypes);
local v20 = require(l_Parent_0.Common.TextKeys);
local v21 = require(l_Parent_0.Analytics.UILoadingEvents);
local l_getFFlagUpdateFriendCarousel10ft_0 = v2.getFFlagUpdateFriendCarousel10ft;
local l_FFlagFriendsCarouselPagination_0 = require(l_Parent_1.SharedFlags).FFlagFriendsCarouselPagination;
local v24 = require(l_Parent_0.Flags.FFlagFriendsCarouselUILoadingTime);
local l_FFlagFriendsCarouselInjectSocialBtn_0 = require(l_Parent_1.SharedFlags).FFlagFriendsCarouselInjectSocialBtn;
local l_FFlagMoveCarouselHeader_0 = require(l_Parent_1.SharedFlags).FFlagMoveCarouselHeader;
local v27 = game:DefineFastFlag("FriendsCarouseCINavigationUpdate", false);
local v28 = l_Roact_0.Component:extend("Carousel");
v28.defaultProps = {};
v28.init = function(v29)
    v29.reportNonFriendsElements = function(v30)
        local l_props_0 = v29.props;
        if l_props_0.onSuccessfulRender then
            l_props_0.onSuccessfulRender((("%*%*"):format(v30, not l_props_0.paginatedCarouselEnabled and "" or v21.ExperimentSuffix)));
        end;
    end;
    v29.renderFindFriendsTile = function()
        local l_props_1 = v29.props;
        local v33 = if not l_FFlagFriendsCarouselInjectSocialBtn_0 then nil else l_props_1.addFriendsBtn or {};
        return l_withLocalization_0({
            newTextBadge = v20.NewText
        })(function(v34)
            return l_Roact_0.createElement(v12, {
                onActivated = l_props_1.onFindFriendsTileActivated, 
                badgeValue = if not l_props_1.showNewBadge then nil else v34.newTextBadge, 
                tileSize = if not l_getFFlagUpdateFriendCarousel10ft_0() then v29.getTileUIProperties().tileHeight else l_props_1.designTokens.tileSize, 
                showNewAddFriendsUIVariant = l_props_1.showNewAddFriendsUIVariant, 
                onDidMount = if not v24 then l_props_1.onSuccessfulRender else v29.reportNonFriendsElements(v21.AddFriendsBtn), 
                backgroundColor = if not l_FFlagFriendsCarouselInjectSocialBtn_0 then nil else v33.backgroundColor, 
                noBorder = if not l_FFlagFriendsCarouselInjectSocialBtn_0 then nil else v33.backgroundColor and true or false, 
                icon = if not l_FFlagFriendsCarouselInjectSocialBtn_0 then nil else v33.icon, 
                iconColor = if not l_FFlagFriendsCarouselInjectSocialBtn_0 then nil else v33.iconColor
            });
        end);
    end;
    v29.renderFindFriendsHint = function(v35)
        local l_props_2 = v29.props;
        return l_Roact_0.createElement(v13, {
            layoutOrder = v35.layoutOrder, 
            tileHeight = if not l_getFFlagUpdateFriendCarousel10ft_0() then v29.getTileUIProperties().tileHeight else l_props_2.designTokens.tileSize, 
            showNewAddFriendsUIVariant = l_props_2.showNewAddFriendsUIVariant, 
            onDidMount = if not v24 then nil else v29.reportNonFriendsElements(v21.EmptyHint)
        });
    end;
    v29.renderUserTile = function(v37)
        local l_props_3 = v29.props;
        if not v37.data.isLoading then
            return l_Roact_0.createElement(v14, (l_llama_0.Dictionary.join(v37, {
                user = v37.data, 
                tileSize = if not l_getFFlagUpdateFriendCarousel10ft_0() then v29.getTileUIProperties().tileHeight else l_props_3.designTokens.tileSize, 
                tileInfoHeight = v37.tileInfoHeight, 
                onActivated = l_props_3.onUserTileActivated, 
                showToast = l_props_3.showToast, 
                userSeen = l_props_3.userSeen, 
                reportRender = if not v24 then nil else l_props_3.onSuccessfulRender
            })));
        else
            return l_Roact_0.createElement(v15, {
                layoutOrder = v37.layoutOrder, 
                tileSize = if not l_getFFlagUpdateFriendCarousel10ft_0() then v29.getTileUIProperties().tileHeight else l_props_3.designTokens.tileSize, 
                tileInfoHeight = v37.tileInfoHeight
            });
        end;
    end;
    v29.getTileUIProperties = if not l_getFFlagUpdateFriendCarousel10ft_0() then l_memoize_0(function()
        return {
            tileHeight = 96
        };
    end) else nil;
    v29.renderItem = function(v39)
        local l_props_4 = v29.props;
        local l_data_0 = v39.data;
        if not l_data_0.isCustomBtn then
            return v29.renderUserTile(v39);
        else
            return l_Roact_0.createElement(v16, {
                layoutOrder = v39.layoutOrder, 
                title = l_data_0.text, 
                icon = l_data_0.icon, 
                iconColor = l_data_0.iconColor, 
                backgroundColor = l_data_0.backgroundColor, 
                noBorder = not not l_data_0.backgroundColor or false, 
                onActivated = l_data_0.onActivated, 
                tileSize = if not l_getFFlagUpdateFriendCarousel10ft_0() then v29.getTileUIProperties().tileHeight else l_props_4.designTokens.tileSize
            });
        end;
    end;
end;
v28.render = function(v42)
    local l_props_5 = v42.props;
    return l_Roact_0.createElement(l_props_5.carousel, l_llama_0.Dictionary.join(l_props_5.carouselProps, {
        friendCount = l_props_5.friendCount, 
        renderFindFriendsTile = v42.renderFindFriendsTile, 
        renderFindFriendsHint = v42.renderFindFriendsHint, 
        items = if not l_FFlagFriendsCarouselInjectSocialBtn_0 then l_props_5.friendsAndRecList else l_props_5.carouselList, 
        renderItem = v42.renderItem, 
        sideMargin = if not l_getFFlagUpdateFriendCarousel10ft_0() then nil else l_props_5.designTokens.horizontalMargin, 
        friendThumbnailSize = if not l_getFFlagUpdateFriendCarousel10ft_0() then v42.getTileUIProperties().tileHeight else l_props_5.designTokens.tileSize, 
        headerPadding = if not l_getFFlagUpdateFriendCarousel10ft_0() then nil else l_props_5.designTokens.headerPadding, 
        cardPadding = not l_getFFlagUpdateFriendCarousel10ft_0() and 10 or l_props_5.designTokens.cardPadding, 
        fetchNext = if not l_FFlagFriendsCarouselPagination_0 then nil else v42.props.fetchNext, 
        title = if not l_FFlagMoveCarouselHeader_0 then nil else l_props_5.headerTitle, 
        onActivateHeader = if not l_FFlagMoveCarouselHeader_0 then nil else l_props_5.onSeeAllFriends, 
        _propToUpdateFindFriendsTile = if not v27 then nil else l_props_5.onFindFriendsTileActivated, 
        _propToUpdateFindFriendsTile2 = if not l_FFlagFriendsCarouselInjectSocialBtn_0 then nil else l_props_5.addFriendsBtn
    }));
end;
if not (l_getFFlagUpdateFriendCarousel10ft_0() or l_FFlagFriendsCarouselInjectSocialBtn_0) and not l_FFlagMoveCarouselHeader_0 then
    return v28;
else
    return function(v44)
        local v45 = nil;
        if l_getFFlagUpdateFriendCarousel10ft_0() then
            local v46 = l_useUiModeInfo_0();
            local l_v46_0 = v46 --[[ copy: 2 -> 4 ]];
            v45 = l_useDesignTokens_0(function(v48)
                if l_v46_0.uiMode == l_UiMode_0.TenFoot then
                    return {
                        horizontalMargin = v48.Global.Space_800, 
                        tileSize = v48.Global.Size_1200, 
                        headerPadding = v48.Global.Space_200, 
                        cardPadding = v48.Global.Space_300
                    };
                else
                    return {
                        horizontalMargin = nil, 
                        tileSize = 96, 
                        headerPadding = nil, 
                        cardPadding = 10
                    };
                end;
            end);
        end;
        local v49 = nil;
        if l_FFlagFriendsCarouselInjectSocialBtn_0 then
            v49 = v18({
                users = v44.users or {}, 
                friendCount = v44.friendCount, 
                socialOnboardingBtns = v44.socialOnboardingBtns, 
                includeAddFriendsBtn = false
            });
        end;
        local v50 = nil;
        if l_FFlagMoveCarouselHeader_0 then
            v50 = l_useLocalization_0({
                headerTitle = v44.friendCount == 0 and "CommonUI.Features.Label.Friends" or {
                    "Feature.Home.HeadingFriends"; 
                    friendCount = v44.friendCount
                }
            }).headerTitle;
        end;
        return v3.createElement(v28, (l_llama_0.Dictionary.join(v44, {
            designTokens = v45, 
            carouselList = v49, 
            headerTitle = if not l_FFlagMoveCarouselHeader_0 then nil else v50
        })));
    end;
end;

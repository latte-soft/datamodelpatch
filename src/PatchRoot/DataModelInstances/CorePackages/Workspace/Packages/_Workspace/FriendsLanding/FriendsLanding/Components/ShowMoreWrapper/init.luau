local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v2.llama;
local l_Roact_0 = v2.Roact;
local l_memoize_0 = v2.memoize;
local l_Dictionary_0 = l_llama_0.Dictionary;
local v7 = require(l_script_FirstAncestor_0.Components.FriendsLandingPage);
local v8 = require(script.helpers.limitFriends);
local v9 = require(script.helpers.updateFriendsWithWidth);
local v10 = require(script.helpers.loadFriendGroup);
local v11 = require(script.helpers.friendsPerRow);
local v12 = require(script.helpers.friendsPerLoadGroup);
local v13 = require(l_script_FirstAncestor_0.Components.ShowMoreButton);
local v14 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ButtonClickEvents);
local v15 = require(l_script_FirstAncestor_0.Friends.filterStates);
local l_Contexts_0 = v2.SocialLuaAnalytics.Analytics.Enums.Contexts;
local v17 = require(l_script_FirstAncestor_0.Enums.ShowMoreSectionTypeEnum);
local l_React_0 = v2.React;
local l_GridMetrics_0 = v2.UIBlox.App.Grid.GridMetrics;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local v23 = l_Roact_0.PureComponent:extend("ShowMoreWrapper");
v23.defaultProps = {
    listComponent = v7, 
    itemSize = 175, 
    visibleRows = 6, 
    friends = {}, 
    analytics = nil, 
    filter = v15.All, 
    overrideRenderShowMore = nil, 
    handleShowMore = nil, 
    spacingIfEmpty = 48, 
    sectionType = v17.Friends
};
v23.init = function(v24)
    v24.state = {
        width = 100, 
        filterFriendCounts = l_Dictionary_0.map(v15, function()
            return v24.props.visibleRows;
        end), 
        selectedItemIndex = nil
    };
    v24.updateWidth = function(v25)
        v24:setState(v9(v25.AbsoluteSize.X));
        if v24.props.onWidthUpdated then
            v24.props.onWidthUpdated(v25.AbsoluteSize.X);
        end;
    end;
    v24.reset = function()
        v24:setState(function(v26, v27)
            return {
                filterFriendCounts = l_Dictionary_0.join(v24.state.filterFriendCounts, {
                    [v24.props.filter] = v12(v26, v27)
                })
            };
        end);
    end;
    v24.showMore = function()
        if v24.props.analytics then
            v24.props.analytics:buttonClick(v14.LoadMoreUsers, {
                sectionType = v24.props.sectionType, 
                contextOverride = if not (v24.props.sectionType ~= v17.FriendRequests) or v24.props.sectionType == v17.FriendRecommendations then l_Contexts_0.AddFriends else nil, 
                recommendationSessionId = v24.props.friendRecommendationsSessionId
            });
        end;
        if not v24.props.handleShowMore then
            v24:setState(function(v28, v29)
                return l_Dictionary_0.join(v10(v28, v29), {
                    selectedItemIndex = v28.filterFriendCounts[v29.filter] + 1
                });
            end);
            return ;
        else
            v24.props.handleShowMore(v11(l_Dictionary_0.join({
                width = v24.state.width
            }, v24.props)));
            return ;
        end;
    end;
    v24.limitFriends = l_memoize_0(v8);
    v24.renderShowMore = l_memoize_0(function(v30, v31, v32)
        return function(v33)
            local v34 = v32 and v32(v31);
            if v31 >= v30 and not v34 then
                return l_Roact_0.createElement("Frame", {
                    Name = "showMoreSpacing", 
                    Size = UDim2.fromOffset(0, v24.props.spacingIfEmpty), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v33
                });
            else
                return l_Roact_0.createElement(v13, {
                    layoutOrder = v33, 
                    onSizeChange = v24.updateWidth, 
                    onActivated = v24.showMore
                });
            end;
        end;
    end);
    v24.checkAndResetIfNeeded = function(v35)
        if not (#v24.props.friends == #v35.friends) or v35.visibleRows ~= v24.props.visibleRows then
            v24.reset();
        end;
    end;
end;
v23.didUpdate = function(v36, v37)
    v36.checkAndResetIfNeeded(v37);
end;
v23.render = function(v38)
    local v39 = v38.state.filterFriendCounts[v38.props.filter];
    return l_Roact_0.createElement(v38.props.listComponent, l_Dictionary_0.join(v38.props, {
        friends = v38.limitFriends(v39, v38.props.friends), 
        showMore = v38.showMore, 
        totalFilteredFriends = #v38.props.friends, 
        renderShowMore = v38.renderShowMore(#v38.props.friends, v39, v38.props.overrideRenderShowMore), 
        resetShowMore = v38.reset, 
        totalInactiveFriends = v38.props.totalInactiveFriends, 
        selectedItemIndex = v38.state.selectedItemIndex
    }));
end;
return function(v40)
    local v41 = l_useDesignTokens_0();
    local v42 = l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot;
    local l_GridViewItemMetrics_0 = v41.LuaApps.FriendsLanding.FriendsLandingPage.GridViewItemMetrics;
    local l_GridHorizontalSpacing_0 = v41.LuaApps.FriendsLanding.FriendsLandingPage.GridHorizontalSpacing;
    local l_GridVerticalSpacing_0 = v41.LuaApps.FriendsLanding.FriendsLandingPage.GridVerticalSpacing;
    local v46 = l_React_0.useMemo(function()
        if not v42 then
            return nil;
        else
            return l_GridMetrics_0.makeCustomMetricsGetter(l_GridViewItemMetrics_0);
        end;
    end, {
        v42, 
        l_GridViewItemMetrics_0
    });
    local v47, v48 = l_React_0.useState(100);
    return l_React_0.createElement(v23, l_llama_0.Dictionary.join({
        onWidthUpdated = if not v42 then nil else v48, 
        itemSize = l_React_0.useMemo(function()
            if (not v42 or not v46) or not l_GridHorizontalSpacing_0 then
                return nil;
            else
                return v46(v47, l_GridHorizontalSpacing_0).itemWidth;
            end;
        end, {
            v42, 
            v46, 
            v47, 
            l_GridHorizontalSpacing_0
        }), 
        getItemMetrics = v46, 
        gridHorizontalSpacing = l_GridHorizontalSpacing_0, 
        gridVerticalSpacing = l_GridVerticalSpacing_0
    }, v40));
end;

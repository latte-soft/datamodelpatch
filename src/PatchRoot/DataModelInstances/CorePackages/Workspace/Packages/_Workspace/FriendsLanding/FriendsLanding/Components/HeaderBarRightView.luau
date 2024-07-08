local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_SocialLibraries_0 = v2.SocialLibraries;
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local v6 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v7 = require(l_script_FirstAncestor_0.EnumScreens);
local v8 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v9 = require(l_script_FirstAncestor_0.Components.AddFriendsIcon);
local l_memoize_0 = v2.memoize;
local l_IconButton_0 = l_UIBlox_0.App.Button.IconButton;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v13 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ButtonClickEvents);
local v14 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.PlayerSearchEvent);
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local function v19(v18)
    return l_Roact_0.createElement(l_IconButton_0, {
        size = UDim2.fromOffset(0, 0), 
        icon = l_Images_0["icons/common/search"], 
        layoutOrder = v18.layoutOrder, 
        onActivated = v18.goToSearchFriendsPage
    });
end;
local v20 = {
    SHOW_ADDFRIENDS_ICON = {
        [v7.FriendsLanding] = true, 
        [v7.SearchFriends] = true
    }, 
    SHOW_SEARCHFRIENDS_ICON = {
        [v7.FriendsLanding] = true, 
        [v7.SearchFriends] = true, 
        [v7.AddFriends] = true
    }
};
local v21 = l_Roact_0.PureComponent:extend("HeaderBarRightView");
v21.defaultProps = {
    layoutOrder = 1, 
    onActivated = nil
};
v21.init = function(v22)
    v22.goToFriendRequestsPage = l_memoize_0(function(_, v24)
        return function()
            v22.props.analytics:buttonClick(v24 == 0 and v13.AddFriendsNoFriends or v13.AddFriends);
            v22.props.analytics:navigate(v7.AddFriends);
            return v22.props.navigation.navigate(v7.AddFriends);
        end;
    end);
    v22.goToSearchFriendsPage = l_memoize_0(function(v25)
        return function()
            local l_navigation_0 = v22.props.navigation;
            local v27 = if not not l_navigation_0 and l_navigation_0.state then l_navigation_0.state.routeName else nil;
            local v28 = nil;
            if not l_getDeepValue_0(l_navigation_0 or {}, "state.params.userSearchSource") then
                if not l_getDeepValue_0(v22.props, "passedNavParams.userSearchSource") then
                    if v27 == v7.FriendsLanding then
                        v28 = l_Sources_0.FriendsLanding;
                    end;
                else
                    v28 = v22.props.passedNavParams.userSearchSource;
                end;
            else
                v28 = l_navigation_0.state.params.userSearchSource;
            end;
            v14(v22.props.analytics, "open", {
                source = v28, 
                currentRoute = v27
            });
            v25(v7.FriendsLanding, {
                shouldRenderCenter = true, 
                shouldAutoFocusCenter = true
            });
        end;
    end);
end;
v21.render = function(v29)
    if not v29.props.getScreenTopBar(v7.FriendsLanding).shouldRenderCenter then
        local l_navigation_1 = v29.props.navigation;
        local v31 = nil;
        local v32 = nil;
        if v29.props.addFriendsPageSearchbarEnabled then
            v20.SHOW_ADDFRIENDS_ICON[v7.SearchFriends] = false;
        end;
        if not (not l_navigation_1 or not l_navigation_1.state) then
            local l_routeName_0 = l_navigation_1.state.routeName;
            v31 = v20.SHOW_SEARCHFRIENDS_ICON[l_routeName_0];
            v32 = v20.SHOW_ADDFRIENDS_ICON[l_routeName_0];
        end;
        return l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 72, 0, 36)
        }, {
            UIListLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            SearchFriendsIcon = v31 and v19({
                goToSearchFriendsPage = v29.goToSearchFriendsPage(v29.props.setScreenTopBar), 
                layoutOrder = 1
            }), 
            Padding = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }), 
            AddFriendsIcon = v32 and l_Roact_0.createElement(v9, {
                onActivated = v29.goToFriendRequestsPage(v29.props.navigateToLuaAppPages, v29.props.totalFriendCount), 
                layoutOrder = 3, 
                friendRequestCount = v29.props.friendRequestCount, 
                showTooltip = v29.props.totalFriendCount == 0
            })
        });
    else
        return nil;
    end;
end;
return l_compose_0(v8.connect(function(v34)
    return {
        analytics = v34
    };
end), v6.connect(function(v35, _)
    return {
        getScreenTopBar = v35.getScreenTopBar, 
        setScreenTopBar = v35.setScreenTopBar, 
        navigateToLuaAppPages = v35.navigateToLuaAppPages, 
        friendRequestCount = v35.friendRequestCount, 
        totalFriendCount = v35.totalFriendCount, 
        luaAddFriendsPageEnabled = v35.luaAddFriendsPageEnabled, 
        addFriendsPageSearchbarEnabled = v35.addFriendsPageSearchbarEnabled, 
        passedNavParams = v35.passedNavParams
    };
end))(v21);

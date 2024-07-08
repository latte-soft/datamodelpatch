local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_LuaAppsConstants_0 = v1.LuaAppsConstants;
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_Dash_0 = v1.Dash;
local l_memoize_0 = v1.memoize;
local l_UniversalAppPolicy_0 = v1.UniversalAppPolicy;
local l_SetAlias_0 = v1.SetAlias;
local v10 = require(script.Parent.ProfileContextualMenu);
local l_compose_0 = l_SocialLibraries_0.RoduxTools.compose;
local v12 = require(l_Parent_0.ProfileContext);
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local v14 = require(script.Parent.profileContextualMenuMapStateToProps);
local v15 = require(script.Parent.profileContextualMenuMapDispatchToProps);
local v16 = require(l_Parent_0.Common.ProfileScreens);
local v17 = require(l_Parent_0.Common.ContextualMenuRowsEnums);
local v18 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.Common.ProfileTypes);
local l_Promise_0 = v1.Promise;
local v21 = l_Roact_0.PureComponent:extend("ProfileContextualMenuContainer");
local l_GetFFlagLuafiedReportEntryPoints_0 = v1.GetFFlagLuafiedReportEntryPoints;
v21.init = function(v23)
    local l_props_0 = v23.props;
    v23.state = {
        hide = false
    };
    v23.hideMenu = function()
        v23:setState({
            hide = true
        });
    end;
    v23.onDismiss = l_memoize_0(function(v25)
        if v25 then
            v23.hideMenu();
        end;
        l_props_0.onDismiss(v25);
    end);
    v23.rowActions = {
        [v17.REPORT] = l_memoize_0(function(v26)
            return function()
                v23.onDismiss(v26);
                l_props_0.analytics:contextualMenuClick(v17.REPORT);
                if not l_props_0.useLuafiedReportFlow then
                    l_props_0.navigateToLuaAppPages[v16.ReportUser](l_props_0.profileUserId);
                    return ;
                else
                    l_props_0.reportUser({
                        reportEntryPoint = l_LuaAppsConstants_0.ReportDialogEntryPoints.Profile, 
                        profileUserId = l_props_0.profileUserId
                    });
                    return ;
                end;
            end;
        end), 
        [v17.CHAT] = l_memoize_0(function(v27)
            return function()
                v23.onDismiss(v27);
                l_props_0.analytics:contextualMenuClick(v17.CHAT);
                l_props_0.navigateToLuaAppPages[v16.Chat](l_props_0.profileUserId);
            end;
        end), 
        [v17.SET_ALIAS] = l_memoize_0(function(v28)
            return function()
                v23.onDismiss(v28);
                l_props_0.analytics:contextualMenuClick(v17.SET_ALIAS);
                l_props_0.navigation.navigate(v16.SetAliasModal, {
                    profileUserId = l_props_0.profileUserId, 
                    origin = l_SetAlias_0.Analytics.EntryPoints.ContextualMenu
                });
            end;
        end), 
        [v17.BLOCK] = l_memoize_0(function(v29)
            return function()
                v23.onDismiss(v29);
                l_props_0.analytics:contextualMenuClick(v17.BLOCK);
                return l_props_0.blockUser({
                    targetUserId = l_props_0.profileUserId, 
                    currentUserId = l_props_0.localUserId
                });
            end;
        end), 
        [v17.UNFRIEND] = l_memoize_0(function(v30)
            return function()
                v23.onDismiss(v30);
                l_props_0.analytics:contextualMenuClick(v17.UNFRIEND);
                return l_props_0.unFriendUser({
                    targetUserId = l_props_0.profileUserId, 
                    currentUserId = l_props_0.localUserId
                });
            end;
        end), 
        [v17.IGNORE_FRIEND_REQUEST] = l_memoize_0(function(v31)
            return function()
                v23.onDismiss(v31);
                l_props_0.analytics:contextualMenuClick(v17.IGNORE_FRIEND_REQUEST);
                if l_props_0.friendStatus == Enum.FriendStatus.FriendRequestReceived then
                    return l_props_0.ignoreFriendRequest({
                        targetUserId = l_props_0.profileUserId, 
                        currentUserId = l_props_0.localUserId
                    }):finally(function(_)
                        l_props_0.resetProfileType();
                    end);
                else
                    return l_Promise_0.resolve(l_props_0.resetProfileType());
                end;
            end;
        end)
    };
end;
v21.render = function(v33)
    return not v33.state.hide and l_Roact_0.createElement(v10, l_Dash_0.join(v33.props, {
        rowActions = v33.rowActions, 
        blockUser = l_Dash_0.None, 
        unFriendUser = l_Dash_0.None, 
        ignoreFriendRequest = l_Dash_0.None, 
        reportUser = l_Dash_0.None, 
        navigateToLuaAppPages = l_Dash_0.None, 
        profileUserId = l_Dash_0.None, 
        localUserId = l_Dash_0.None, 
        analytics = l_Dash_0.None, 
        resetProfileType = l_Dash_0.None
    })) or nil;
end;
return l_compose_0(v12.connect(function(v34)
    return {
        profileUserId = v34.profileUserId, 
        localUserId = v34.localUserId, 
        navigateToLuaAppPages = v34.navigateToLuaAppPages, 
        profileType = v34.profileType, 
        resetProfileType = v34.resetProfileType
    };
end), l_RoactRodux_0.connect(v14, v15), v18.connect(function(v35)
    return {
        analytics = v35
    };
end), l_UniversalAppPolicy_0.connect(function(v36)
    return {
        useLuafiedReportFlow = if not l_GetFFlagLuafiedReportEntryPoints_0() then nil else v36.getUseLuafiedReportFlow()
    };
end))(v21);

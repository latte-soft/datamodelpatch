local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.Roact);
local v4 = require(script.Parent.Parent.Dialogs.GenericDialogType);
local v5 = require(script.Parent.Logger);
local v6 = require(script.Parent.ParticipantDialogContainer);
local v7 = require(l_script_FirstAncestor_0.LegacyAnalytics.connectAnalytics);
local v8 = require(l_script_FirstAncestor_0.LegacyAnalytics.RoactChatAnalytics);
local v9 = v3.PureComponent:extend("ParticipantDialogScreen");
v9.defaultProps = {
    navigation = nil
};
v9.init = function(v10)
    v10.onDismiss = function()
        v10.props.navigation.goBack();
    end;
    v10.openRemoveUserDialog = function(v11, v12)
        v5:info("User activated removeFromGroup | userId: {}, conversationId: {}", v11, v12);
        v10.props.navigation.replace(v4.RemoveUserDialog, {
            conversationId = v12, 
            participantId = v11
        });
    end;
    v10.openViewProfile = function(v13)
        local v14 = v10.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v2.ViewUserProfile];
        if not v14 then
            v5:warning("UserProfile page was not set in navigateToLuaAppPages screenProps");
            return ;
        else
            v5:info("Navigate To UserProfile from {screen}");
            v10.props.analytics:navigate(v8.NavigationEvents.ChatDetailsProfile);
            v14(v13, {});
            return ;
        end;
    end;
    v10.openReportUser = function(v15, v16)
        local v17 = v10.props.navigation.getScreenProps("navigateToLuaAppPages", {})[v2.ReportAbuse];
        if not v17 then
            v5:warning("ReportAbuse page was not set in navigateToLuaAppPages screenProps");
            return ;
        else
            v5:info("Navigate To ReportAbuse from {screen}");
            v17(v15, v16);
            return ;
        end;
    end;
end;
v9.render = function(v18)
    local l_navigation_0 = v18.props.navigation;
    assert(type(l_navigation_0) ~= "nil", "ParticipantDialogScreen should be wrapped with Roact Navigation");
    local v20 = l_navigation_0.getParam("conversationId", nil);
    local v21 = l_navigation_0.getParam("participantId", nil);
    local v22 = l_navigation_0.getParam("showRemoveUserButton", false);
    if not (v20 ~= nil) or v21 == nil then
        v5:warning("ConversationId and participantId are required to open {screen}");
        return nil;
    else
        return v3.createElement(v6, {
            conversationId = v20, 
            participantId = v21, 
            showRemoveUserButton = v22, 
            onDismiss = v18.onDismiss, 
            openRemoveUserDialog = v18.openRemoveUserDialog, 
            openReportUser = v18.openReportUser, 
            openViewProfile = v18.openViewProfile
        });
    end;
end;
v9.didMount = function(_)
    v5:info("{screen} mounted");
end;
return (v7(function(v24)
    return {
        analytics = v24
    };
end)(v9));

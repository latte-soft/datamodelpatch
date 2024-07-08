local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local v3 = require(l_Parent_0.Roact);
local v4 = require(script.Parent.LeaveGroupDialogContainer);
local v5 = require(script.Parent.Logger);
local v6 = v3.PureComponent:extend("LeaveGroupDialogScreen");
v6.defaultProps = {
    navigation = nil
};
v6.init = function(v7)
    v7.onLeaveGroupDialogClose = function()
        v7.props.navigation.goBack();
    end;
    v7.onLeaveGroupSuccess = function()
        local l_navigation_0 = v7.props.navigation;
        if not l_navigation_0.getScreenProps("wideMode", false) then
            v5:info("Navigate To ChatLanding from {screen}");
            l_navigation_0.navigate(v2.ChatLanding);
            return ;
        else
            v5:info("Navigate To ChatLanding with EmptyConversation from {screen}");
            l_navigation_0.navigate(v2.EmptyConversation);
            return ;
        end;
    end;
end;
v6.render = function(v9)
    local l_navigation_1 = v9.props.navigation;
    assert(type(l_navigation_1) ~= "nil", "LeaveGroupDialogScreen should be wrapped with Roact Navigation");
    local v11 = l_navigation_1.getParam("conversationId", nil);
    if v11 == nil then
        v5:warning("ConversationId is required to open {screen}");
        return nil;
    else
        return v3.createElement(v4, {
            conversationId = v11, 
            onModalClose = v9.onLeaveGroupDialogClose, 
            onLeaveSuccess = v9.onLeaveGroupSuccess
        });
    end;
end;
v6.didMount = function(_)
    v5:info("{screen} mounted");
end;
return v6;

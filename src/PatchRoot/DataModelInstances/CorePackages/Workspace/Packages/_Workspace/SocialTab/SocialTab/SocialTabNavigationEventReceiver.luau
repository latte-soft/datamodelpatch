local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local v4 = require(l_script_FirstAncestor_0.Requests.GetUnreadConversationCount);
local v5 = require(l_script_FirstAncestor_0.Logger);
local v6 = l_Roact_0.PureComponent:extend("SocialTabNavigationEventReceiver");
v6.init = function(v7)
    v7.skipDidFocusOnMount = true;
    v7.getUnreadConversationCount = function()
        return v7.props.getUnreadConversationCount():catch(function(v8)
            v5:warning("{} has issues fetching UnreadConversationCount: {}", script.Name, v8);
        end);
    end;
    v7.onDidFocusHandler = function()
        if not v7.skipDidFocusOnMount then
            v7.getUnreadConversationCount();
            return ;
        else
            v7.skipDidFocusOnMount = false;
            return ;
        end;
    end;
end;
v6.render = function(v9)
    return l_Roact_0.createElement(v9.props.navigationEventReceiver, {
        onDidFocus = v9.onDidFocusHandler
    });
end;
return l_RoactRodux_0.connect(nil, function(v10)
    return {
        getUnreadConversationCount = function()
            return v10(v4.API());
        end
    };
end)(v6);

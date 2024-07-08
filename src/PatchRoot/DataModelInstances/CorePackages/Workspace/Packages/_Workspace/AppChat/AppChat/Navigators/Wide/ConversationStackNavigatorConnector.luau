local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local v5 = require(l_Parent_0.React);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v7 = require(l_script_FirstAncestor_0.configureTopBarWithNavigationOptions);
local v8 = require(script.Parent.conversationStackNavigator);
local v9 = {
    configureTopBar = v7, 
    createNewNavigator = v8
};
ConversationStackNavigatorConnector = function(v10)
    local v11 = v3.Dictionary.join(v9, v10);
    return v5.createElement(v5.Fragment, nil, {
        layout = v5.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        topBar = v11.configureTopBar(v11.navigation), 
        navigator = v5.createElement(l_memoize_0(function(v12)
            local v13 = v11.createNewNavigator({
                cardColor3 = v12
            });
            v11.setRouter(v13.router);
            return v13;
        end)(l_useStyle_0().Theme.BackgroundDefault.Color), v11)
    });
end;
local v14 = v5.PureComponent:extend("ConversationStackNavigatorConnectorWrapper");
v14.router = v8().router;
v14.render = function(v15)
    return v5.createElement(ConversationStackNavigatorConnector, v3.Dictionary.join(v15.props, {
        setRouter = function(v16)
            v14.router = v16;
        end
    }));
end;
return v14;

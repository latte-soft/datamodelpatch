local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.React);
local v2 = require(script.Parent.withNavigation);
local v3 = require(l_Parent_0.Events);
local v4 = {
    [v3.WillFocus] = "onWillFocus", 
    [v3.DidFocus] = "onDidFocus", 
    [v3.WillBlur] = "onWillBlur", 
    [v3.DidBlur] = "onDidBlur"
};
local v5 = v1.Component:extend("NavigationEvents");
v5.didMount = function(v6)
    v6:subscribeAll();
end;
v5.didUpdate = function(v7, v8)
    if v7.props.navigation ~= v8.navigation then
        v7:removeAll();
        v7:subscribeAll();
    end;
end;
v5.willUnmount = function(v9)
    v9:removeAll();
end;
v5.getPropListener = function(v10, v11)
    return v10.props[v4[v11]];
end;
v5.subscribeAll = function(v12)
    local l_navigation_0 = v12.props.navigation;
    v12.subscriptions = {};
    for v14 in v4, nil, nil do
        v12.subscriptions[v14] = l_navigation_0.addListener(v14, function(...)
            local v15 = v12:getPropListener(v14);
            if v15 then
                v15(...);
            end;
        end);
    end;
end;
v5.removeAll = function(v16)
    for v17 in v4, nil, nil do
        local v18 = v16.subscriptions[v17];
        if v18 then
            v18.remove();
            v16.subscriptions[v17] = nil;
        end;
    end;
end;
v5.render = function(_)
    return nil;
end;
return v2(v5);

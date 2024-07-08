local _ = script.Parent.Parent.Parent;
local l_Roact_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Roact;
local v2 = l_Roact_0.Component:extend("ExternalEventConnection");
v2.init = function(v3)
    v3.connection = nil;
end;
v2.render = function(v4)
    return l_Roact_0.oneChild(v4.props[l_Roact_0.Children]);
end;
v2.didMount = function(v5)
    v5.connection = v5.props.event:Connect(v5.props.callback);
end;
v2.didUpdate = function(v6, v7)
    if not (v6.props.event == v7.event) or v6.props.callback ~= v7.callback then
        v6.connection:Disconnect();
        v6.connection = v6.props.event:Connect(v6.props.callback);
    end;
end;
v2.willUnmount = function(v8)
    if v8.connection then
        v8.connection:Disconnect();
        v8.connection = nil;
    end;
end;
return v2;

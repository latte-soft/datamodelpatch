local v0 = require(game:GetService("CorePackages").Roact);
local v1 = v0.Component:extend("EventConnection");
v1.init = function(v2)
    v2.connection = nil;
end;
v1.render = function(v3)
    return v0.oneChild(v3.props[v0.Children]);
end;
v1.didMount = function(v4)
    v4.connection = v4.props.event:Connect(v4.props.callback);
end;
v1.didUpdate = function(v5, v6)
    if not (v5.props.event == v6.event) or v5.props.callback ~= v6.callback then
        v5.connection:Disconnect();
        v5.connection = v5.props.event:Connect(v5.props.callback);
    end;
end;
v1.willUnmount = function(v7)
    if v7.connection then
        v7.connection:Disconnect();
        v7.connection = nil;
    end;
end;
return v1;

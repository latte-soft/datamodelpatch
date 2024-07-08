local v0 = require(game:GetService("CorePackages").Roact).Component:extend("EventConnection");
v0.init = function(v1)
    v1.connection = nil;
end;
v0.didMount = function(v2)
    v2.connection = v2.props.event:Connect(v2.props.callback);
end;
v0.render = function(_)
    return nil;
end;
v0.didUpdate = function(v4, v5)
    if not (v4.props.event == v5.event) or v4.props.callback ~= v5.callback then
        v4.connection:Disconnect();
        v4.connection = v4.props.event:Connect(v4.props.callback);
    end;
end;
v0.willUnmount = function(v6)
    if v6.connection then
        v6.connection:Disconnect();
        v6.connection = nil;
    end;
end;
return v0;

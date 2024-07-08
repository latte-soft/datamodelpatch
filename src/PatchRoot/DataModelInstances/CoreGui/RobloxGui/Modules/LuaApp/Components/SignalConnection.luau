local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = v1.PureComponent:extend("SignalConnection");
v3.validateProps = v2.strictInterface({
    callback = v2.callback, 
    signal = v2.table
});
v3.init = function(v4)
    v4.connection = nil;
end;
v3.render = function(_)
    return nil;
end;
v3.didMount = function(v6)
    v6.connection = v6.props.signal:connect(v6.props.callback);
end;
v3.didUpdate = function(v7, v8)
    if not (v7.props.callback == v8.callback) or v7.props.signal ~= v8.signal then
        v7.connection:disconnect();
        v7.connection = v7.props.signal:connect(v7.props.callback);
    end;
end;
v3.willUnmount = function(v9)
    if v9.connection then
        v9.connection:disconnect();
        v9.connection = nil;
    end;
end;
return v3;

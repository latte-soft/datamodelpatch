local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.Parent.Parent.Components.DataConsumer);
local v2 = require(script.Parent.NetworkView);
local v3 = v0.Component:extend("ClientNetwork");
v3.init = function(v4, _)
    v4.state = {
        targetNetworkData = v4.props.ClientNetworkData
    };
end;
v3.render = function(v6)
    return v0.createElement(v2, {
        size = v6.props.size, 
        searchTerm = v6.props.searchTerm, 
        layoutOrder = v6.props.layoutOrder, 
        targetNetworkData = v6.state.targetNetworkData
    });
end;
return v1(v3, "ClientNetworkData");

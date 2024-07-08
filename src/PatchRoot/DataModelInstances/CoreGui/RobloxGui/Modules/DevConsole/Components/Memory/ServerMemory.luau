local v0 = require(game:GetService("CorePackages").Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v2 = require(l_Components_0.DataConsumer);
local v3 = require(l_Components_0.Memory.MemoryView);
local v4 = v0.Component:extend("ServerMemory");
v4.render = function(v5)
    return v0.createElement(v3, {
        layoutOrder = v5.props.layoutOrder, 
        size = v5.props.size, 
        searchTerm = v5.props.searchTerm, 
        targetMemoryData = v5.props.ServerMemoryData
    });
end;
return v2(v4, "ServerMemoryData");

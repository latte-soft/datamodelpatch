local l_Parent_0 = script.Parent.Parent;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_devAssert_0 = require(l_Parent_0.jsutils.devAssert).devAssert;
local v3 = require(l_Parent_0.jsutils.instanceOf);
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6, v7)
    local v8 = v6 or "GraphQL request";
    local v9 = v7 or {
        line = 1, 
        column = 1
    };
    l_devAssert_0(typeof(v5) == "string", "Body must be a string. Received: " .. l_inspect_0(v5) .. ".");
    local v10 = {
        body = v5, 
        name = v8, 
        locationOffset = v9
    };
    l_devAssert_0(v10.locationOffset.line > 0, "line in locationOffset is 1-indexed and must be positive.");
    l_devAssert_0(v10.locationOffset.column > 0, "column in locationOffset is 1-indexed and must be positive.");
    return (setmetatable(v10, v4));
end;
v4.__tostring = function(_)
    return "{table Source}";
end;
isSource = function(v12)
    return v3(v12, v4);
end;
return {
    Source = v4, 
    isSource = isSource
};

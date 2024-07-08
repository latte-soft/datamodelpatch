local v0 = {};
local l_ApolloLink_0 = require(script.Parent.Parent.core).ApolloLink;
local _ = require(script.Parent.selectHttpOptionsAndBody);
local l_createHttpLink_0 = require(script.Parent.createHttpLink).createHttpLink;
local v4 = setmetatable({}, {
    __index = l_ApolloLink_0
});
v4.__index = v4;
v4.new = function(v5)
    if v5 == nil then
        v5 = {};
    end;
    local v6 = setmetatable(l_ApolloLink_0.new(l_createHttpLink_0(v5).request), v4);
    v6.options = v5;
    return v6;
end;
v0.HttpLink = v4;
return v0;

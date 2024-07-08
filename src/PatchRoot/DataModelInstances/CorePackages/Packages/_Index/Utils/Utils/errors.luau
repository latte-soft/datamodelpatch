local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v2 = {};
local v3 = require(l_Parent_0.GraphQL);
local l_GraphQLError_0 = v3.GraphQLError;
local l_versionInfo_0 = v3.versionInfo;
local _ = require(script.Parent.types);
local function v9(v7, v8)
    if l_versionInfo_0.major >= 17 then
        return l_GraphQLError_0.new(v7, v8);
    else
        return l_GraphQLError_0.new(v7, if typeof(v8) == "table" then v8.nodes else nil, if typeof(v8) == "table" then v8.source else nil, if typeof(v8) == "table" then v8.positions else nil, if typeof(v8) == "table" then v8.path else nil, if typeof(v8) == "table" then v8.originalError else nil, if typeof(v8) == "table" then v8.extensions else nil);
    end;
end;
v2.createGraphQLError = v9;
v2.relocatedError = function(v10, v11)
    return v9(v10.message, {
        nodes = v10.nodes, 
        source = v10.source, 
        positions = v10.positions, 
        path = if v11 == nil then v10.path else v11, 
        originalError = v10, 
        extensions = v10.extensions
    });
end;
return v2;

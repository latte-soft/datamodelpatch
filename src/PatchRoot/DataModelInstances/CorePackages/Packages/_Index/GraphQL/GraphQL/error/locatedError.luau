local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Parent.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_instanceof_0 = v2.instanceof;
local l_inspect_0 = require(l_Parent_1.jsutils.inspect).inspect;
local _ = require(l_Parent_1.language.ast);
local l_GraphQLError_0 = require(l_Parent_0.GraphQLError).GraphQLError;
return {
    locatedError = function(v9, v10, v11)
        local v12 = nil;
        v12 = if not l_instanceof_0(v9, l_Error_0) then if (typeof(v9) == "table" and typeof(v9.message) == "string") and v9.stack ~= nil then l_Error_0.new(v9.message) else if typeof(v9) == "table" and typeof(v9.error) == "string" then l_Error_0.new("Unexpected error value: " .. l_inspect_0(v9.error)) else l_Error_0.new("Unexpected error value: " .. l_inspect_0(v9)) else v9;
        if not l_Array_0.isArray(v12.path) then
            return (l_GraphQLError_0.new(v12.message, v12.nodes or v10, v12.source, v12.positions, v11, v12));
        else
            return v12;
        end;
    end
};

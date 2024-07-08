local l_Parent_0 = script.Parent.Parent;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local _ = require(l_Parent_0.language.ast);
local l_Kind_0 = require(l_Parent_0.language.kinds).Kind;
local v5 = require(l_Parent_0.type.definition);
local l_GraphQLList_0 = v5.GraphQLList;
local l_GraphQLNonNull_0 = v5.GraphQLNonNull;
local _ = require(l_Parent_0.type.schema);
local function v9(v10, v11)
    local v12 = nil;
    if v11.kind == l_Kind_0.LIST_TYPE then
        v12 = v9(v10, v11.type);
        return v12 and l_GraphQLList_0.new(v12);
    elseif v11.kind == l_Kind_0.NON_NULL_TYPE then
        v12 = v9(v10, v11.type);
        return v12 and l_GraphQLNonNull_0.new(v12);
    elseif v11.kind == l_Kind_0.NAMED_TYPE then
        return v10:getType(v11.name.value);
    else
        l_invariant_0(false, "Unexpected type node: " .. l_inspect_0(v11));
        return nil;
    end;
end;
return {
    typeFromAST = v9
};

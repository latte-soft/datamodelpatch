local l_Parent_0 = script.Parent.Parent.Parent;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_isCompositeType_0 = require(l_Parent_0.type.definition).isCompositeType;
local l_utilities_0 = l_Parent_0.utilities;
local l_typeFromAST_0 = require(l_utilities_0.typeFromAST).typeFromAST;
local l_doTypesOverlap_0 = require(l_utilities_0.typeComparators).doTypesOverlap;
local v7 = {};
local v8 = nil;
v7.PossibleFragmentSpreadsRule = function(v9)
    return {
        InlineFragment = function(_, v11)
            local v12 = v9:getType();
            local v13 = v9:getParentType();
            if not ((not l_isCompositeType_0(v12) or not l_isCompositeType_0(v13)) or l_doTypesOverlap_0(v9:getSchema(), v12, v13)) then
                v9:reportError(l_GraphQLError_0.new(("Fragment cannot be spread here as objects of type \"%s\" can never be of type \"%s\"."):format(l_inspect_0(v13), (l_inspect_0(v12))), v11));
            end;
        end, 
        FragmentSpread = function(_, v15)
            local l_value_0 = v15.name.value;
            local v17 = v8(v9, l_value_0);
            local v18 = v9:getParentType();
            if not ((not v17 or not v18) or l_doTypesOverlap_0(v9:getSchema(), v17, v18)) then
                v9:reportError(l_GraphQLError_0.new(("Fragment \"%s\" cannot be spread here as objects of type \"%s\" can never be of type \"%s\"."):format(l_value_0, l_inspect_0(v18), (l_inspect_0(v17))), v15));
            end;
        end
    };
end;
v8 = function(v19, v20)
    local v21 = v19:getFragment(v20);
    if v21 then
        local v22 = l_typeFromAST_0(v19:getSchema(), v21.typeCondition);
        if l_isCompositeType_0(v22) then
            return v22;
        end;
    end;
    return nil;
end;
return v7;

local l_Parent_0 = script.Parent.Parent.Parent;
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local v3 = require(l_Parent_0.type.definition);
local l_getNamedType_0 = v3.getNamedType;
local l_isLeafType_0 = v3.isLeafType;
return {
    ScalarLeafsRule = function(v6)
        return {
            Field = function(_, v8)
                local v9 = v6:getType();
                local l_selectionSet_0 = v8.selectionSet;
                if v9 then
                    if not l_isLeafType_0(l_getNamedType_0(v9)) then
                        if not l_selectionSet_0 then
                            local l_value_0 = v8.name.value;
                            v6:reportError(l_GraphQLError_0.new(("Field \"%s\" of type \"%s\" must have a selection of subfields. Did you mean \"%s { ... }\"?"):format(l_value_0, l_inspect_0(v9), l_value_0), v8));
                        end;
                    elseif l_selectionSet_0 then
                        v6:reportError(l_GraphQLError_0.new(("Field \"%s\" must not have a selection since type \"%s\" has no subfields."):format(v8.name.value, (l_inspect_0(v9))), l_selectionSet_0));
                        return ;
                    end;
                end;
            end
        };
    end
};

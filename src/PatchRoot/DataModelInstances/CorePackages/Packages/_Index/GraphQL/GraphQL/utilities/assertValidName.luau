local l_Parent_0 = script.Parent.Parent;
local l_devAssert_0 = require(l_Parent_0.jsutils.devAssert).devAssert;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local v3 = nil;
local v4 = nil;
v4 = function(v5)
    local v6 = v3(v5);
    if v6 then
        error(v6);
    end;
    return v5;
end;
v3 = function(v7)
    l_devAssert_0(type(v7) == "string", "Expected name to be a string.");
    if (string.len(v7) > 1 and v7:sub(1, 1) == "_") and v7:sub(2, 2) == "_" then
        return l_GraphQLError_0.new("Name \"" .. v7 .. "\" must not begin with \"__\", which is reserved by GraphQL introspection.");
    else
        local v8, v9 = string.find(v7, "[_%a][_%a%d]*");
        local v10 = false;
        if v8 == 1 then
            v10 = string.len(v7) == v9;
        end;
        if v10 then
            return nil;
        else
            return l_GraphQLError_0.new("Names must match [_%a][_%a%d]* but \"" .. v7 .. "\" does not.");
        end;
    end;
end;
return {
    assertValidName = v4, 
    isValidNameError = v3
};

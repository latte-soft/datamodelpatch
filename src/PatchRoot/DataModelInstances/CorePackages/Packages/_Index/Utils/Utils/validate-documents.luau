local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local v5 = require(l_Parent_0.Promise);
local v6 = {};
local v7 = require(l_Parent_0.GraphQL);
local l_Kind_0 = v7.Kind;
local l_validate_0 = v7.validate;
local l_specifiedRules_0 = v7.specifiedRules;
local l_concatAST_0 = v7.concatAST;
local l_versionInfo_0 = v7.versionInfo;
local _ = require(script.Parent.loaders);
local l_AggregateError_0 = require(script.Parent.AggregateError).AggregateError;
local v15 = nil;
v6.validateGraphQlDocuments = function(v16, v17, v18)
    local v19 = if v18 ~= nil then v18 else v15();
    return v5.resolve():andThen(function()
        local v20 = l_Map_0.new();
        local v21 = {};
        for _, v23 in v17, nil, nil do
            if v23.document then
                local v24 = {};
                for _, v26 in v23.document.definitions, nil, nil do
                    if v26.kind == l_Kind_0.FRAGMENT_DEFINITION then
                        v20:set(v26.name.value, v26);
                    else
                        table.insert(v24, v26);
                    end;
                end;
                table.insert(v21, {
                    location = v23.location, 
                    document = {
                        kind = l_Kind_0.DOCUMENT, 
                        definitions = v24
                    }
                });
            end;
        end;
        local v27 = {};
        local v28 = {
            kind = l_Kind_0.DOCUMENT, 
            definitions = l_Array_0.concat({}, v20:values())
        };
        v5.all(l_Array_0.map(v21, function(v29)
            return v5.resolve():andThen(function()
                local v30 = l_validate_0(v16, l_concatAST_0({
                    v28, 
                    v29.document
                }), v19);
                if #v30 > 0 then
                    table.insert(v27, {
                        filePath = v29.location, 
                        errors = v30
                    });
                end;
            end);
        end)):expect();
        return v27;
    end);
end;
v6.checkValidationErrors = function(v31)
    if #v31 > 0 then
        local v32 = {};
        for _, v34 in v31, nil, nil do
            for _, v36 in v34.errors, nil, nil do
                local v37 = l_Error_0.new();
                v37.name = "GraphQLDocumentError";
                v37.message = ("%s: %s"):format(tostring(v37.name), (tostring(v36.message)));
                v37.stack = v37.message;
                if v36.locations then
                    for _, v39 in v36.locations, nil, nil do
                        v37.stack = tostring(v37.stack) .. ("\n    at %s:%s:%s"):format(tostring(v34.filePath), tostring(v39.line), (tostring(v39.column)));
                    end;
                end;
                table.insert(v32, v37);
            end;
        end;
        error(l_AggregateError_0.new(v32, ("GraphQL Document Validation failed with %s errors;\n  %s"):format(tostring(#v32), (tostring(l_Array_0.join(l_Array_0.map(v32, function(v40, v41)
            return ("Error %s: %s"):format(tostring(v41), (tostring(v40.stack)));
        end), "\n\n"))))));
    end;
end;
v15 = function()
    local v42 = {
        "NoUnusedFragmentsRule", 
        "NoUnusedVariablesRule", 
        "KnownDirectivesRule"
    };
    if l_versionInfo_0.major < 15 then
        v42 = l_Array_0.map(v42, function(v43)
            return (v43:gsub("Rule$", "", 1));
        end);
    end;
    return l_Array_0.filter(l_specifiedRules_0, function(v44)
        return not l_Array_0.includes(v42, (debug.info(v44, "n")));
    end);
end;
v6.createDefaultRules = v15;
return v6;

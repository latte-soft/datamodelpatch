local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Parent.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_devAssert_0 = require(l_Parent_1.jsutils.devAssert).devAssert;
local l_GraphQLError_0 = require(l_Parent_1.error.GraphQLError).GraphQLError;
local _ = require(l_Parent_1.language.ast);
local _ = require(l_Parent_1.type.schema);
local v9 = require(l_Parent_1.language.visitor);
local l_visit_0 = v9.visit;
local l_visitInParallel_0 = v9.visitInParallel;
local l_assertValidSchema_0 = require(l_Parent_1.type.validate).assertValidSchema;
local v13 = require(l_Parent_1.utilities.TypeInfo);
local l_TypeInfo_0 = v13.TypeInfo;
local l_visitWithTypeInfo_0 = v13.visitWithTypeInfo;
local v16 = require(l_Parent_0.specifiedRules);
local l_specifiedRules_0 = v16.specifiedRules;
local l_specifiedSDLRules_0 = v16.specifiedSDLRules;
local v19 = require(l_Parent_0.ValidationContext);
local l_SDLValidationContext_0 = v19.SDLValidationContext;
local l_ValidationContext_0 = v19.ValidationContext;
local v46 = {
    validate = function(v22, v23, v24, v25, v26)
        local v27 = v24 or l_specifiedRules_0;
        local v28 = v25 or {
            maxErrors = nil
        };
        local v29 = v26 or l_TypeInfo_0.new(v22);
        l_devAssert_0(v23, "Must provide document.");
        l_assertValidSchema_0(v22);
        local v30 = {};
        local v31 = {};
        local v33 = l_ValidationContext_0.new(v22, v23, v29, function(v32)
            if v28.maxErrors ~= nil and v28.maxErrors <= #v31 then
                table.insert(v31, l_GraphQLError_0.new("Too many validation errors, error limit reached. Validation aborted."));
                error(v30);
            end;
            table.insert(v31, v32);
        end);
        local v35 = l_visitInParallel_0(l_Array_0.map(v27, function(v34)
            return v34(v33);
        end));
        local l_status_0, l_result_0 = pcall(function()
            l_visit_0(v23, l_visitWithTypeInfo_0(v29, v35));
        end);
        if not l_status_0 and l_result_0 ~= v30 then
            error(l_result_0);
        end;
        return v31;
    end, 
    validateSDL = function(v38, v39, v40)
        local v41 = v40 or l_specifiedSDLRules_0;
        local v42 = {};
        local v44 = l_SDLValidationContext_0.new(v38, v39, function(v43)
            table.insert(v42, v43);
        end);
        l_visit_0(v38, l_visitInParallel_0((l_Array_0.map(v41, function(v45)
            return v45(v44);
        end))));
        return v42;
    end
};
v46.assertValidSDL = function(v47)
    local v48 = v46.validateSDL(v47);
    if #v48 ~= 0 then
        error(l_Error_0.new(table.concat(l_Array_0.map(v48, function(v49)
            return v49.message;
        end), "\n\n")));
    end;
end;
v46.assertValidSDLExtension = function(v50, v51)
    local v52 = v46.validateSDL(v50, v51);
    if #v52 ~= 0 then
        error(l_Error_0.new(table.concat(l_Array_0.map(v52, function(v53)
            if typeof(v53) == "string" then
                return v53;
            else
                return v53.message;
            end;
        end), "\n\n")));
    end;
end;
return v46;

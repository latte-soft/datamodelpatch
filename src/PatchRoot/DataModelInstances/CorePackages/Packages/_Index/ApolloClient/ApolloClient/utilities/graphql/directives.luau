local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local l_visit_0 = require(l_Parent_1.GraphQL).visit;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local v6 = nil;
v0.shouldInclude = function(v7, v8)
    local l_directives_0 = v7.directives;
    if not l_directives_0 or #l_directives_0 == 0 then
        return true;
    else
        return l_Array_0.every(v6(l_directives_0), function(v10)
            local l_directive_0 = v10.directive;
            local l_ifArgument_0 = v10.ifArgument;
            local v13 = false;
            if l_ifArgument_0.value.kind == "Variable" then
                local v14 = false;
                if v8 ~= nil then
                    v14 = v8[l_ifArgument_0.value.name.value];
                end;
                v13 = v14;
                l_invariant_0(v13 ~= nil, ("Invalid variable referenced in @%s directive."):format(l_directive_0.name.value));
            else
                v13 = l_ifArgument_0.value.value;
            end;
            if l_directive_0.name.value == "skip" then
                return not v13;
            else
                return v13;
            end;
        end);
    end;
end;
local function v19(v15)
    local v16 = {};
    l_visit_0(v15, {
        Directive = function(_, v18)
            table.insert(v16, v18.name.value);
        end
    });
    return v16;
end;
v0.getDirectiveNames = v19;
v0.hasDirectives = function(v20, v21)
    return l_Array_0.some(v19(v21), function(v22)
        return l_Array_0.indexOf(v20, v22) > -1;
    end);
end;
v0.hasClientExports = function(v23)
    local v24 = false;
    if v23 ~= nil then
        local v25 = {
            "client"
        };
        local l_v25_0 = v25 --[[ copy: 2 -> 3 ]];
        v24 = l_Array_0.some(v19(v23), function(v27)
            return l_Array_0.indexOf(l_v25_0, v27) > -1;
        end);
        if v24 then
            v25 = {
                "export"
            };
            v24 = l_Array_0.some(v19(v23), function(v28)
                return l_Array_0.indexOf(v25, v28) > -1;
            end);
        end;
    end;
    return v24;
end;
local function _(v29)
    local l_value_0 = v29.name.value;
    local v31 = true;
    if l_value_0 ~= "skip" then
        v31 = l_value_0 == "include";
    end;
    return v31;
end;
v6 = function(v33)
    local v34 = {};
    if v33 and #v33 > 0 then
        l_Array_0.forEach(v33, function(v35)
            local l_value_1 = v35.name.value;
            local v37 = true;
            if l_value_1 ~= "skip" then
                v37 = l_value_1 == "include";
            end;
            if v37 then
                v37 = v35.arguments;
                l_value_1 = v35.name.value;
                if not v37 or #v37 ~= 1 then
                    l_invariant_0(false, ("Incorrect number of arguments for the @%s directive."):format(l_value_1));
                end;
                local v38 = v37[1];
                if not v38.name or v38.name.value ~= "if" then
                    l_invariant_0(false, ("Invalid argument for the @%s directive."):format(l_value_1));
                end;
                local l_value_2 = v38.value;
                if not l_value_2 or l_value_2.kind ~= "Variable" and l_value_2.kind ~= "BooleanValue" then
                    l_invariant_0(false, ("Argument for the @%s directive must be a variable or a boolean value."):format(l_value_1));
                end;
                table.insert(v34, {
                    directive = v35, 
                    ifArgument = v38
                });
                return ;
            else
                return ;
            end;
        end);
    end;
    return v34;
end;
v0.getInclusionDirectives = v6;
return v0;

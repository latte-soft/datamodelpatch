local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v2.Error;
local l_Object_0 = v2.Object;
local l_extends_0 = v2.extends;
local l_isNaN_0 = v2.Number.isNaN;
local v7 = require(l_script_0.Collections);
local l_printTableEntries_0 = v7.printTableEntries;
local l_printMapEntries_0 = v7.printMapEntries;
local l_printListItems_0 = v7.printListItems;
local v11 = require(l_script_0.plugins.AsymmetricMatcher);
local v12 = require(l_script_0.plugins.ConvertAnsi);
local v13 = require(l_script_0.plugins.RobloxInstance);
local v14 = require(l_script_0.plugins.ReactElement);
local v15 = require(l_script_0.plugins.ReactTestComponent);
local v16 = require(l_Parent_0.JestGetType);
local l_getType_0 = v16.getType;
local l_isRobloxBuiltin_0 = v16.isRobloxBuiltin;
local _ = require(l_script_0.Types);
local v22 = l_extends_0(l_Error_0, "PrettyFormatPluginError", function(v20, v21)
    v20.name = "PrettyFormatPluginError";
    v20.message = v21;
end);
local v23 = nil;
local v24 = nil;
local function _(v25)
    if not l_isNaN_0(v25) then
        return (tostring(v25));
    else
        return "nan";
    end;
end;
local function _(v27, v28)
    if v28 then
        local v29 = debug.info(v27, "n");
        if not (v29 ~= nil) or v29 == "" then
            v29 = "anonymous";
        end;
        return "[Function " .. v29 .. "]";
    else
        return "[Function]";
    end;
end;
local function _(v31)
    return (tostring(v31));
end;
local function _(v33)
    return "[" .. tostring(v33) .. "]";
end;
local function v43(v35, v36, v37, v38)
    local v39 = l_getType_0(v35);
    if not (v39 ~= "boolean") or v39 == "nil" then
        return (tostring(v35));
    elseif v39 == "number" then
        local l_v35_0 = v35;
        if not l_isNaN_0(l_v35_0) then
            return (tostring(l_v35_0));
        else
            return "nan";
        end;
    elseif v39 == "string" then
        if not v38 then
            return "\"" .. v35 .. "\"";
        else
            return "\"" .. v35:gsub("\\", "\\\\"):gsub("\"", "\\\"") .. "\"";
        end;
    elseif v39 == "function" then
        local l_v35_1 = v35;
        if v36 then
            local v42 = debug.info(l_v35_1, "n");
            if not (v42 ~= nil) or v42 == "" then
                v42 = "anonymous";
            end;
            return "[Function " .. v42 .. "]";
        else
            return "[Function]";
        end;
    elseif v39 == "symbol" then
        return (tostring(v35));
    elseif v39 == "DateTime" then
        return string.sub(v35:ToIsoDate(), 1, -2) .. "." .. string.format("%03d", v35:ToUniversalTime().Millisecond) .. "Z";
    elseif v39 == "error" then
        return "[" .. tostring(v35) .. "]";
    elseif v39 == "regexp" then
        v35 = tostring(v35);
        if not v37 then
            return v35;
        else
            return (v35:gsub("[\\%^%$%*%+%?%.%(%)|%[%]{}]", "\\%1"));
        end;
    elseif v39 == "Instance" then
        return v35.ClassName;
    elseif not l_isRobloxBuiltin_0(v35) then
        if v39 == "userdata" then
            return (tostring(v35));
        else
            return nil;
        end;
    else
        return string.format("%s(%s)", v39, (tostring(v35)));
    end;
end;
local _ = function(v44)
    if type(v44) ~= "table" then
        return false;
    elseif #v44 > 0 then
        return true;
    else
        for _, _ in pairs(v44) do
            return false;
        end;
        return true;
    end;
end;
local function v60(v48, v49, v50, v51, v52, v53)
    if table.find(v52, v48) ~= nil then
        return "[Circular]";
    else
        v52 = {
            unpack(v52)
        };
        table.insert(v52, v48);
        v51 = v51 + 1;
        local v54 = v49.maxDepth < v51;
        local l_min_0 = v49.min;
        if not (not ((not v49.callToJSON or v54) or not v48.toJSON) and typeof(v48.toJSON) == "function") or v53 then
            if not v54 then
                local v56 = "";
                if not l_min_0 then
                    v56 = not v49.printBasicPrototype and "" or "Table" .. " ";
                end;
                local v57;
                if type(v48) ~= "table" then
                    v57 = false;
                elseif #v48 > 0 then
                    v57 = true;
                else
                    for _, _ in pairs(v48) do
                        v57 = false;
                        goto label0 --[[  true, false  ]];
                    end;
                    v57 = true;
                end;
                ::label0::;
                if not v57 then
                    if l_getType_0(v48) == "set" then
                        if not v54 then
                            return "Set {" .. l_printListItems_0(v48._array, v49, v50, v51, v52, v23) .. "}";
                        else
                            return "[Set]";
                        end;
                    elseif l_getType_0(v48) == "map" then
                        if not v54 then
                            return "Map {" .. l_printMapEntries_0(v48._map, v49, v50, v51, v52, v23) .. "}";
                        else
                            return "[Map]";
                        end;
                    else
                        return v56 .. "{" .. l_printTableEntries_0(v48, v49, v50, v51, v52, v23) .. "}";
                    end;
                else
                    return v56 .. "{" .. l_printListItems_0(v48, v49, v50, v51, v52, v23) .. "}";
                end;
            elseif l_getType_0(v48) == "set" then
                return "[Set]";
            else
                return "[Table]";
            end;
        else
            return v23(v48.toJSON(), v49, v50, v51, v52, true);
        end;
    end;
end;
local function _(v61)
    return v61.serialize ~= nil;
end;
printPlugin = function(v63, v64, v65, v66, v67, v68)
    local v69 = nil;
    local l_status_0, l_result_0 = pcall(function()
        if not (v63.serialize ~= nil) then
            v69 = v63.print(v64, function(v70)
                return v23(v70, v65, v66, v67, v68);
            end, function(v71)
                local v72 = v66 .. v65.indent;
                return v72 .. v71:gsub("\n", "\n" .. v72);
            end, {
                edgeSpacing = v65.spacingOuter, 
                min = v65.min, 
                spacing = v65.spacingInner
            }, v65.colors);
            return ;
        else
            v69 = v63.serialize(v64, v65, v66, v67, v68, v23);
            return ;
        end;
    end);
    if not l_status_0 then
        if typeof(l_result_0) == "table" and l_result_0.name == "PrettyFormatPluginError" then
            error(l_result_0);
        end;
        error(v22(l_result_0));
    end;
    if typeof(v69) ~= "string" then
        error(l_Error_0(string.format("pretty-format: Plugin must return type \"string\" but instead returned \"%s\".", (typeof(v69)))));
    end;
    return v69;
end;
local function v81(v75, v76)
    for _, v78 in ipairs(v75) do
        local l_status_1, l_result_1 = pcall(v78.test, v76);
        if l_status_1 then
            if l_result_1 then
                return v78;
            end;
        else
            error(v22(l_result_1));
        end;
    end;
    return nil;
end;
v23 = function(v82, v83, v84, v85, v86, v87)
    local v88 = v81(v83.plugins, v82);
    if v88 ~= nil then
        return printPlugin(v88, v82, v83, v84, v85, v86);
    else
        local v89 = v43(v82, v83.printFunctionName, v83.escapeRegex, v83.escapeString);
        if v89 ~= nil then
            return v89;
        else
            return v60(v82, v83, v84, v85, v86, v87);
        end;
    end;
end;
local v90 = {
    callToJSON = true, 
    compareKeys = l_Object_0.None, 
    escapeRegex = false, 
    escapeString = true, 
    highlight = false, 
    indent = 2, 
    maxDepth = math.huge, 
    maxWidth = math.huge, 
    min = false, 
    plugins = {}, 
    printBasicPrototype = true, 
    printInstanceDefaults = true, 
    printFunctionName = true, 
    theme = nil
};
local function v94(v91)
    for v92, _ in pairs(v91) do
        if v90[v92] == nil then
            error(l_Error_0(string.format("pretty-format: Unknown option \"%s\".", (tostring(v92)))));
        end;
    end;
    if (v91.min and v91.indent ~= nil) and v91.indent ~= 0 then
        error(l_Error_0("pretty-format: Options \"min\" and \"indent\" cannot be used together."));
    end;
end;
local function _(v95, v96)
    if v95 and v95[v96] ~= nil then
        return v95[v96];
    else
        return v90[v96];
    end;
end;
local function _(v98)
    if not v98 or not v98.min then
        local l_indent_0 = v90.indent;
        if v98 and v98.indent ~= nil then
            l_indent_0 = v98.indent;
        end;
        return v24(l_indent_0);
    else
        return "";
    end;
end;
local function _(v101)
    if not v101 or not v101.min then
        return "\n";
    else
        return " ";
    end;
end;
local function _(v103)
    if not v103 or not v103.min then
        return "\n";
    else
        return "";
    end;
end;
local function v109(v105)
    local v106 = {
        callToJSON = if not not v105 and v105.callToJSON ~= nil then v105.callToJSON else v90.callToJSON, 
        colors = nil, 
        compareKeys = if v105 ~= nil and typeof(v105.compareKeys) == "function" then v105.compareKeys else v90.compareKeys, 
        escapeRegex = if not not v105 and v105.escapeRegex ~= nil then v105.escapeRegex else v90.escapeRegex, 
        escapeString = if not not v105 and v105.escapeString ~= nil then v105.escapeString else v90.escapeString
    };
    local v107;
    if not v105 or not v105.min then
        local l_indent_1 = v90.indent;
        if v105 and v105.indent ~= nil then
            l_indent_1 = v105.indent;
        end;
        v107 = v24(l_indent_1);
    else
        v107 = "";
    end;
    v106.indent = v107;
    v106.maxDepth = if not not v105 and v105.maxDepth ~= nil then v105.maxDepth else v90.maxDepth;
    v106.maxWidth = if not not v105 and v105.maxWidth ~= nil then v105.maxWidth else v90.maxWidth;
    v106.min = if not not v105 and v105.min ~= nil then v105.min else v90.min;
    v106.plugins = if not not v105 and v105.plugins ~= nil then v105.plugins else v90.plugins;
    v106.printBasicPrototype = (v105 == nil or not (v105.printBasicPrototype ~= nil)) or v105.printBasicPrototype;
    v106.printInstanceDefaults = if not not v105 and v105.printInstanceDefaults ~= nil then v105.printInstanceDefaults else v90.printInstanceDefaults;
    v106.printFunctionName = if not not v105 and v105.printFunctionName ~= nil then v105.printFunctionName else v90.printFunctionName;
    v106.spacingInner = (not not v105 and v105.min) and " " or "\n";
    v106.spacingOuter = (not not v105 and v105.min) and "" or "\n";
    return v106;
end;
v24 = function(v110)
    return string.rep(" ", v110);
end;
local function v115(v111, v112)
    if v112 then
        v94(v112);
        if v112.plugins then
            local v113 = v81(v112.plugins, v111);
            if v113 ~= nil then
                return printPlugin(v113, v111, v109(v112), "", 0, {});
            end;
        end;
    end;
    local v114 = v43(v111, if not not v112 and v112.printFunctionName ~= nil then v112.printFunctionName else v90.printFunctionName, if not not v112 and v112.escapeRegex ~= nil then v112.escapeRegex else v90.escapeRegex, if not not v112 and v112.escapeString ~= nil then v112.escapeString else v90.escapeString);
    if v114 ~= nil then
        return v114;
    else
        return v60(v111, v109(v112), "", 0, {}, nil);
    end;
end;
return {
    format = v115, 
    default = v115, 
    plugins = {
        AsymmetricMatcher = v11, 
        ConvertAnsi = v12, 
        ReactElement = v14, 
        ReactTestComponent = v15, 
        RobloxInstance = v13
    }, 
    DEFAULT_OPTIONS = v90
};

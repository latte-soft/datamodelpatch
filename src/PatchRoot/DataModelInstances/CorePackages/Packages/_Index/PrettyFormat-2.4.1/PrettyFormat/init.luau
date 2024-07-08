local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v2.Error;
local l_Object_0 = v2.Object;
local l_extends_0 = v2.extends;
local l_isNaN_0 = v2.Number.isNaN;
local v7 = require(l_script_0.Collections);
local l_printTableEntries_0 = v7.printTableEntries;
local l_printListItems_0 = v7.printListItems;
local v10 = require(l_script_0.plugins.AsymmetricMatcher);
local v11 = require(l_script_0.plugins.ConvertAnsi);
local v12 = require(l_script_0.plugins.RobloxInstance);
local v13 = require(l_script_0.plugins.ReactElement);
local v14 = require(l_script_0.plugins.ReactTestComponent);
local v15 = require(l_Parent_0.JestGetType);
local l_getType_0 = v15.getType;
local l_isRobloxBuiltin_0 = v15.isRobloxBuiltin;
local _ = require(l_script_0.Types);
local v21 = l_extends_0(l_Error_0, "PrettyFormatPluginError", function(v19, v20)
    v19.name = "PrettyFormatPluginError";
    v19.message = v20;
end);
local v22 = nil;
local v23 = nil;
local function _(v24)
    if not l_isNaN_0(v24) then
        return (tostring(v24));
    else
        return "nan";
    end;
end;
local function _(v26, v27)
    if v27 then
        local v28 = debug.info(v26, "n");
        if not (v28 ~= nil) or v28 == "" then
            v28 = "anonymous";
        end;
        return "[Function " .. v28 .. "]";
    else
        return "[Function]";
    end;
end;
local function _(v30)
    return (tostring(v30));
end;
local function _(v32)
    return "[" .. tostring(v32) .. "]";
end;
local function v42(v34, v35, v36, v37)
    local v38 = l_getType_0(v34);
    if not (v38 ~= "boolean") or v38 == "nil" then
        return (tostring(v34));
    elseif v38 == "number" then
        local l_v34_0 = v34;
        if not l_isNaN_0(l_v34_0) then
            return (tostring(l_v34_0));
        else
            return "nan";
        end;
    elseif v38 == "string" then
        if not v37 then
            return "\"" .. v34 .. "\"";
        else
            return "\"" .. v34:gsub("\\", "\\\\"):gsub("\"", "\\\"") .. "\"";
        end;
    elseif v38 == "function" then
        local l_v34_1 = v34;
        if v35 then
            local v41 = debug.info(l_v34_1, "n");
            if not (v41 ~= nil) or v41 == "" then
                v41 = "anonymous";
            end;
            return "[Function " .. v41 .. "]";
        else
            return "[Function]";
        end;
    elseif v38 == "symbol" then
        return (tostring(v34));
    elseif v38 == "DateTime" then
        return string.sub(v34:ToIsoDate(), 1, -2) .. "." .. string.format("%03d", v34:ToUniversalTime().Millisecond) .. "Z";
    elseif v38 == "error" then
        return "[" .. tostring(v34) .. "]";
    elseif v38 == "regexp" then
        v34 = tostring(v34);
        if not v36 then
            return v34;
        else
            return (v34:gsub("[\\%^%$%*%+%?%.%(%)|%[%]{}]", "\\%1"));
        end;
    elseif v38 == "Instance" then
        return v34.ClassName;
    elseif not l_isRobloxBuiltin_0(v34) then
        if v38 == "userdata" then
            return (tostring(v34));
        else
            return nil;
        end;
    else
        return string.format("%s(%s)", v38, (tostring(v34)));
    end;
end;
local _ = function(v43)
    if type(v43) ~= "table" then
        return false;
    elseif #v43 > 0 then
        return true;
    else
        for _, _ in pairs(v43) do
            return false;
        end;
        return true;
    end;
end;
local function v59(v47, v48, v49, v50, v51, v52)
    if table.find(v51, v47) ~= nil then
        return "[Circular]";
    else
        v51 = {
            unpack(v51)
        };
        table.insert(v51, v47);
        v50 = v50 + 1;
        local v53 = v48.maxDepth < v50;
        local l_min_0 = v48.min;
        if not (not ((not v48.callToJSON or v53) or not v47.toJSON) and typeof(v47.toJSON) == "function") or v52 then
            if not v53 then
                local v55 = "";
                if not l_min_0 then
                    v55 = not v48.printBasicPrototype and "" or "Table" .. " ";
                end;
                local v56;
                if type(v47) ~= "table" then
                    v56 = false;
                elseif #v47 > 0 then
                    v56 = true;
                else
                    for _, _ in pairs(v47) do
                        v56 = false;
                        goto label0 --[[  true, false  ]];
                    end;
                    v56 = true;
                end;
                ::label0::;
                if not v56 then
                    if l_getType_0(v47) == "set" then
                        if not v53 then
                            return "Set {" .. l_printListItems_0(v47._array, v48, v49, v50, v51, v22) .. "}";
                        else
                            return "[Set]";
                        end;
                    else
                        return v55 .. "{" .. l_printTableEntries_0(v47, v48, v49, v50, v51, v22) .. "}";
                    end;
                else
                    return v55 .. "{" .. l_printListItems_0(v47, v48, v49, v50, v51, v22) .. "}";
                end;
            elseif l_getType_0(v47) == "set" then
                return "[Set]";
            else
                return "[Table]";
            end;
        else
            return v22(v47.toJSON(), v48, v49, v50, v51, true);
        end;
    end;
end;
local function _(v60)
    return v60.serialize ~= nil;
end;
printPlugin = function(v62, v63, v64, v65, v66, v67)
    local v68 = nil;
    local l_status_0, l_result_0 = pcall(function()
        if not (v62.serialize ~= nil) then
            v68 = v62.print(v63, function(v69)
                return v22(v69, v64, v65, v66, v67);
            end, function(v70)
                local v71 = v65 .. v64.indent;
                return v71 .. v70:gsub("\n", "\n" .. v71);
            end, {
                edgeSpacing = v64.spacingOuter, 
                min = v64.min, 
                spacing = v64.spacingInner
            }, v64.colors);
            return ;
        else
            v68 = v62.serialize(v63, v64, v65, v66, v67, v22);
            return ;
        end;
    end);
    if not l_status_0 then
        error(v21(l_result_0));
    end;
    if typeof(v68) ~= "string" then
        error(l_Error_0(string.format("pretty-format: Plugin must return type \"string\" but instead returned \"%s\".", (typeof(v68)))));
    end;
    return v68;
end;
local function v80(v74, v75)
    for _, v77 in ipairs(v74) do
        local l_status_1, l_result_1 = pcall(v77.test, v75);
        if l_status_1 then
            if l_result_1 then
                return v77;
            end;
        else
            error(v21(l_result_1));
        end;
    end;
    return nil;
end;
v22 = function(v81, v82, v83, v84, v85, v86)
    local v87 = v80(v82.plugins, v81);
    if v87 ~= nil then
        return printPlugin(v87, v81, v82, v83, v84, v85);
    else
        local v88 = v42(v81, v82.printFunctionName, v82.escapeRegex, v82.escapeString);
        if v88 ~= nil then
            return v88;
        else
            return v59(v81, v82, v83, v84, v85, v86);
        end;
    end;
end;
local v89 = {
    callToJSON = true, 
    compareKeys = l_Object_0.None, 
    escapeRegex = false, 
    escapeString = true, 
    highlight = false, 
    indent = 2, 
    maxDepth = math.huge, 
    min = false, 
    plugins = {}, 
    printBasicPrototype = true, 
    printFunctionName = true, 
    theme = nil
};
local function v93(v90)
    for v91, _ in pairs(v90) do
        if v89[v91] == nil then
            error(l_Error_0(string.format("pretty-format: Unknown option \"%s\".", (tostring(v91)))));
        end;
    end;
    if (v90.min and v90.indent ~= nil) and v90.indent ~= 0 then
        error(l_Error_0("pretty-format: Options \"min\" and \"indent\" cannot be used together."));
    end;
end;
local function _(v94, v95)
    if v94 and v94[v95] ~= nil then
        return v94[v95];
    else
        return v89[v95];
    end;
end;
local function _(v97)
    if not v97 or not v97.min then
        local l_indent_0 = v89.indent;
        if v97 and v97.indent ~= nil then
            l_indent_0 = v97.indent;
        end;
        return v23(l_indent_0);
    else
        return "";
    end;
end;
local function _(v100)
    if not v100 or not v100.min then
        return "\n";
    else
        return " ";
    end;
end;
local function _(v102)
    if not v102 or not v102.min then
        return "\n";
    else
        return "";
    end;
end;
local function v108(v104)
    local v105 = {
        callToJSON = if not not v104 and v104.callToJSON ~= nil then v104.callToJSON else v89.callToJSON, 
        colors = nil, 
        compareKeys = if v104 ~= nil and typeof(v104.compareKeys) == "function" then v104.compareKeys else v89.compareKeys, 
        escapeRegex = if not not v104 and v104.escapeRegex ~= nil then v104.escapeRegex else v89.escapeRegex, 
        escapeString = if not not v104 and v104.escapeString ~= nil then v104.escapeString else v89.escapeString
    };
    local v106;
    if not v104 or not v104.min then
        local l_indent_1 = v89.indent;
        if v104 and v104.indent ~= nil then
            l_indent_1 = v104.indent;
        end;
        v106 = v23(l_indent_1);
    else
        v106 = "";
    end;
    v105.indent = v106;
    v105.maxDepth = if not not v104 and v104.maxDepth ~= nil then v104.maxDepth else v89.maxDepth;
    v105.min = if not not v104 and v104.min ~= nil then v104.min else v89.min;
    v105.plugins = if not not v104 and v104.plugins ~= nil then v104.plugins else v89.plugins;
    v105.printBasicPrototype = (v104 == nil or not (v104.printBasicPrototype ~= nil)) or v104.printBasicPrototype;
    v105.printFunctionName = if not not v104 and v104.printFunctionName ~= nil then v104.printFunctionName else v89.printFunctionName;
    v105.spacingInner = (not not v104 and v104.min) and " " or "\n";
    v105.spacingOuter = (not not v104 and v104.min) and "" or "\n";
    return v105;
end;
v23 = function(v109)
    return string.rep(" ", v109);
end;
local function v114(v110, v111)
    if v111 then
        v93(v111);
        if v111.plugins then
            local v112 = v80(v111.plugins, v110);
            if v112 ~= nil then
                return printPlugin(v112, v110, v108(v111), "", 0, {});
            end;
        end;
    end;
    local v113 = v42(v110, if not not v111 and v111.printFunctionName ~= nil then v111.printFunctionName else v89.printFunctionName, if not not v111 and v111.escapeRegex ~= nil then v111.escapeRegex else v89.escapeRegex, if not not v111 and v111.escapeString ~= nil then v111.escapeString else v89.escapeString);
    if v113 ~= nil then
        return v113;
    else
        return v59(v110, v108(v111), "", 0, {}, nil);
    end;
end;
return {
    format = v114, 
    default = v114, 
    plugins = {
        AsymmetricMatcher = v10, 
        ConvertAnsi = v11, 
        ReactElement = v13, 
        ReactTestComponent = v14, 
        RobloxInstance = v12
    }, 
    DEFAULT_OPTIONS = v89
};

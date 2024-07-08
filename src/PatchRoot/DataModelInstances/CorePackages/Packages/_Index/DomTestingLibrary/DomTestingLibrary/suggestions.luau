local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_console_0 = v1.console;
local v6 = require(l_Parent_0.LuauRegExp);
local l_getNodeTestId_0 = require(script.Parent["get-node-test-id"]).getNodeTestId;
local _ = require(script.Parent.types.suggestions);
local v9 = {};
local l_getDefaultNormalizer_0 = require(script.Parent.matches).getDefaultNormalizer;
local l_getNodeText_0 = require(script.Parent["get-node-text"]).getNodeText;
local l_getConfig_0 = require(script.Parent.config).getConfig;
local v13 = l_getDefaultNormalizer_0();
local function _(v14)
    return (v14:gsub("[\\%.%*%+\\%-%?%^%${}%(%)|%[%]]", "\\%1"));
end;
local function _(v16)
    return v6((v16:lower():gsub("[\\%.%*%+\\%-%?%^%${}%(%)|%[%]]", "\\%1")));
end;
local function v32(v18, _, v20, v21)
    local l_variant_0 = v21.variant;
    local l_name_0 = v21.name;
    local v24 = {};
    local v25 = {
        if not l_Array_0.includes({
            "Role", 
            "TestId"
        }, v18) then v6((v20:lower():gsub("[\\%.%*%+\\%-%?%^%${}%(%)|%[%]]", "\\%1"))) else v20
    };
    if l_Boolean_0.toJSBoolean(l_name_0) then
        v24.name = v6((l_name_0:lower():gsub("[\\%.%*%+\\%-%?%^%${}%(%)|%[%]]", "\\%1")));
    end;
    if #l_Object_0.keys(v24) > 0 then
        table.insert(v25, v24);
    end;
    local v26 = ("%sBy%s"):format(l_variant_0, v18);
    return {
        queryName = v18, 
        queryMethod = v26, 
        queryArgs = v25, 
        variant = l_variant_0, 
        warning = "", 
        toString = function()
            if l_Boolean_0.toJSBoolean("") then
                l_console_0.warn("");
            end;
            local v27, v28 = table.unpack(v25, 1, 2);
            if typeof(v27) == "string" then
                v27 = ("'%s'"):format(v27);
            end;
            return ("%s(%s%s)"):format(v26, tostring(v27), (tostring(if v28 ~= nil then (", { %s }"):format(l_Array_0.join(l_Array_0.map(l_Object_0.entries(v28), function(v29)
                local v30, v31 = table.unpack(v29, 1, 2);
                return ("%s: %s"):format(tostring(v30), (tostring(v31)));
            end), ", ")) else "")));
        end
    };
end;
local function _(v33, v34, v35)
    local v36;
    if not l_Boolean_0.toJSBoolean(v35) then
        v36 = false;
    else
        v36 = not l_Boolean_0.toJSBoolean(v34);
        if not v36 then
            return v34:lower() == v33:lower();
        end;
    end;
    return v36;
end;
v9.getSuggestedQuery = function(v38, v39, v40)
    local v41 = v39 == nil and "get" or v39;
    if not l_Array_0.includes(l_getConfig_0().defaultIgnore, v38.ClassName) then
        local l_status_0, l_result_0 = pcall(function()
            return v38.PlaceholderText;
        end);
        if not l_status_0 or not (not not l_Boolean_0.toJSBoolean(l_result_0) and (not l_Boolean_0.toJSBoolean(v40) or v40:lower() == ("PlaceholderText"):lower())) then
            local v44 = v13(l_getNodeText_0(v38));
            if not (not not l_Boolean_0.toJSBoolean(v44) and (not l_Boolean_0.toJSBoolean(v40) or v40:lower() == ("Text"):lower())) then
                local l_status_1, l_result_1 = pcall(function()
                    return v38.Text;
                end);
                if not l_status_1 or not (not not l_Boolean_0.toJSBoolean(l_result_1) and (not l_Boolean_0.toJSBoolean(v40) or v40:lower() == ("DisplayValue"):lower())) then
                    local v47 = l_getNodeTestId_0(v38);
                    if not v47 or not (not not l_Boolean_0.toJSBoolean(v47) and (not l_Boolean_0.toJSBoolean(v40) or v40:lower() == ("TestId"):lower())) then
                        return nil;
                    else
                        return (v32("TestId", v38, v47, {
                            variant = v41
                        }));
                    end;
                else
                    return (v32("DisplayValue", v38, v13(l_result_1), {
                        variant = v41
                    }));
                end;
            else
                return (v32("Text", v38, v44, {
                    variant = v41
                }));
            end;
        else
            return (v32("PlaceholderText", v38, l_result_0, {
                variant = v41
            }));
        end;
    else
        return nil;
    end;
end;
return v9;

local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v1.Error;
local l_String_0 = v1.String;
local l_instanceof_0 = v1.instanceof;
local v5 = require(l_Parent_0.LuauRegExp);
local v6 = {};
local v7 = nil;
local _ = require(script.Parent.types);
local function _(v9)
    if v9 == nil then
        error(l_Error_0.new(("It looks like %s was passed instead of a matcher. Did you do something like getByText(%s)?"):format(tostring(v9), (tostring(v9)))));
    end;
    return true;
end;
local function v16(v11, v12, v13, v14)
    if typeof(v11) ~= "string" then
        return false;
    else
        if v13 == nil then
            error(l_Error_0.new(("It looks like %s was passed instead of a matcher. Did you do something like getByText(%s)?"):format(tostring(v13), (tostring(v13)))));
        end;
        local v15 = v14(v11);
        if not (typeof(v13) ~= "string") or typeof(v13) == "number" then
            return v15:lower():find(tostring(v13):lower()) ~= nil;
        elseif typeof(v13) == "function" then
            return v13(v15, v12);
        else
            return v7(v13, v15);
        end;
    end;
end;
local function v22(v17, v18, v19, v20)
    if typeof(v17) ~= "string" then
        return false;
    else
        if v19 == nil then
            error(l_Error_0.new(("It looks like %s was passed instead of a matcher. Did you do something like getByText(%s)?"):format(tostring(v19), (tostring(v19)))));
        end;
        local v21 = v20(v17);
        if typeof(v19) == "function" then
            return v19(v21, v18);
        elseif not l_instanceof_0(v19, v5) then
            return v21 == tostring(v19);
        else
            return v7(v19, v21);
        end;
    end;
end;
local function v29(v23)
    local v24 = if v23 == nil then {} else v23;
    local v25 = v24.trim == nil and true or v24.trim;
    local v26 = v24.collapseWhitespace == nil and true or v24.collapseWhitespace;
    return function(v27)
        local l_v27_0 = v27;
        if v25 then
            l_v27_0 = l_String_0.trim(l_v27_0);
        end;
        if not v26 then
            return l_v27_0;
        else
            return (l_v27_0:gsub("%s+", " "));
        end;
    end;
end;
local function v34(v30)
    local l_trim_0 = v30.trim;
    local l_collapseWhitespace_0 = v30.collapseWhitespace;
    local l_normalizer_0 = v30.normalizer;
    if l_normalizer_0 then
        if not (l_trim_0 == nil) or l_collapseWhitespace_0 ~= nil then
            error(l_Error_0.new("trim and collapseWhitespace are not supported with a normalizer. " .. "If you want to use the default trim and collapseWhitespace logic in your normalizer, " .. "use \"getDefaultNormalizer({trim, collapseWhitespace})\" and compose that into your normalizer"));
        end;
        return l_normalizer_0;
    else
        return (v29({
            trim = l_trim_0, 
            collapseWhitespace = l_collapseWhitespace_0
        }));
    end;
end;
v7 = function(v35, v36)
    return (v35:test(v36));
end;
v6.fuzzyMatches = v16;
v6.matches = v22;
v6.getDefaultNormalizer = v29;
v6.makeNormalizer = v34;
return v6;

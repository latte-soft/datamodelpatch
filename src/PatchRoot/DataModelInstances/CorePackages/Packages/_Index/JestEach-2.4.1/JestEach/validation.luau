local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local l_String_0 = v1.String;
local v5 = {};
local v6 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local l_format_0 = require(l_Parent_0.PrettyFormat).format;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local l_green_0 = v6.green;
local l_red_0 = v6.red;
v5.validateArrayTable = function(v15)
    if not l_Array_0.isArray(v15) then
        error(l_Error_0.new("`.each` must be called with an Array or Tagged Template Literal.\n\n" .. ("Instead was called with: %s\n"):format(l_format_0(v15, {
            maxDepth = 1, 
            min = true
        }))));
    end;
    if v9(v15) then
        if v10(v15[1]) then
            error(l_Error_0.new("Error: `.each` called with an empty Tagged Template Literal of table data.\n"));
        end;
        error(l_Error_0.new("Error: `.each` called with a Tagged Template Literal with no data, remember to interpolate with ${expression} syntax.\n"));
    end;
    if v11(v15) then
        error(l_Error_0.new("Error: `.each` called with an empty Array of table data.\n"));
    end;
end;
v9 = function(v16)
    return v16.raw ~= nil;
end;
v11 = function(v17)
    return #v17 == 0;
end;
v10 = function(v18)
    local v19 = false;
    if typeof(v18) == "string" then
        v19 = l_String_0.trim(v18) == "";
    end;
    return v19;
end;
v5.validateTemplateTableArguments = function(v20, v21)
    l_Array_0.forEach(v21, function(v22, v23)
        local v24 = #v20 - #v22;
        local v25 = if v24 >= 0 then v24 else v24 - #v20;
        if v25 ~= 0 then
            error(l_Error_0.new(("%s arguments supplied for given headings:\n"):format(v24 > 0 and "Not enough" or "Too many") .. tostring(l_green_0(l_Array_0.join(v20, " | "))) .. "\n\n" .. "Received:\n" .. tostring(l_red_0(l_format_0(v21))) .. "\n\n" .. ("%s %s %s in row %d"):format(v24 > 0 and "Missing" or "Remove", l_red_0((tostring(v25))), v12("argument", v25), v23)));
        end;
    end);
end;
v12 = function(v26, v27)
    return v26 .. (v27 == 1 and "" or "s");
end;
local v28 = "^" .. "s*[^%.*]+s*" .. "$";
v5.extractValidTemplateHeadings = function(v29)
    local v30 = v29:match(v28);
    local v31 = nil;
    local v32 = nil;
    if v30 then
        v31 = l_Array_0.filter(l_String_0.split(v30, "\n"), function(v33)
            return l_String_0.trim(v33) ~= "";
        end);
    end;
    if v31 and #v31 > 0 then
        v32 = l_Array_0.some(l_Array_0.map(l_String_0.split(v31[1], "|"), function(v34)
            return l_String_0.trim(v34);
        end), function(v35)
            return v35:match("%s") ~= nil;
        end);
    end;
    if not (v30 ~= nil and not v32) then
        error(l_Error_0.new("Table headings do not conform to expected format:\n\n" .. l_green_0("heading1 | headingN") .. "\n\n" .. "Received:\n\n" .. l_red_0(l_format_0(v29))));
    end;
    return v31[1];
end;
return v5;

local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local l_String_0 = v1.String;
local l_console_0 = v1.console;
local v8 = {};
local function v9(...)
    return require(l_Parent_0.Chalk);
end;
local v10 = false;
local function _(v11)
    return {
        gutter = v11.grey, 
        marker = v11.red.bold, 
        message = v11.red.bold
    };
end;
local v13 = {
    "\r\n", 
    "\n", 
    "\r", 
    "\2028", 
    "\2029"
};
local function v32(v14, v15, v16)
    local v17 = l_Object_0.assign({}, {
        column = 1, 
        line = 0
    }, v14.start);
    local v18 = l_Object_0.assign({}, v17, v14["end"]);
    local v19 = v16 or {};
    local v20 = v19.linesAbove == nil and 2 or v19.linesAbove;
    local v21 = v19.linesBelow == nil and 3 or v19.linesBelow;
    local l_line_0 = v17.line;
    local l_column_0 = v17.column;
    local l_line_1 = v18.line;
    local l_column_1 = v18.column;
    local v26 = math.max(l_line_0 - v20, 1);
    local v27 = math.min(#v15 == 0 and 1 or #v15, l_line_1 + v21);
    if l_line_0 == 0 then
        v26 = 1;
    end;
    if l_line_1 == 0 then
        v27 = #v15 == 0 and 1 or #v15;
    end;
    local v28 = l_line_1 - l_line_0;
    local v29 = {};
    if v28 > 0 then
        for v30 = 0, v28 do
            local v31 = v30 + l_line_0;
            if l_column_0 <= 1 then
                v29[v31] = true;
            elseif v30 == 0 then
                v29[v31] = {
                    l_column_0, 
                    (#v15[v31] - l_column_0) + 1
                };
            elseif v30 == v28 then
                v29[v31] = {
                    1, 
                    l_column_1
                };
            else
                v29[v31] = {
                    1, 
                    #v15[v31]
                };
            end;
        end;
    elseif l_column_0 == l_column_1 then
        if l_column_0 > 1 then
            v29[l_line_0] = {
                l_column_0, 
                1
            };
        else
            v29[l_line_0] = true;
        end;
    else
        v29[l_line_0] = {
            l_column_0, 
            l_column_1 - l_column_0
        };
    end;
    return {
        start = v26, 
        ["end"] = v27, 
        markerLines = v29
    };
end;
local function v73(v33, v34, v35)
    local v36 = v35 or {};
    local v37 = v9(v36);
    local v38 = {
        gutter = v37.grey, 
        marker = v37.red.bold, 
        message = v37.red.bold
    };
    local _ = function(_, v40)
        return v40;
    end;
    local v42 = v32(v34, l_String_0.split(v33, v13), v36);
    local l_start_0 = v42.start;
    local v44 = v42["end"];
    local l_markerLines_0 = v42.markerLines;
    local v46 = if not l_Boolean_0.toJSBoolean(v34.start) then v34.start else typeof(v34.start.column) == "number";
    local v47 = #tostring(v44);
    local v72 = l_Array_0.join(l_Array_0.map(l_Array_0.slice(l_String_0.split(v33, v13, v44), l_start_0, v44 + 1), function(v48, v49)
        local v50 = (l_start_0 + v49) - 1;
        local v51 = (" %s |"):format((string.sub((" %s"):format((tostring(v50))), -v47)));
        local v52 = l_markerLines_0[v50];
        local v53 = not l_Boolean_0.toJSBoolean(l_markerLines_0[v50 + 1]);
        if not l_Boolean_0.toJSBoolean(v52) then
            local v54 = " %s%s";
            local _ = v38.gutter;
            return v54:format(v51, if #v48 > 0 then (" %s"):format(v48) else "");
        else
            local v56 = "";
            if l_Array_0.isArray(v52) then
                local v57 = string.sub(v48, 1, (math.max(v52[1] - 1, 0))):gsub("[^\t]", " ");
                local v58 = if v52[2] > 1 then v52[2] else 1;
                local l_join_0 = l_Array_0.join;
                local v60 = {};
                local v61 = "\n ";
                local l_gutter_1 = v38.gutter;
                local v63 = ({
                    v51:gsub("%d", " ")
                })[1];
                l_gutter_1 = " ";
                local l_v57_0 = v57;
                local _ = v38.marker;
                ??? = ("^"):rep(v58);
                setlist { ['R011[1 to ???]'] = 'R012 to ???' };
                v56 = l_join_0(v60, "");
                if not (not v53 or not l_Boolean_0.toJSBoolean(v36.message)) then
                    l_join_0 = v56;
                    v60 = " ";
                    v63 = v38.message;
                    v56 = l_join_0 .. v60 .. v36.message;
                end;
            end;
            local l_join_1 = l_Array_0.join;
            local v67 = {};
            local l_marker_1 = v38.marker;
            local v69 = ">";
            local l_gutter_2 = v38.gutter;
            l_marker_1 = v51;
            l_gutter_2 = if #v48 > 0 then (" %s"):format(v48) else "";
            local l_v56_0 = v56;
            setlist { ['R009[1 to 4]'] = 'R010 to R013' };
            return l_join_1(v67, "");
        end;
    end), "\n");
    if not (not l_Boolean_0.toJSBoolean(v36.message) or v46) then
        v72 = ("%s%s\n%s"):format((" "):rep(v47 + 1), tostring(v36.message), v72);
    end;
    return v72;
end;
v8.codeFrameColumns = v73;
v8.default = function(v74, v75, v76, v77)
    if v77 == nil then
        v77 = {};
    end;
    if not v10 then
        v10 = true;
        l_Error_0.new("Passing lineNumber and colNumber is deprecated to @babel/code-frame. Please use `codeFrameColumns`.").name = "DeprecationWarning";
        l_console_0.warn(l_Error_0.new("Passing lineNumber and colNumber is deprecated to @babel/code-frame. Please use `codeFrameColumns`."));
    end;
    return v73(v74, {
        start = {
            column = math.max(v76 or 1, 1), 
            line = v75
        }
    }, v77);
end;
return v8;

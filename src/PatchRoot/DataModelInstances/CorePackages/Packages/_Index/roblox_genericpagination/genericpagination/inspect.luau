local v0 = {
    _VERSION = "inspect.lua 3.1.0", 
    _URL = "http://github.com/kikito/inspect.lua", 
    _DESCRIPTION = "human-readable representations of tables", 
    _LICENSE = "\t  MIT LICENSE\n\n\t  Copyright (c) 2013 Enrique Garc\195\173a Cota\n\n\t  Permission is hereby granted, free of charge, to any person obtaining a\n\t  copy of this software and associated documentation files (the\n\t  \"Software\"), to deal in the Software without restriction, including\n\t  without limitation the rights to use, copy, modify, merge, publish,\n\t  distribute, sublicense, and/or sell copies of the Software, and to\n\t  permit persons to whom the Software is furnished to do so, subject to\n\t  the following conditions:\n\n\t  The above copyright notice and this permission notice shall be included\n\t  in all copies or substantial portions of the Software.\n\n\t  THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS\n\t  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF\n\t  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.\n\t  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY\n\t  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,\n\t  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE\n\t  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n\t"
};
local l_tostring_0 = tostring;
v0.KEY = setmetatable({}, {
    __tostring = function()
        return "inspect.KEY";
    end
});
v0.METATABLE = setmetatable({}, {
    __tostring = function()
        return "inspect.METATABLE";
    end
});
local function _(v2)
    return next, v2, nil;
end;
local function _(v4)
    if not v4:match("\"") or v4:match("'") then
        return "\"" .. v4:gsub("\"", "\\\"") .. "\"";
    else
        return "'" .. v4 .. "'";
    end;
end;
local v6 = {
    ["\a"] = "\\a", 
    ["\b"] = "\\b", 
    ["\f"] = "\\f", 
    ["\n"] = "\\n", 
    ["\r"] = "\\r", 
    ["\t"] = "\\t", 
    ["\v"] = "\\v"
};
local v7 = {};
for v8 = 0, 31 do
    local v9 = string.char(v8);
    if not v6[v9] then
        v6[v9] = "\\" .. v8;
        v7[v9] = string.format("\\%03d", v8);
    end;
end;
local function _(v10)
    return (v10:gsub("\\", "\\\\"):gsub("(%c)%f[0-9]", v7):gsub("%c", v6));
end;
local function _(v12)
    local v13 = false;
    if type(v12) == "string" then
        v13 = v12:match("^[_%a][_%a%d]*$");
    end;
    return v13;
end;
local function _(v15, v16)
    local v17 = false;
    if type(v15) == "number" then
        v17 = false;
        if v15 >= 1 then
            v17 = false;
            if v15 <= v16 then
                v17 = math.floor(v15) == v15;
            end;
        end;
    end;
    return v17;
end;
local v19 = {
    number = 1, 
    boolean = 2, 
    string = 3, 
    table = 4, 
    ["function"] = 5, 
    userdata = 6, 
    thread = 7
};
local function v26(v20, v21)
    local v22 = type(v20);
    local v23 = type(v21);
    if v22 == v23 and (not (v22 ~= "string") or v22 == "number") then
        return v20 < v21;
    else
        local v24 = v19[v22];
        local v25 = v19[v23];
        if not v24 or not v25 then
            if not v24 then
                if not v25 then
                    return v22 < v23;
                else
                    return false;
                end;
            else
                return true;
            end;
        else
            return v19[v22] < v19[v23];
        end;
    end;
end;
local function _(v27)
    local v28 = 1;
    local v29 = rawget(v27, v28);
    while v29 ~= nil do
        v28 = v28 + 1;
        v29 = rawget(v27, v28);
    end;
    return v28 - 1;
end;
local function v40(v31)
    local v32 = {};
    local v33 = 0;
    local v34 = 1;
    local v35 = rawget(v31, v34);
    while v35 ~= nil do
        v34 = v34 + 1;
        v35 = rawget(v31, v34);
    end;
    local v36 = v34 - 1;
    for v37, _ in next, v31, nil do
        local v39 = false;
        if type(v37) == "number" then
            v39 = false;
            if v37 >= 1 then
                v39 = false;
                if v37 <= v36 then
                    v39 = math.floor(v37) == v37;
                end;
            end;
        end;
        if not v39 then
            v33 = v33 + 1;
            v32[v33] = v37;
        end;
    end;
    table.sort(v32, v26);
    return v32, v33, v36;
end;
local function v41(v42, v43)
    v43 = v43 or {};
    if type(v42) == "table" then
        if v43[v42] then
            v43[v42] = v43[v42] + 1;
        else
            v43[v42] = 1;
            for v44, v45 in next, v42, nil do
                v41(v44, v43);
                v41(v45, v43);
            end;
            v41(getmetatable(v42), v43);
            return v43;
        end;
    end;
    return v43;
end;
local function _(v46)
    local v47 = {};
    local v48 = #v46;
    for v49 = 1, v48 do
        v47[v49] = v46[v49];
    end;
    return v47, v48;
end;
local function v59(v51, ...)
    local v52 = {
        ...
    };
    local v53 = {};
    local v54 = #v51;
    for v55 = 1, v54 do
        v53[v55] = v51[v55];
    end;
    local l_v53_0 = v53;
    local l_v54_0 = v54;
    for v58 = 1, #v52 do
        l_v53_0[l_v54_0 + v58] = v52[v58];
    end;
    return l_v53_0;
end;
local function v60(v61, v62, v63, v64)
    if v62 == nil then
        return nil;
    elseif not v64[v62] then
        local v65 = v61(v62, v63);
        if type(v65) == "table" then
            local v66 = {};
            v64[v62] = v66;
            local v67 = nil;
            for v68, v69 in next, v65, nil do
                v67 = v60(v61, v68, v59(v63, v68, v0.KEY), v64);
                if v67 ~= nil then
                    v66[v67] = v60(v61, v69, v59(v63, v67), v64);
                end;
            end;
            local v70 = v60(v61, getmetatable(v65), v59(v63, v0.METATABLE), v64);
            if type(v70) ~= "table" then
                v70 = nil;
            end;
            setmetatable(v66, v70);
            v65 = v66;
        end;
        return v65;
    else
        return v64[v62];
    end;
end;
local v71 = {};
local v72 = {
    __index = v71
};
v71.puts = function(v73, ...)
    local v74 = {
        ...
    };
    local l_buffer_0 = v73.buffer;
    local v76 = #l_buffer_0;
    for v77 = 1, #v74 do
        v76 = v76 + 1;
        l_buffer_0[v76] = v74[v77];
    end;
end;
v71.down = function(v78, v79)
    v78.level = v78.level + 1;
    v79();
    v78.level = v78.level - 1;
end;
v71.tabify = function(v80)
    v80:puts(v80.newline, string.rep(v80.indent, v80.level));
end;
v71.alreadyVisited = function(v81, v82)
    return v81.ids[v82] ~= nil;
end;
v71.getId = function(v83, v84)
    local v85 = v83.ids[v84];
    if not v85 then
        local v86 = type(v84);
        v85 = (v83.maxIds[v86] or 0) + 1;
        v83.maxIds[v86] = v85;
        v83.ids[v84] = v85;
    end;
    return (l_tostring_0(v85));
end;
v71.putKey = function(v87, v88)
    local v89 = false;
    if type(v88) == "string" then
        v89 = v88:match("^[_%a][_%a%d]*$");
    end;
    if not v89 then
        v87:puts("[");
        v87:putValue(v88);
        v87:puts("]");
        return ;
    else
        return v87:puts(v88);
    end;
end;
v71.putTable = function(v90, v91)
    if not (v91 ~= v0.KEY) or v91 == v0.METATABLE then
        v90:puts((l_tostring_0(v91)));
        return ;
    elseif not v90:alreadyVisited(v91) then
        if v90.depth <= v90.level then
            v90:puts("{...}");
            return ;
        else
            if v90.tableAppearances[v91] > 1 then
                v90:puts("<", v90:getId(v91), ">");
            end;
            local v92, v93, v94 = v40(v91);
            local v95 = getmetatable(v91);
            v90:puts("{");
            v90:down(function()
                local v96 = 0;
                for v97 = 1, v94 do
                    if v96 > 0 then
                        v90:puts(",");
                    end;
                    v90:puts(" ");
                    v90:putValue(v91[v97]);
                    v96 = v96 + 1;
                end;
                for v98 = 1, v93 do
                    local v99 = v92[v98];
                    if v96 > 0 then
                        v90:puts(",");
                    end;
                    v90:tabify();
                    v90:putKey(v99);
                    v90:puts(" = ");
                    v90:putValue(v91[v99]);
                    v96 = v96 + 1;
                end;
                if type(v95) == "table" then
                    if v96 > 0 then
                        v90:puts(",");
                    end;
                    v90:tabify();
                    v90:puts("<metatable> = ");
                    v90:putValue(v95);
                end;
            end);
            if not (v93 <= 0) or type(v95) == "table" then
                v90:tabify();
            elseif v94 > 0 then
                v90:puts(" ");
            end;
            v90:puts("}");
            return ;
        end;
    else
        v90:puts("<table ", v90:getId(v91), ">");
        return ;
    end;
end;
v71.putValue = function(v100, v101)
    local v102 = type(v101);
    if v102 == "string" then
        local v103 = v101:gsub("\\", "\\\\"):gsub("(%c)%f[0-9]", v7):gsub("%c", v6);
        v100:puts(if not v103:match("\"") or v103:match("'") then "\"" .. v103:gsub("\"", "\\\"") .. "\"" else "'" .. v103 .. "'");
        return ;
    elseif not (((v102 ~= "number" and v102 ~= "boolean") and v102 ~= "nil") and v102 ~= "cdata") or v102 == "ctype" then
        v100:puts((l_tostring_0(v101)));
        return ;
    elseif v102 == "table" then
        v100:putTable(v101);
        return ;
    else
        v100:puts("<", v102, " ", v100:getId(v101), ">");
        return ;
    end;
end;
v0.inspect = function(v104, v105)
    v105 = v105 or {};
    local v106 = v105.depth or math.huge;
    local v107 = v105.newline or "\n";
    local v108 = v105.indent or "  ";
    local l_process_0 = v105.process;
    if l_process_0 then
        v104 = v60(l_process_0, v104, {}, {});
    end;
    local v110 = setmetatable({
        depth = v106, 
        level = 0, 
        buffer = {}, 
        ids = {}, 
        maxIds = {}, 
        newline = v107, 
        indent = v108, 
        tableAppearances = v41(v104)
    }, v72);
    v110:putValue(v104);
    return table.concat(v110.buffer);
end;
setmetatable(v0, {
    __call = function(_, ...)
        return v0.inspect(...);
    end
});
return v0;

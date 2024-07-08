local l_Parent_0 = script.Parent;
local l_Array_0 = require(l_Parent_0.Parent.LuauPolyfill).Array;
local v2 = require(l_Parent_0.CleanupSemantic);
local l_DIFF_DELETE_0 = v2.DIFF_DELETE;
local l_DIFF_EQUAL_0 = v2.DIFF_EQUAL;
local l_DIFF_INSERT_0 = v2.DIFF_INSERT;
local l_Diff_0 = v2.Diff;
local _ = require(l_Parent_0.types);
local function v13(v8, v9, v10)
    return l_Array_0.reduce(v9, function(v11, v12)
        if v12[1] == l_DIFF_EQUAL_0 then
            return v11 .. v12[2];
        elseif v12[1] == v8 and #v12[2] ~= 0 then
            return v11 .. v10(v12[2]);
        else
            return v11 .. "";
        end;
    end, "");
end;
local v14 = {};
v14.__index = v14;
v14.new = function(v15, v16)
    local v17 = setmetatable({}, v14);
    v17.op = v15;
    v17.line = {};
    v17.lines = {};
    v17.changeColor = v16;
    return v17;
end;
v14.pushSubstring = function(v18, v19)
    v18:pushDiff(l_Diff_0.new(v18.op, v19));
end;
v14.pushLine = function(v20)
    table.insert(v20.lines, if #v20.line ~= 1 then l_Diff_0.new(v20.op, v13(v20.op, v20.line, v20.changeColor)) else if v20.line[1][1] == v20.op then v20.line[1] else l_Diff_0.new(v20.op, v20.line[1][2]));
    v20.line = {};
end;
v14.isLineEmpty = function(v21)
    return #v21.line == 0;
end;
v14.pushDiff = function(v22, v23)
    table.insert(v22.line, v23);
end;
v14.align = function(v24, v25)
    local v26 = v25[2];
    if not v26:match("\n") then
        v24:pushDiff(v25);
        return ;
    else
        local v27 = v26:split("\n");
        local v28 = #v27;
        for v29, v30 in ipairs(v27) do
            if v29 < v28 then
                v24:pushSubstring(v30);
                v24:pushLine();
            elseif #v30 ~= 0 then
                v24:pushSubstring(v30);
            end;
        end;
        return ;
    end;
end;
v14.moveLinesTo = function(v31, v32)
    if not v31:isLineEmpty() then
        v31:pushLine();
    end;
    for _, v34 in ipairs(v31.lines) do
        table.insert(v32, v34);
    end;
    v31.lines = {};
end;
local v35 = {};
v35.__index = v35;
v35.new = function(v36, v37)
    local v38 = {
        deleteBuffer = v36, 
        insertBuffer = v37, 
        lines = {}
    };
    setmetatable(v38, v35);
    return v38;
end;
v35.pushDiffCommonLine = function(v39, v40)
    table.insert(v39.lines, v40);
end;
v35.pushDiffChangeLines = function(v41, v42)
    local v43 = #v42[2] == 0;
    if not (v43 and not v41.deleteBuffer:isLineEmpty()) then
        v41.deleteBuffer:pushDiff(v42);
    end;
    if not (v43 and not v41.insertBuffer:isLineEmpty()) then
        v41.insertBuffer:pushDiff(v42);
    end;
end;
v35.flushChangeLines = function(v44)
    v44.deleteBuffer:moveLinesTo(v44.lines);
    v44.insertBuffer:moveLinesTo(v44.lines);
end;
v35.align = function(v45, v46)
    local v47 = v46[1];
    local v48 = v46[2];
    if not v48:match("\n") then
        v45:pushDiffChangeLines(v46);
        return ;
    else
        local v49 = v48:split("\n");
        local v50 = #v49;
        for v51, v52 in ipairs(v49) do
            if v51 == 1 then
                local v53 = l_Diff_0.new(v47, v52);
                if not v45.deleteBuffer:isLineEmpty() or not v45.insertBuffer:isLineEmpty() then
                    v45:pushDiffChangeLines(v53);
                    v45:flushChangeLines();
                else
                    v45:flushChangeLines();
                    v45:pushDiffCommonLine(v53);
                end;
            elseif v51 < v50 then
                v45:pushDiffCommonLine(l_Diff_0.new(v47, v52));
            elseif #v52 ~= 0 then
                v45:pushDiffChangeLines(l_Diff_0.new(v47, v52));
            end;
        end;
        return ;
    end;
end;
v35.getLines = function(v54)
    v54:flushChangeLines();
    return v54.lines;
end;
return function(v55, v56)
    local v57 = v14.new(l_DIFF_DELETE_0, v56);
    local v58 = v14.new(l_DIFF_INSERT_0, v56);
    local v59 = v35.new(v57, v58);
    for _, v61 in ipairs(v55) do
        local v62 = v61[1];
        if v62 == l_DIFF_DELETE_0 then
            v57:align(v61);
        elseif v62 == l_DIFF_INSERT_0 then
            v58:align(v61);
        else
            v59:align(v61);
        end;
    end;
    return v59:getLines();
end;

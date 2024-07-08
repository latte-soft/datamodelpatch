local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.LuauPolyfill);
local v3 = require(l_Parent_1.DiffSequences);
local v4 = require(l_Parent_0.CleanupSemantic);
local l_DIFF_DELETE_0 = v4.DIFF_DELETE;
local l_DIFF_EQUAL_0 = v4.DIFF_EQUAL;
local l_DIFF_INSERT_0 = v4.DIFF_INSERT;
local l_Diff_0 = v4.Diff;
return function(v9, v10)
    local function v13(v11, v12)
        return v9:sub(v11 + 1, v11 + 1) == v10:sub(v12 + 1, v12 + 1);
    end;
    local v14 = 0;
    local v15 = 0;
    local v16 = {};
    v3(#v9, #v10, v13, function(v17, v18, v19)
        if v14 ~= v18 then
            table.insert(v16, l_Diff_0.new(l_DIFF_DELETE_0, v9:sub(v14 + 1, v18)));
        end;
        if v15 ~= v19 then
            table.insert(v16, l_Diff_0.new(l_DIFF_INSERT_0, v10:sub(v15 + 1, v19)));
        end;
        v14 = v18 + v17;
        v15 = v19 + v17;
        table.insert(v16, l_Diff_0.new(l_DIFF_EQUAL_0, v10:sub(v19 + 1, v15)));
    end);
    if v14 ~= #v9 then
        table.insert(v16, l_Diff_0.new(l_DIFF_DELETE_0, v9:sub(v14 + 1)));
    end;
    if v15 ~= #v10 then
        table.insert(v16, l_Diff_0.new(l_DIFF_INSERT_0, v10:sub(v15 + 1)));
    end;
    return v16;
end;

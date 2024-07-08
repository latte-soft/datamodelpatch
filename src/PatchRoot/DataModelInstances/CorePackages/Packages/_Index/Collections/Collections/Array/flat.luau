local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v3 = require(l_Parent_0.isArray);
local _ = require(l_Parent_1.ES7Types);
local function v5(v6, v7)
    if l___DEV___0 then
        if typeof(v6) ~= "table" then
            error(string.format("Array.flat called on %s", (typeof(v6))));
        end;
        if v7 ~= nil and typeof(v7) ~= "number" then
            error("depth is not a number or nil");
        end;
    end;
    local v8 = v7 or 1;
    local v9 = {};
    for _, v11 in v6, nil, nil do
        if not v3(v11) then
            table.insert(v9, v11);
        else
            local v12 = if v8 > 1 then v5(v11, v8 - 1) else v11;
            for _, v14 in v12, nil, nil do
                table.insert(v9, v14);
            end;
        end;
    end;
    return v9;
end;
return v5;

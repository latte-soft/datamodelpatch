local _ = require(script.Parent.Parent.Parent.Parent.LuauPolyfill);
local v1 = {};
local function v2()
    return {};
end;
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5)
    local l_v4_0 = v4;
    local l_v5_0 = v5;
    if l_v4_0 == nil then
        l_v4_0 = true;
    end;
    if l_v5_0 == nil then
        l_v5_0 = v2;
    end;
    local v8 = setmetatable({}, v3);
    v8.weakness = l_v4_0;
    v8.makeData = l_v5_0;
    return v8;
end;
v3.lookup = function(v9, ...)
    return v9:lookupArray({
        ...
    });
end;
v3.lookupArray = function(v10, v11)
    local l_v10_0 = v10;
    for _, v14 in v11, nil, nil do
        l_v10_0 = l_v10_0:getChildTrie(v14);
    end;
    if not l_v10_0.data then
        l_v10_0.data = v10.makeData(table.clone(v11));
    end;
    return l_v10_0.data;
end;
v3.getChildTrie = function(v15, v16)
    local v17 = nil;
    if not v15.weakness then
        if v15.strong == nil then
            v15.strong = {};
        end;
        v17 = v15.strong;
    else
        if v15.weak == nil then
            v15.weak = setmetatable({}, {
                __mode = "k"
            });
        end;
        v17 = v15.weak;
    end;
    local v18 = v17[v16];
    if not v18 then
        v18 = v3.new(v15.weakness, v15.makeData);
        v17[v16] = v18;
    end;
    return v18;
end;
v1.Trie = v3;
return v1;

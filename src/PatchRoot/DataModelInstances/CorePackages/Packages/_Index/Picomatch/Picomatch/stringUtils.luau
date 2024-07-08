local l_Parent_0 = script.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local _ = require(l_Parent_0.RegExp);
return {
    stringReplace = function(v3, v4, v5)
        local v6 = v4:exec(v3);
        local v7 = 0;
        local v8 = {};
        while v6 ~= nil and v6.index ~= nil do
            local v9 = v6[1];
            local v10 = l_Array_0.slice(v6, 1, v6.n + 1);
            local v11 = v6.index + v7;
            table.insert(v10, v11);
            table.insert(v8, {
                from = v11, 
                length = #v9, 
                value = v5(table.unpack(v10))
            });
            v7 = v7 + ((#v9 + v6.index) - 1);
            v6 = v4:exec((v3:sub(v7 + 1)));
        end;
        local v12 = v3:sub(1);
        for _, v14 in ipairs(l_Array_0.reverse(v8)) do
            local l_from_0 = v14.from;
            v12 = v12:sub(1, l_from_0 - 1) .. v14.value .. v12:sub(l_from_0 + v14.length);
        end;
        return v12;
    end
};

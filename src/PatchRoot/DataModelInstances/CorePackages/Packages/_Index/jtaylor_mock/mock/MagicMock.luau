local v0 = require(script.Parent.symbols);
local v1 = require(script.Parent.Spy);
local v2 = {};
local v16 = {
    __index = function(v3, v4)
        local v5 = getmetatable(v3);
        local v6 = v5[v0.Children][v4];
        if v6 == nil then
            v6 = v2.new();
            v5[v0.Children][v4] = v6;
            return v6;
        elseif v6 == v0.None then
            return nil;
        else
            return v6;
        end;
    end, 
    __newindex = function(v7, v8, v9)
        local v10 = getmetatable(v7);
        if type(v9) == "function" then
            local _, v12 = v1.new(v9);
            v9 = v12;
        elseif v9 == nil then
            v9 = v0.None;
        end;
        if v8 == v0.ReturnValue then
            v10[v0.ReturnValue] = {
                v9; 
                n = 1
            };
            return ;
        else
            v10[v0.Children][v8] = v9;
            return ;
        end;
    end, 
    __call = function(v13, ...)
        local v14 = getmetatable(v13);
        local v15 = {
            args = table.pack(...), 
            result = v14[v0.ReturnValue]
        };
        if v15.result == nil then
            v15.result = {
                v2.new(); 
                n = 1
            };
            v14[v0.ReturnValue] = v15.result;
        elseif v15.result == v0.None then
            v15.result = {
                n = 1
            };
        end;
        table.insert(v14[v0.Calls], v15);
        return table.unpack(v15.result);
    end
};
v2.new = function(v17)
    local v18 = {
        [v0.Calls] = {}, 
        [v0.Children] = {}, 
        [v0.Lock] = v17, 
        [v0.ReturnValue] = nil
    };
    for v19, v20 in pairs(v16) do
        v18[v19] = v20;
    end;
    return (setmetatable({}, v18));
end;
return v2;

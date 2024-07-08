local v4 = {
    events = {}, 
    merge = function(...)
        if select("#", ...) == 1 then
            return (...);
        else
            local v0 = {};
            for v1 = 1, select("#", ...) do
                for v2, v3 in pairs(select(v1, ...)) do
                    if type(v2) == "number" then
                        table.insert(v0, v3);
                    else
                        v0[v2] = v3;
                    end;
                end;
            end;
            return v0;
        end;
    end
};
v4.new = function(v5)
    return function(...)
        local v6 = v4.merge(...);
        local v7 = Instance.new(v5);
        for v8, v9 in pairs(v6) do
            if type(v8) == "string" then
                assert(v8 ~= "Parent", "Don't set 'Parent' using Create");
                v7[v8] = v9;
            elseif type(v8) == "table" and v8 == v4.events then
                for v10, v11 in pairs(v9) do
                    v7[v10]:Connect(v11);
                end;
            end;
        end;
        for _, v13 in ipairs(v6) do
            v13.Parent = v7;
        end;
        return v7;
    end;
end;
setmetatable(v4, {
    __call = function(_, ...)
        return v4.new(...);
    end
});
return v4;

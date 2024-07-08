local v0 = require(script.Parent.Parent.Roact);
return function()
    local v1 = {};
    setmetatable(v1, {
        __index = function(_, v3)
            local v4 = v0.createRef();
            v1[v3] = v4;
            return v4;
        end, 
        __tostring = function(v5)
            local v6 = "{";
            for v7, v8 in pairs(v5) do
                v6 = ("%s\n\t%s -> %s"):format(v6, tostring(v7), (tostring(v8)));
            end;
            return v6 .. "\n}";
        end
    });
    return v1;
end;

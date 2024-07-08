local _ = require(script.Parent.Parent.Parent.LuauPolyfill);
return {
    printPathArray = function(v1)
        local v2 = {};
        for v3 = 1, #v1 do
            local v4 = v1[v3];
            v2[v3] = typeof(v4) == "number" and "[" .. tostring(v4) .. "]" or "." .. v4;
        end;
        return table.concat(v2, "");
    end
};

local _ = require(script.Parent.Types);
return function(v1)
    return function(v2)
        local v3 = v1[v2];
        assert(v3, "Invalid eventName used: " .. tostring(v2) .. " called");
        return v3;
    end;
end;

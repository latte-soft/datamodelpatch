local _ = require(script.Parent.Parent.Types);
return function(v1)
    return function(v2, v3)
        local v4 = v1[v2];
        assert(v4, "Invalid eventName used: " .. tostring(v2) .. " called");
        return v4, v3;
    end;
end;

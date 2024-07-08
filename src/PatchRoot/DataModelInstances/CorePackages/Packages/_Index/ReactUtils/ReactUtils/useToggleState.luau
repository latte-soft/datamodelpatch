local v0 = require(script:FindFirstAncestor("ReactUtils").Parent.React);
return function(v1)
    local v2, v3 = v0.useState(v1);
    return {
        enabled = v2, 
        enable = v0.useCallback(function()
            v3(true);
        end, {}), 
        disable = v0.useCallback(function()
            v3(false);
        end, {})
    };
end;

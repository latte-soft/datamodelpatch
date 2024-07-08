local v0 = require(script:FindFirstAncestor("ReactUtils").Parent.React);
return function(v1, v2, v3)
    local v4 = v0.useMemo(function()
        return v2;
    end, v3);
    v0.useEffect(function()
        local v5 = v1:Connect(v4);
        return function()
            v5:Disconnect();
        end;
    end, {
        v1, 
        v4
    });
end;

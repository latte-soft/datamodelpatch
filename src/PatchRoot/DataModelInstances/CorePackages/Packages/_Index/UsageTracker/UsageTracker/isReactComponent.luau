local v0 = require(script:FindFirstAncestor("UsageTracker").Parent.ReactIs);
return function(v1)
    local l_status_0, l_result_0 = pcall(v0.isValidElementType, v1);
    if not (not l_status_0 or not l_result_0) then
        if typeof(v1) == "function" then
            local v4, v5 = debug.info(v1, "a");
            local v6 = string.sub(debug.info(v1, "n"), 1, 3) == "use";
            if not ((not (v4 == 1) or v5) or v6) then
                return true;
            end;
        elseif typeof(v1) == "table" then
            return true;
        end;
    end;
    return false;
end;

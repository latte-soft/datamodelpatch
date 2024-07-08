local v0 = {};
v0.__index = v0;
v0.new = function()
    return (setmetatable({
        passed = true, 
        reasons = {}
    }, v0));
end;
v0.updateReasons = function(v1, v2, v3)
    if not v2 then
        table.insert(v1.reasons, table.concat(v3, "\n"));
        v1.passed = false;
        return ;
    else
        return ;
    end;
end;
v0.getFinalResults = function(v4)
    if not v4.passed then
        return false, v4.reasons;
    else
        return true;
    end;
end;
return v0;

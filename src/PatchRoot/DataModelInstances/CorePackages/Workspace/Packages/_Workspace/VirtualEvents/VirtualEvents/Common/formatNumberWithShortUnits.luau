return function(v0)
    local v1 = math.abs(v0);
    local v2 = nil;
    v2 = if v1 >= 1000000000 then ("%.0fB"):format((math.floor(v0 / 1000000000))) else if v1 >= 1000000 then if v1 >= 100000000 then ("%.0fM"):format((math.floor(v0 / 1000000))) else ("%.1fM"):format(v0 / 1000000) else if v1 >= 1000 then if v1 >= 100000 then ("%.0fK"):format((math.floor(v0 / 1000))) else ("%.1fK"):format(v0 / 1000) else tostring(v0);
    local v3, v4 = v2:match("(%d+)%.0(%w+)");
    if not (not v3 or not v4) then
        v2 = v3 .. v4;
    end;
    return v2;
end;

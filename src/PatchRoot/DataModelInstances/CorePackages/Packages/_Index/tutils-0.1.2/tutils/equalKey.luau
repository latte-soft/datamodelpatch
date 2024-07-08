return function(v0, v1, v2)
    if not ((not (not ((not v0 or not v1) or not v2) and v2 ~= "") or not v0[v2]) or not v1[v2]) and v0[v2] == v1[v2] then
        return true;
    else
        return false;
    end;
end;

reverse = function(v0)
    local v1 = #v0;
    local v2 = 1;
    while v2 < v1 do
        local v3 = v0[v1];
        local v4 = v0[v2];
        v0[v2] = v3;
        v0[v1] = v4;
        v2 = v2 + 1;
        v1 = v1 - 1;
    end;
    return v0;
end;
return reverse;

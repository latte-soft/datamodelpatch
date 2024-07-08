return function(v0, v1)
    local l_v0_0 = v0;
    for _, v4 in ipairs(v1:split(".")) do
        if l_v0_0[v4] then
            l_v0_0 = l_v0_0[v4];
        else
            return nil;
        end;
    end;
    return l_v0_0;
end;

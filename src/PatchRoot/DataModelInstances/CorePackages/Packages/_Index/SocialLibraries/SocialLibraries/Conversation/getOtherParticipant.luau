return function(v0, v1)
    local l_LocalUserId_0 = v0.LocalUserId;
    for _, v4 in ipairs(v1) do
        if v4 ~= l_LocalUserId_0 then
            return v4;
        end;
    end;
end;

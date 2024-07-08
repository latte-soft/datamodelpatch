return function(v0, v1)
    for _, v3 in pairs(v1.participants) do
        if v0 == v3 then
            return true;
        end;
    end;
    return false;
end;

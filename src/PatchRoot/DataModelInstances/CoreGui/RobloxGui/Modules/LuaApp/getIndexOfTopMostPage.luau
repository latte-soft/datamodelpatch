return function(v0, v1)
    local v2 = v1[#v1];
    if v2 then
        for v3 = #v2, 1, -1 do
            if v2[v3].name == v0 then
                return v3;
            end;
        end;
        return ;
    else
        return ;
    end;
end;

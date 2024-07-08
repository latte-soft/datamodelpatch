return function(v0, v1)
    local l_Name_0 = v0.Name;
    local l_v0_0 = v0;
    while l_v0_0.Parent and l_v0_0 ~= v1 do
        l_v0_0 = l_v0_0.Parent;
        l_Name_0 = l_v0_0.Name .. "/" .. l_Name_0;
    end;
    if v1 ~= nil then
        return l_Name_0;
    else
        return "/" .. l_Name_0;
    end;
end;

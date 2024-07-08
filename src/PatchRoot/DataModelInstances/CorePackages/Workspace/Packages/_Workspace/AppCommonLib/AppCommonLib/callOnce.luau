local l_MemStorageService_0 = game:GetService("MemStorageService");
return function(v1, v2)
    if v2 == nil then
        return ;
    elseif not l_MemStorageService_0:HasItem(v1) then
        l_MemStorageService_0:SetItem(v1, "true");
        v2();
        return ;
    else
        return ;
    end;
end;

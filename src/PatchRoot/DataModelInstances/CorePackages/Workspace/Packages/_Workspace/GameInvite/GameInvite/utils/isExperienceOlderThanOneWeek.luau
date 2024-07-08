local l_Workspace_0 = game:GetService("Workspace");
return function(v1)
    if v1 ~= nil and v1.Created ~= nil then
        local v2 = DateTime.fromIsoDate(v1.Created);
        if v2 and l_Workspace_0:GetServerTimeNow() * 1000 - v2.UnixTimestampMillis > 604800000 then
            return true;
        end;
    end;
    return false;
end;

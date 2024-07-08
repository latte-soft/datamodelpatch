local l_Players_0 = game:GetService("Players");
return function(v1)
    local l_LocalPlayer_0 = (v1 or l_Players_0).LocalPlayer;
    if not l_LocalPlayer_0 then
        return nil;
    else
        return (tostring(l_LocalPlayer_0.UserId));
    end;
end;

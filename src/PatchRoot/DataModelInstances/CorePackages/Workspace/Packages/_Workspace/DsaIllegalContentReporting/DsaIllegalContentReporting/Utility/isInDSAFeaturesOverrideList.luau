local l_Players_0 = game:GetService("Players");
game:DefineFastString("DSAReportingAndTransparencyOverrideUserIds", "");
isInDSAFeaturesOverrideList = function(v1)
    local v2 = 0;
    if v1 ~= nil then
        v2 = v1;
    else
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        while not l_LocalPlayer_0 do
            l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        end;
        if l_LocalPlayer_0 then
            v2 = l_LocalPlayer_0.UserId;
        end;
    end;
    for v4 in game:GetFastString("DSAReportingAndTransparencyOverrideUserIds"):gmatch("%d+") do
        if tonumber(v4) == v2 then
            return true;
        end;
    end;
    return false;
end;
return isInDSAFeaturesOverrideList;

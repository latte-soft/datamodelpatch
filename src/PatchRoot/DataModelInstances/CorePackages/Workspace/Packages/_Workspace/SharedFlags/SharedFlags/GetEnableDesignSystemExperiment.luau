local l_Players_0 = game:GetService("Players");
game:DefineFastString("DesignSystemExperimentUserList", "");
return function()
    local l_status_0, l_result_0 = pcall(function()
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_0 then
            for v2 in game:GetFastString("DesignSystemExperimentUserList"):gmatch("%d+") do
                if tonumber(v2) == l_LocalPlayer_0.UserId then
                    return true;
                end;
            end;
        end;
        return false;
    end);
    if not l_status_0 then
        return false;
    else
        return l_result_0;
    end;
end;

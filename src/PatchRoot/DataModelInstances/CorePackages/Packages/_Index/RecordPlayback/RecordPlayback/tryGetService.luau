return function(v0)
    local l_status_0, l_result_0 = pcall(function()
        return game:GetService(v0);
    end);
    if not l_status_0 then
        return nil;
    else
        return l_result_0;
    end;
end;

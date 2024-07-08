return function(v0)
    local l_status_0, l_result_0 = pcall(function()
        return game:GetEngineFeature(v0);
    end);
    return l_status_0 and l_result_0;
end;

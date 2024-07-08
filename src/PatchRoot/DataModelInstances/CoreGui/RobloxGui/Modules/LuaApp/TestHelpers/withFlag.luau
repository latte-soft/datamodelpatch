return function(v0, v1)
    local v2 = game:SetFastFlagForTesting(v0, true);
    local l_status_0, l_result_0 = pcall(v1);
    game:SetFastFlagForTesting(v0, v2);
    assert(l_status_0, (tostring(l_result_0)));
end;

return function(v0, v1, v2)
    local v3 = game:SetFastIntForTesting(v0, v1);
    local l_status_0, l_result_0 = pcall(v2);
    game:SetFastIntForTesting(v0, v3);
    assert(l_status_0, (tostring(l_result_0)));
end;

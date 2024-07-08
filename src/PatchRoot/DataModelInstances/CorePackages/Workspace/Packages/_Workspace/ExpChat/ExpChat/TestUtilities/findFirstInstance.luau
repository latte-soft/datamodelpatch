local function _(v0, v1)
    local l_status_0, l_result_0 = pcall(function()
        return v0[v1];
    end);
    if l_status_0 == true then
        return l_result_0;
    else
        return nil;
    end;
end;
local function v11(v5, v6)
    for v7, v8 in pairs(v6) do
        local l_status_1, l_result_1 = pcall(function()
            return v5[v7];
        end);
        if if l_status_1 == true then l_result_1 else nil ~= v8 then
            return false;
        end;
    end;
    return true;
end;
return function(v12, v13)
    for _, v15 in ipairs(v12:GetDescendants()) do
        if v11(v15, v13) then
            return v15;
        end;
    end;
    return nil;
end;

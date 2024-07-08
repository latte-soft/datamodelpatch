local function _()
    return game:GetService("RunService"):IsStudio();
end;
local v1 = game:GetService("RunService"):IsStudio();
return function(v2, v3, v4)
    local l_v1_0 = v1;
    if v4 ~= nil then
        l_v1_0 = v4;
    end;
    local l_status_0, l_result_0 = pcall(function()
        return v2();
    end);
    if not l_status_0 then
        if not l_v1_0 then
            local v8 = "safeCall failed";
            pcall(function()
                v8 = tostring(l_result_0);
            end);
            warn(v8);
            return v3;
        else
            assert(l_status_0, l_result_0);
            return ;
        end;
    else
        return l_result_0;
    end;
end;

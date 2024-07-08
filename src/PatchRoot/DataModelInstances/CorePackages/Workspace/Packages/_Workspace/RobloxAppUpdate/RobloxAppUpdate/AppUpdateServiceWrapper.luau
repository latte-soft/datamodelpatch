local v0 = require(script:FindFirstAncestor("RobloxAppUpdate").Parent.Promise);
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    local v3 = {
        _appUpdate = v2
    };
    setmetatable(v3, v1);
    return v3;
end;
v1.checkForUpdate = function(v4)
    return v0.new(function(v5, _)
        local l_status_0, l_result_0 = pcall(function()
            v4._appUpdate:CheckForUpdate(function(v7)
                v5({
                    appUpdateStatus = v7
                });
            end);
        end);
        if not l_status_0 then
            v5({
                errorMessage = l_result_0
            });
        end;
    end);
end;
v1.performManagedUpdate = function(v10)
    v10._appUpdate:PerformManagedUpdate();
end;
v1.canPerformBinaryUpdate = function(v11)
    return v11._appUpdate:CanPerformBinaryUpdate();
end;
return v1;

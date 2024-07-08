local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local l_GetFFlagMigrateRoactUtilsToReactUtils_0 = require(l_Parent_0.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils;
local v2 = require(l_Parent_0.ReactUtils);
if not l_GetFFlagMigrateRoactUtilsToReactUtils_0() then
    local v3 = require(l_Parent_0.React);
    local v4 = require(script.Parent.dependencyArray);
    return function(v5, v6)
        v3.useEffect(function()
            local v7 = v5:Connect(v6);
            return function()
                v7:Disconnect();
            end;
        end, v4(v5, v6));
    end;
else
    return v2.useEventConnection;
end;

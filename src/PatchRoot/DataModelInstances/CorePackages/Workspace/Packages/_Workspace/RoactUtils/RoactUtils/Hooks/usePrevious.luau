local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local l_GetFFlagMigrateRoactUtilsToReactUtils_0 = require(l_Parent_0.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils;
local v2 = require(l_Parent_0.ReactUtils);
if not l_GetFFlagMigrateRoactUtilsToReactUtils_0() then
    local v3 = require(l_Parent_0.React);
    return function(v4)
        local v5 = v3.useRef(nil);
        v3.useEffect(function()
            v5.current = v4;
        end);
        return v5.current;
    end;
else
    return v2.usePrevious;
end;

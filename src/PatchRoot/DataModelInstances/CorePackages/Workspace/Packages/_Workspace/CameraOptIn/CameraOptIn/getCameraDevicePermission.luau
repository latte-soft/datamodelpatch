local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Promise);
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v4 = nil;
return function()
    local v5 = if v4 ~= nil then v4:getStatus() else nil;
    if v4 and v5 ~= v1.Status.Cancelled then
        return v4;
    else
        v4 = l_default_0:hasPermissions({
            l_default_0.Permissions.CAMERA_ACCESS
        }):andThen(function(v6)
            if v6.status == l_default_0.Status.AUTHORIZED then
                return v1.resolve(true);
            else
                return l_default_0:requestPermissions({
                    l_default_0.Permissions.CAMERA_ACCESS
                }):andThen(function(v7)
                    return v1.resolve(v7.status == l_default_0.Status.AUTHORIZED);
                end, function(v8)
                    return v1.reject(v8);
                end);
            end;
        end);
        return v4;
    end;
end;

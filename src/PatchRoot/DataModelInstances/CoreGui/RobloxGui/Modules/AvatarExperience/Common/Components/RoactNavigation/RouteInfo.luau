local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v4 = require(l_CorePackages_0.tutils);
local v5 = require(l_CorePackages_0.Packages.t);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v7 = {};
v7.__index = v7;
v7.Interface = v5.strictInterface({
    name = v5.string, 
    key = v5.string, 
    params = v5.table
});
v7.new = function(v8, v9, v10)
    local v11 = {
        name = v8, 
        key = v9, 
        params = v10 or {}
    };
    setmetatable(v11, v7);
    return v11;
end;
v7.EMPTY = v7.new(v3.None, v3.None);
v7.__tostring = function(v12)
    return string.format("%s(key=%s)", v12.name, (tostring(v12.key)));
end;
v7.__eq = function(v13, v14)
    if not rawequal(v13, v14) then
        local v15 = false;
        if v13.key == v14.key then
            v15 = false;
            if v13.name == v14.name then
                v15 = v4.shallowEqual(v13.params, v14.params, nil);
            end;
        end;
        return v15;
    else
        return true;
    end;
end;
return v7;

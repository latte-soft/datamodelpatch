local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = {};
local v4 = v2.interface({
    bundleId = v2.number, 
    userOutfitId = v2.number
});
v3.new = function()
    return {
        bundleId = "", 
        userOutfitId = ""
    };
end;
v3.mock = function()
    local v5 = v3.new();
    v5.bundleId = "23452";
    v5.userOutfitId = "65234";
    return v5;
end;
v3.fromData = function(v6)
    local v7 = v3.new();
    local v8, v9 = v4(v6);
    if not v8 then
        v1.assert(false, v9);
        return v7;
    else
        v7.bundleId = tostring(v6.bundleId);
        v7.userOutfitId = tostring(v6.userOutfitId);
        return v7;
    end;
end;
return v3;

local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v2 = require(l_CorePackages_0.Logging);
return {
    globalGetter = nil, 
    globalSetter = nil, 
    new = function(v3, v4)
        v1.isType(v4.globalGetter, "function", "globalGetter");
        v1.isType(v4.globalSetter, "function", "globalSetter");
        local v5 = {
            globalGetter = v4.globalGetter, 
            globalSetter = v4.globalSetter
        };
        setmetatable(v5, v3);
        v3.__index = v3;
        return v5;
    end, 
    isLockedOut = function(v6)
        v1.isType(v6.globalGetter, "function", "globalGetter");
        return v6.globalGetter("ScreenTime.lockedOut") == "true";
    end, 
    setLockedOut = function(v7)
        v2.warn("Utils" .. " setLockedOut");
        v1.isType(v7.globalSetter, "function", "globalSetter");
        v7.globalSetter("ScreenTime.lockedOut", "true");
    end
};

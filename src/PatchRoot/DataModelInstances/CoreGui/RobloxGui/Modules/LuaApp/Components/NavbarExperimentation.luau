local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("Players");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Util.ExperimentCacheManager);
local v5 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local _ = require(l_Modules_0.Common.memoize);
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local v8 = {};
v8.__index = v8;
v8.new = function()
    local v9 = {
        _isInitialized = false, 
        _variant = 0, 
        _hasVariant = false
    };
    setmetatable(v9, v8);
    return v9;
end;
v8.isEnabled = function()
    return game:DefineFastFlag("EnableNavbarLabelExperiment2", false);
end;
v8.getVariants = function(v10)
    local v11 = v4.default:getLayerVariables(v5.BottomBarNavLayer);
    if v11 ~= nil then
        local v12 = tonumber(v11.navbarVariant);
        if not (not v11.navbarVariant or not v12) then
            v10._variant = v12;
            v10._hasVariant = true;
            return ;
        end;
    else
        v10._hasVariant = false;
    end;
end;
v8.initialize = function(v13, _)
    v13:getVariants();
    v13._isInitialized = true;
end;
v8.isInitialized = function(v15)
    return v15._isInitialized;
end;
v8.hasVariant = function(v16)
    return v16._hasVariant;
end;
v8.shouldShowNavbarLabels = function(v17)
    if v17._hasVariant then
        if v17._variant == 1 then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v8.default = v8.new();
return v8;

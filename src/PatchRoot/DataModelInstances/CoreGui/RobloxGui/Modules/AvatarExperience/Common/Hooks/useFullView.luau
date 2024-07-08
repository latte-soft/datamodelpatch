local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useRouteName_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useRouteName;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v7 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v8 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v10 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullView);
local v11 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
return function()
    local v12 = l_useRouteName_0();
    local v14 = l_useSelector_0((v3.useCallback(function(v13)
        return v10(v13, v12);
    end, {
        v12
    })));
    local v15 = v7(v8);
    local v16 = l_useDispatch_0();
    return v14, (v3.useCallback(function(v17)
        v16(v11(v15, v12, v17));
    end, {
        v15, 
        v12, 
        v16
    }));
end;

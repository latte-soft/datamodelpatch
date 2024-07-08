local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Packages.Dash);
local v4 = require(l_Modules_0.LuaApp.TestHelpers.MockAvatarEditorService);
local v5 = require(l_Modules_0.AvatarExperience.Common.Managers.PageObjectManager);
local v6 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXUseRoduxExtraArg);
return function(v7)
    if not v6 then
        return v2.thunkMiddleware;
    else
        return v2.makeThunkMiddleware((v3.join({
            avatarEditorService = v4.new(), 
            pageObjectManager = v5.new()
        }, v7 or {})));
    end;
end;

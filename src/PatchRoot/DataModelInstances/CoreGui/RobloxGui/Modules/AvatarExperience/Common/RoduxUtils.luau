local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.AvatarEditorServiceThunk);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.PaginatedFetchThunk);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v8 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXUseRoduxExtraArg);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.Managers.PageObjectManager);
return {
    convertPaginatedFetchThunk = function(v11, v12)
        if not v8 then
            return v6.new(v11, v12);
        else
            return function(v13, v14)
                return v12(v13, v14.pageObjectManager, v14.avatarEditorService);
            end;
        end;
    end, 
    convertAvatarEditorServiceThunk = function(v15, v16)
        if not v8 then
            return v5.new(v15, v16);
        else
            return function(v17, v18)
                return v16(v17, v18.avatarEditorService);
            end;
        end;
    end
};

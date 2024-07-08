local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.AppPage);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreenProperties);
local v5 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v6, v7, v8)
    local v9 = v4[v6];
    local v10 = v9 and v9.isTransparent;
    return function(v11)
        return v11:dispatch(v5({
            name = not not v10 and v3.AvatarExperienceWrapperTransparent or v3.AvatarExperienceWrapper, 
            detail = v7, 
            extraProps = {
                routeName = v6, 
                params = v2.Dictionary.join(v8 or {}, {
                    detail = v7
                })
            }
        }));
    end;
end;

local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDown);
local v3 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local v4 = require(l_CorePackages_0.Packages.Dash);
local v5 = require(l_script_FirstAncestor_0.LuaApp.Thunks.ResetNavigationHistory);
local v6 = require(l_script_FirstAncestor_0.LuaApp.Util.startNewPeekViewHistory);
local l_FFlagProfilePlatformDevFlag_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagProfilePlatformDevFlag;
return function(v8, v9)
    return function(v10)
        if not l_FFlagProfilePlatformDevFlag_0 then
            if not v9 or not v9.resetPeekView then
                v10:dispatch(v2({
                    name = v3.ProfilePeekView, 
                    detail = v8, 
                    extraProps = v9
                }));
                return ;
            else
                local v11 = v6(v10, {
                    name = v3.ProfilePeekView, 
                    detail = v8, 
                    extraProps = v4.join(v9, {
                        resetPeekView = v4.None
                    })
                });
                v10:dispatch(v5(v11.newRoute, v11.newHistory));
                return ;
            end;
        else
            v10:dispatch(v2({
                name = v3.ProfilePlatform, 
                detail = v8, 
                extraProps = v9
            }));
            return ;
        end;
    end;
end;

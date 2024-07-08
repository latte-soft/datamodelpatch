local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Logging);
local _ = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v5 = require(l_Modules_0.LuaApp.Thunks.Moderation.ApiFetchModerationDetails);
local v6 = require(l_Modules_0.LuaApp.Actions.Moderation.SetModerationStatus);
local v7 = require(l_Modules_0.LuaApp.Thunks.Moderation.DetectModeratedUser);
return function(v8, v9)
    return function(v10)
        local l_Moderation_0 = v10:getState().Moderation;
        if not (not not l_Moderation_0 and (l_Moderation_0.userModerated or false)) then
            if v7(v9) then
                v3.warn("The user is moderated.");
                v10:dispatch(v6(true));
                v10:dispatch(v5(v8));
            end;
            return ;
        else
            return ;
        end;
    end;
end;

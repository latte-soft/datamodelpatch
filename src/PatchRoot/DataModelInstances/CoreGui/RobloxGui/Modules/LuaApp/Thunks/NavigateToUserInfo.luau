local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForPeopleList);
local v3 = require(l_Modules_0.LuaApp.Thunks.OpenProfilePeekView);
local l_UserModel_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Models.UserModel;
local v5 = require(l_Modules_0.Profile.Analytics.ProfileAnalytics);
local l_FFlagLuaAppConsolidateProfileLogging_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppConsolidateProfileLogging;
local function v11(v7, v8)
    local v9 = not not v7 and v7.Users[v8] or {};
    local v10 = false;
    if v9.presence == l_UserModel_0.PresenceType.IN_GAME then
        v10 = v9.lastLocation;
    end;
    return v10;
end;
return function(v12, v13)
    return function(v14)
        local v15 = v14:getState();
        local l_LocalUserId_0 = v15.LocalUserId;
        local v17 = v13.userInGame or v11;
        if (not v13.openJoinable or not v13.contextualMenuProps) or not v17(v15, v12) then
            if not (l_FFlagLuaAppConsolidateProfileLogging_0 or not v13.entryPoint) then
                v5.new({
                    localUserId = l_LocalUserId_0, 
                    profileUserId = v12, 
                    analyticsProps = v13.profilePeekViewProps and v13.profilePeekViewProps.analyticsProps
                }):navigateToProfile(v13.entryPoint);
            end;
            v14:dispatch(v3(v12, v13.profilePeekViewProps));
            return ;
        else
            v14:dispatch(v2(v13.contextualMenuProps));
            return ;
        end;
    end;
end;

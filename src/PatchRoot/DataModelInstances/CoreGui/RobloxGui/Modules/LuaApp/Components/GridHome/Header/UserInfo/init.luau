local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_UrlBuilder_0 = require(l_CorePackages_0.Packages.UrlBuilder).UrlBuilder;
local v5 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v6 = require(l_Modules_0.LuaApp.AppPage);
local v7 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v8 = require(l_Modules_0.LuaApp.Thunks.NavigateToUserInfo);
local v9 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v10 = require(l_Modules_0.Profile.Flags.ProfileIXPTest);
local _ = require(l_Modules_0.LuaApp.Common.safeGet);
local v12 = require(l_Modules_0.LuaApp.Common.wrapComponent);
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.Constants;
local v15 = require(l_Modules_0.LuaApp.Components.GridHome.Flags.GetFFlagVerifiedBadgeOnDUARHomePageHeaderBarName);
return (v12(function(v16, v17)
    if not v17.isSearching then
        return v2.createElement(v16, v17);
    else
        return nil;
    end;
end)((v5.connectUserLayer({
    v9.SocialProfileLayer
}, function(v18, _)
    return {
        luaProfileEnabled = v10.experimentOrRolloutEnabled(v18)
    };
end)((v3.connect(function(v20)
    local v21 = v20.Users[v20.LocalUserId];
    if not v21 then
        return {};
    else
        return {
            displayName = v21.displayName or v21.name, 
            thumbnail = l_getRbxthumbWithTypeSizeAndOptions_0(v20.LocalUserId, l_Constants_0.RbxthumbTypes.AvatarHeadShot, 150), 
            isPremium = v21.membership == Enum.MembershipType.Premium, 
            isVerified = not not v15() and v21.hasVerifiedBadge, 
            localUserId = v20.LocalUserId
        };
    end;
end, function(v22)
    return {
        openProfile = function()
            v22(v7({
                name = v6.ViewProfile, 
                detail = l_UrlBuilder_0.static.profile()
            }));
        end, 
        openLuaProfile = function(v23, v24)
            v22(v8(v23, v24));
        end
    };
end)((require(script.NameBadge))))))));

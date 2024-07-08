local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v5 = require(l_Modules_0.LuaApp.Actions.AddUser);
local v6 = require(l_Modules_0.LuaApp.Actions.SetLocalUserId);
local v7 = require(l_Modules_0.LuaApp.Actions.SetUserMembershipType);
local v8 = require(l_Modules_0.LuaApp.Models.User);
local v9 = require(l_Modules_0.LuaApp.Actions.SetLocalUserUnder13);
local v10 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
return function()
    return function(v11)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        local v13 = tostring(l_LocalPlayer_0.UserId);
        v11:dispatch(v5((v8.fromDataTable({
            id = v13, 
            name = l_LocalPlayer_0.Name, 
            displayName = l_LocalPlayer_0.displayName, 
            isFriend = false, 
            hasVerifiedBadge = v10.isPlayerVerified(l_LocalPlayer_0)
        }))));
        v11:dispatch(v6(v13));
        v11:dispatch(v7(v13, l_LocalPlayer_0.MembershipType));
        v11:dispatch(v9(l_LocalPlayer_0:GetUnder13()));
    end;
end;

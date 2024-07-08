local l_CorePackages_0 = game:GetService("CorePackages");
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v2 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v5 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v6 = require(l_Modules_0.LuaApp.Thunks.OpenVerifiedBadgeModal);
local v7 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v8 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v9 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForGameDetailMore);
local v10 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForGameDetailsPlayWithFriends);
local v11 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForExperienceGuidelines);
local l_GetFFlagAddExperienceGuidelinesToActionBar10ft_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAddExperienceGuidelinesToActionBar10ft;
return function()
    local v13 = l_useDispatch_0();
    return (v2.useMemo(function()
        return {
            navigateBack = function()
                return v13(v4());
            end, 
            openLeaveRobloxAlertUIBlox = function(v14)
                v13(v7(v14));
            end, 
            openMoreContextualMenu = function(v15, v16, v17)
                v13(v9(v15, nil, v16, 300, nil, v17));
            end, 
            openShareContextualMenu = function(v18, v19)
                v13(v10(v18, nil, v19, 300));
            end, 
            closeAlert = function()
                v13(v8());
            end, 
            openVerifiedBadgeModal = function()
                v13(v6());
            end, 
            openCreatorPage = function(v20)
                v13(v5(v20));
            end, 
            openExperienceGuidelinesExplained = if not l_GetFFlagAddExperienceGuidelinesToActionBar10ft_0() then nil else function(v21, v22)
                v13(v11(v21, v22));
            end
        };
    end, {
        v13
    }));
end;

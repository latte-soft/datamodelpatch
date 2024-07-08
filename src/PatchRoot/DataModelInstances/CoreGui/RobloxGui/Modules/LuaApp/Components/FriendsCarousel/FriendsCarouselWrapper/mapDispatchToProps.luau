local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v1 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenCentralOverlayForPlayerContextualMenu);
local v2 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateToUserInfo);
local v3 = require(script.Parent.Parent.utils.formatUser);
local v4 = require(l_script_FirstAncestor_0.LuaApp.Actions.SetCurrentToastMessage);
local v5 = require(l_script_FirstAncestor_0.Profile.Analytics.EntryPoints);
return function(v6)
    return {
        openProfilePeekView = function(v7, v8)
            v8.contextualMenuProps.user = v3(v8.contextualMenuProps.user);
            v8.entryPoint = v5.HomePageFriendsCarousel;
            v6(v2(v7, v8));
        end, 
        openPlayerContextualMenu = function(v9)
            v6(v1(v9));
        end, 
        showToast = function(v10)
            v6(v4({
                toastMessage = v10
            }));
        end
    };
end;

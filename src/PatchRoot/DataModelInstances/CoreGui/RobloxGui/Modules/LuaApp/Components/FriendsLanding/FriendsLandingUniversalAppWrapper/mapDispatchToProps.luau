local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local _ = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateBack);
local v3 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDownToFriendRequests);
local v4 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenProfilePeekView);
local v5 = require(l_script_FirstAncestor_0.LuaApp.Components.AmpUpsell.OpenAmpWizardContainer);
local v6 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateToUserInfo);
local v7 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenContactImporterLearnMoreLink);
local _ = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenPhoneVerificationWebview);
local v9 = require(l_script_FirstAncestor_0.LuaApp.Thunks.OpenCentralOverlayForPlayerContextualMenu);
local v10 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDownTo3DQRCodePage);
return function(v11)
    return {
        navigateBackInAppRoute = function()
            v11(v2());
        end, 
        navigateDownToFriendRequests = function()
            v11(v3());
        end, 
        openProfilePeekView = function(v12, v13)
            assert(type(v12) == "string", "Expected userId to be a string");
            v11(v4(v12, v13));
        end, 
        openPlayerContextualMenu = function(v14)
            v11(v9(v14));
        end, 
        navigateToUserInfo = function(v15, v16)
            assert(type(v15) == "string", "Expected userId to be a string");
            v11(v6(v15, v16));
        end, 
        openLearnMoreLink = function()
            v11(v7());
        end, 
        navigateTo3DQRCodePage = function(v17)
            v11(v10(v17));
        end, 
        openAmpWizardContainer = function(v18, v19)
            v11(v5(v18, v19));
        end
    };
end;

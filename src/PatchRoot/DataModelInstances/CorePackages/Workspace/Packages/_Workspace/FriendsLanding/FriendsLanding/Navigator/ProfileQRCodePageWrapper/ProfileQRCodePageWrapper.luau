local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_llama_0 = v1.llama;
local l_ProfileQRCode_0 = v1.ProfileQRCode;
local l_Contexts_0 = v1.SocialLuaAnalytics.Analytics.Enums.Contexts;
local v6 = require(l_script_FirstAncestor_0.FriendsLandingContext);
return function(v7)
    return l_Roact_0.createElement(l_ProfileQRCode_0.ProfileQRCodeEntryPoint, l_llama_0.Dictionary.join(v7, {
        onClose = function()
            v7.navigation.goBack();
        end, 
        source = l_Contexts_0.AddFriends, 
        robloxEventReceiver = v6.useContext().robloxEventReceiver
    }));
end;

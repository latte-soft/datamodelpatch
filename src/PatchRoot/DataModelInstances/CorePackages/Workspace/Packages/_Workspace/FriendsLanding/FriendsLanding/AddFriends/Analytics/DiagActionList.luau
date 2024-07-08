local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(script.Parent.EventNames);
local _ = require(l_script_FirstAncestor_0.Parent.SocialLuaAnalytics);
return {
    [v1.OpenUserSearch] = {
        name = game:DefineFastString("AddFriendsPageOpenUserSearch", "AddFriendsPageOpenUserSearch")
    }, 
    [v1.PageLoad] = {
        name = game:DefineFastString("AddFriendsUserLoadedPage", "AddFriendsUserLoadedPage")
    }
};

local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v2 = require(script.Parent.ButtonClickEvents);
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local v4 = require(l_AddFriends_0.dependencies);
local l_Contexts_0 = v4.SocialLuaAnalytics.Analytics.Enums.Contexts;
local l_FormFactor_0 = v4.FormFactor;
return function(v7, v8)
    local v9 = v8 and v8.formFactor;
    v7:navigate(v3.SearchFriends);
    v7:buttonClick(v2.PeopleSearchBar, {
        contextOverride = l_Contexts_0.PeopleSearchFromAddFriends, 
        formFactor = v9 or l_FormFactor_0.UNKNOWN
    });
end;

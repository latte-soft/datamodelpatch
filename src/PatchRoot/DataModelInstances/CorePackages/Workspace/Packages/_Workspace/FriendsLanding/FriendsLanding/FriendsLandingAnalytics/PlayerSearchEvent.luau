local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_AddFriends_0 = l_script_FirstAncestor_0.AddFriends;
local v2 = require(l_script_FirstAncestor_0.EnumScreens);
local l_Contexts_0 = require(l_AddFriends_0.dependencies).SocialLuaAnalytics.Analytics.Enums.Contexts;
return function(v4, v5, v6)
    local v7 = nil;
    if not v6 or not v6.source then
        local v8 = v6 and v6.currentRoute;
        v7 = if v8 == v2.AddFriends then l_Contexts_0.AddFriends else if v8 == v2.FriendsLanding then l_Contexts_0.FriendsLanding else if v8 == v2.SearchFriends then l_Contexts_0.PlayerSearch else "Unknown";
    else
        v7 = v6.source;
    end;
    v4:playerSearch(v5, not not v6 and v6.kwd or nil, v7);
end;

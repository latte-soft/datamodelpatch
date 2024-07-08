local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_User_0 = l_SocialLibraries_0.User;
local l_llama_0 = v1.llama;
local l_RoduxPresence_0 = v1.RoduxPresence;
local v6 = require(script.Parent.mapIdToUser);
local _ = require(l_Parent_0.Common.LocalTypes);
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
return function(v9, v10, v11)
    local v12 = tostring(v9.LocalUserId);
    return l_llama_0.List.sort(l_llama_0.List.map(l_getDeepValue_0(v9, string.format("%s.Friends.byUserId.%s", v10, v12)) or {}, function(v13)
        return l_llama_0.Dictionary.join(v6(v9, v10, v11)(v13), l_RoduxPresence_0.Selectors.getUserPresenceByUserId(v9, v13), {
            isFriendWithUser = true, 
            friendRank = l_getDeepValue_0(v9, string.format("%s.Friends.friendsRankByUserId.%s.%s", v10, v12, v13))
        });
    end), l_User_0.sortFriendsByCorrectedPresenceAndRank);
end;

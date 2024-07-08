local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Common.LocalTypes);
local l_RecommendationContextType_0 = require(l_Parent_0.dependencies).RoduxFriends.Enums.RecommendationContextType;
local v3 = require(l_Parent_0.Common.TextKeys);
return function(v4)
    local v5 = nil;
    local v6 = nil;
    local v7 = nil;
    local v8 = nil;
    local v9 = not not v4.mutualFriendsList and #v4.mutualFriendsList or 0;
    if v4.contextType == l_RecommendationContextType_0.MutualFriends and v9 > 0 then
        v8 = function(v10)
            return tostring(v9) .. " " .. v10;
        end;
        v6 = if v9 == 1 then v3.SingularMutualFriend else v3.MutualFriends;
        v5 = {
            path = "icons/status/player/friend"
        };
    elseif v4.contextType == l_RecommendationContextType_0.Frequents then
        v6 = v3.PlayedTogether;
    else
        v7 = "";
    end;
    return v5, {
        formatter = v8, 
        text = v7, 
        textKey = v6
    };
end;

local v0 = require(script:FindFirstAncestor("SocialReducerAdaptors").dependencies);
local l_Players_0 = v0.Players;
local l_llama_0 = v0.llama;
return function(v3, v4)
    local function v6(v5)
        return v3.Actions.FriendshipCreated(v5.id, v4 or tostring(l_Players_0.LocalPlayer.UserId));
    end;
    return {
        AddUser = function(v7)
            if not v7.user.isFriend then
                return {
                    v7
                };
            else
                return {
                    v6(v7.user)
                };
            end;
        end, 
        AddUsers = function(v8)
            return l_llama_0.Dictionary.values(l_llama_0.Dictionary.map(v8.users, function(v9, _)
                if not v9.isFriend then
                    return nil;
                else
                    return v6(v9);
                end;
            end));
        end, 
        SetFriendRequestsCount = function(v11)
            return {
                v3.Actions.RequestReceivedCountUpdated(v11.count)
            };
        end
    };
end;

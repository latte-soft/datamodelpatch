local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v3 = require(script.Parent.useRelationshipSelector);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local _ = require(l_Parent_0.GraphQLServer);
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local v7 = require(l_Parent_0.SocialCommon);
local l_useMutualFriendsText_0 = v7.Hooks.useMutualFriendsText;
local l_ContextualInfoTypes_0 = v7.Enums.ContextualInfoTypes;
local v10 = l_Images_0["icons/status/player/friend"];
local v11 = l_Images_0["icons/status/player/following"];
local function _(v12, v13)
    if not v12 or #v12 == 0 then
        return false;
    else
        for v14 = 1, #v12 do
            if v12[v14] == v13 then
                return true;
            end;
        end;
        return false;
    end;
end;
return function(v16)
    local v17 = v3(v16.userId);
    local v18 = l_useLocalization_0({
        youAreFriends = "Feature.PlayerSearchResults.Label.YouAreFriends", 
        youAreFollowing = "Feature.PlayerSearchResults.Label.YouAreFollowing", 
        previously = "Feature.PlayerSearchResults.Label.Previously", 
        thisIsYou = "Feature.PlayerSearchResults.Label.ThisIsYou", 
        frequents = "Feature.Friends.Label.Frequent"
    });
    local l_profileInsight_0 = v16.profileInsight;
    local v20 = (not not l_profileInsight_0 and l_profileInsight_0.mutualFriends) and #l_profileInsight_0.mutualFriends or 0;
    local v21 = l_useMutualFriendsText_0(v20);
    if not v17.isMyself then
        local l_previousUsernames_0 = v16.previousUsernames;
        local l_searchKeyword_0 = v16.searchKeyword;
        local v24;
        if not l_previousUsernames_0 or #l_previousUsernames_0 == 0 then
            v24 = false;
        else
            for v25 = 1, #l_previousUsernames_0 do
                if l_previousUsernames_0[v25] == l_searchKeyword_0 then
                    v24 = true;
                    goto label0 --[[  true, false  ]];
                end;
            end;
            v24 = false;
        end;
        ::label0::;
        if not v24 then
            if v17.status == Enum.FriendStatus.Friend then
                return {
                    text = v18.youAreFriends, 
                    icon = v10
                }, l_ContextualInfoTypes_0.Friend;
            elseif v17.following == true then
                return {
                    text = v18.youAreFollowing, 
                    icon = v11
                }, l_ContextualInfoTypes_0.Following;
            else
                if l_profileInsight_0 then
                    if v20 > 0 then
                        return {
                            text = v21, 
                            icon = v10
                        }, l_ContextualInfoTypes_0.MutualFriends;
                    elseif l_profileInsight_0.isOfflineFrequents then
                        return {
                            text = v18.frequents
                        }, l_ContextualInfoTypes_0.Frequents;
                    end;
                end;
                return nil, nil;
            end;
        else
            return {
                text = v18.previously .. " @" .. v16.searchKeyword
            }, l_ContextualInfoTypes_0.PreviousUsername;
        end;
    else
        return {
            text = v18.thisIsYou
        }, l_ContextualInfoTypes_0.IsMyself;
    end;
end;

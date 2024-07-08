local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_RoduxFriends_0 = v2.RoduxFriends;
local l_Players_0 = v2.Players;
local l_llama_0 = v2.llama;
local v6 = require(script.Parent.transformOmniRecommendationsToActions);
local _ = require(l_script_FirstAncestor_0.Common.OmniTypes);
local v8 = require(l_script_FirstAncestor_0.Common.Constants);
local l_RecommendationContextType_0 = l_RoduxFriends_0.Enums.RecommendationContextType;
local l_SocialCommon_0 = v2.SocialCommon;
local l_RecommendationSourceEnum_0 = l_SocialCommon_0.Enums.RecommendationSourceEnum;
local l_ContextualInfoTypes_0 = l_SocialCommon_0.Enums.ContextualInfoTypes;
local l_FFlagContactRecs_0 = require(l_Parent_0.SharedFlags).FFlagContactRecs;
local function _(v14)
    local v15 = l_RecommendationContextType_0.fromRawValue(v14);
    return v15 and v15 ~= l_RecommendationContextType_0.None;
end;
local function v23(v17, v18, v19)
    local v20 = l_RecommendationContextType_0.fromRawValue(v17.contextType);
    local v21 = if not (v20 and v20 ~= l_RecommendationContextType_0.None) then v19.contextType else v17.contextType;
    local v22 = not not v19.mutualFriendsCount and tonumber(v19.mutualFriendsCount) or 0;
    if v21 == l_RecommendationContextType_0.MutualFriends.rawValue() and v22 == 0 then
        v21 = l_RecommendationContextType_0.None.rawValue();
    end;
    return {
        id = if not not l_FFlagContactRecs_0 and v21 == l_ContextualInfoTypes_0.Contacts then v17.ContactId else tostring(v17.userId), 
        contextType = v21, 
        mutualFriendsList = v17.mutualFriendDisplayName, 
        rank = if not v19.rank then v18 else tonumber(v19.rank), 
        mutualFriendsCount = v22, 
        hasIncomingFriendRequest = v19.hasPendingFriendRequest == v8.BE_TRUE_VALUE, 
        thumbnailEntities = if not l_FFlagContactRecs_0 then nil else if not not l_FFlagContactRecs_0 and v21 == l_ContextualInfoTypes_0.Contacts then {
            avatarImageUrl = v17.AvatarThumbnailUrl, 
            headshotImageUrl = v17.HeadshotThumbnailUrl
        } else nil, 
        contactId = if not l_FFlagContactRecs_0 then nil else v17.ContactId, 
        displayName = if not l_FFlagContactRecs_0 then nil else v17.ContactName
    };
end;
local function v28(v24, v25, v26)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    assert(l_LocalPlayer_0, "LocalPlayer must be non-nil");
    return l_RoduxFriends_0.Actions.RecommendationCreated({
        baseUserId = tostring(l_LocalPlayer_0.UserId), 
        recommendedUser = v23(v24, v25, v26)
    });
end;
local function v31(_, v30)
    return l_RoduxFriends_0.Actions.RecommendationSourceCreated({
        source = l_RecommendationSourceEnum_0.HomepagePYMKCarousel, 
        recommendationIds = l_llama_0.Dictionary.keys(v30 or {})
    });
end;
return function(v32)
    return {
        AddContentMetadata = function(v33)
            return {
                v33
            };
        end, 
        AddOmniRecommendations = function(v34)
            return v6(v34.recommendations or {}, v32, v28, v31);
        end
    };
end;

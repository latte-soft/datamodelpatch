local v0 = require(script:FindFirstAncestor("SocialTab").dependencies);
local l_llama_0 = v0.llama;
local l_t_0 = v0.t;
local l_RoduxPresence_0 = v0.RoduxPresence;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v0.getStandardSizeAvatarHeadShotRbxthumb;
return function(v5, _)
    return function(v7)
        assert(l_t_0.string(v7));
        if not v5.SocialTab.Users.byUserId[v7] then
            return nil;
        else
            return l_llama_0.Dictionary.join(v5.SocialTab.Users.byUserId[v7], l_RoduxPresence_0.Selectors.getUserPresenceByUserId(v5, v7), {
                thumbnail = l_getStandardSizeAvatarHeadShotRbxthumb_0(v7), 
                isPremium = v5.SocialTab.PremiumByUserId[v7] or false, 
                hasVerifiedBadge = if not not v5.VerifiedBadges and v5.VerifiedBadges.VerifiedUsers then v5.VerifiedBadges.VerifiedUsers[v7] or false else nil
            });
        end;
    end;
end;

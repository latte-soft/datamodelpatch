local v0 = require(script.constants);
return {
    EmojiWrapper = require(script.Components.EmojiWrapper), 
    AboutVerifiedBadgeModal = require(script.Components.AboutVerifiedBadgeModal), 
    installReducer = require(script.installReducer), 
    emoji = {
        verified = v0.VERIFIED_EMOJI, 
        premium = v0.PREMIUM_EMOJI
    }, 
    appendVerifiedBadge = require(script.Utils.appendVerifiedBadge), 
    appendPremiumBadge = require(script.Utils.appendPremiumBadge), 
    isCreatorOfGameVerified = require(script.Utils.isCreatorOfGameVerified), 
    isPlayerVerified = require(script.Utils.isPlayerVerified)
};

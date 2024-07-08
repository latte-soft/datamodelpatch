return function(v0)
    local function _()
        return string.find(v0.fromString("corp:")(), "qq.com");
    end;
    return {
        catalog = v0.fromString("www:catalog"), 
        buildersClub = v0.fromString("www:mobile-app-upgrades/native-ios/bc"), 
        trades = v0.fromString("www:trades"), 
        profile = v0.fromString("www:users/profile"), 
        friends = v0.fromString("www:users/friends"), 
        groups = v0.fromString("www:my/groups"), 
        inventory = v0.fromString("www:users/inventory"), 
        messages = v0.fromString("www:my/messages"), 
        feed = v0.fromString("www:feeds/inapp"), 
        develop = v0.fromString("www:develop"), 
        creatorHub = v0.fromString("create:"), 
        blog = v0.fromString("blog:"), 
        giftCards = v0.fromString("www:giftcards"), 
        amazonStore = v0.fromString("https://www.amazon.com/roblox"), 
        help = v0.fromString(not string.find(v0.fromString("corp:")(), "qq.com") and "www:help" or "corp:faq"), 
        appealsPortal = {
            main = v0.fromString("www:report-appeals?t_source={source|app}"), 
            violation = v0.fromString("www:report-appeals?vid={id}&t_source={source|app}")
        }, 
        email = {
            getSetEmail = v0.fromString("accountSettings:v1/email"), 
            sendVerificationEmail = v0.fromString("accountSettings:v1/email/verify")
        }, 
        about = {
            us = v0.fromString("corp:"), 
            careers = v0.fromString(not string.find(v0.fromString("corp:")(), "qq.com") and "corp:careers" or "corp:careers.html"), 
            parents = v0.fromString("corp:parents"), 
            terms = function(v2)
                if not string.find(v0.fromString("corp:")(), "qq.com") or not v2.useGameQQUrls then
                    return v0.fromString("www:info/terms")();
                else
                    return v0.fromString("https://game.qq.com/contract.shtml")();
                end;
            end, 
            privacy = function(v3)
                if not string.find(v0.fromString("corp:")(), "qq.com") or not v3.useGameQQUrls then
                    return v0.fromString("www:info/privacy")();
                else
                    return v0.fromString("https://game.qq.com/privacy_guide.shtml")();
                end;
            end, 
            guidelines = v0.fromString("www:info/community-guidelines"), 
            support = v0.fromString("www:support")
        }, 
        settings = {
            account = v0.fromString("www:my/account#/info"), 
            security = v0.fromString("www:my/account#/security"), 
            privacy = v0.fromString("www:my/account#/privacy"), 
            parentalControls = v0.fromString("www:my/account#/parental-controls"), 
            billing = v0.fromString("www:my/account#/billing"), 
            subscriptions = v0.fromString("www:my/account#/subscriptions"), 
            notifications = v0.fromString("www:my/account#/notifications")
        }, 
        tencent = {
            childrenPrivacyGuide = v0.fromString("https://game.qq.com/privacy_guide_children.shtml"), 
            luobuRiderTerms = v0.fromString("https://roblox.qq.com/web201904/newsdetail.html?newsid=12429812"), 
            reputationInfo = v0.fromString("https://gamecredit.qq.com/static/games/index.htm"), 
            luobuThirdPartyDataUse = v0.fromString("https://game.qq.com/zlkdatasys/privacy_SDK.html")
        }, 
        idVerification = {
            verify = v0.fromString("www:id-verification/verify"), 
            getAge = v0.fromString("apis:age-verification-service/v1/age-verification/get-verified-age")
        }, 
        notifications = {
            clearUnread = v0.fromString("notifications:stream-notifications/clear-unread"), 
            unreadCount = v0.fromString("notifications:stream-notifications/unread-count")
        }
    };
end;

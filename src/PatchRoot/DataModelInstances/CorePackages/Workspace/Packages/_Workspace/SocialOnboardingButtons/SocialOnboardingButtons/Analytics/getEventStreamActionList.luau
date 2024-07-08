local l_EventTypes_0 = require(script:FindFirstAncestor("SocialOnboardingButtons").Parent.SocialLuaAnalytics).Analytics.Enums.EventTypes;
local v1 = require(script.Parent.EventNames);
local v2 = require(script.Parent.BtnValues);
return function(v3)
    return {
        [v1.AddFriendsBtn] = {
            context = v3, 
            eventType = l_EventTypes_0.ButtonClick, 
            additionalInfo = {
                btn = v2.AddFriends
            }
        }, 
        [v1.FindContactsBtn] = {
            context = v3, 
            eventType = l_EventTypes_0.ButtonClick, 
            additionalInfo = {
                btn = v2.FindContacts
            }
        }, 
        [v1.MyQRCodeBtn] = {
            context = v3, 
            eventType = l_EventTypes_0.ButtonClick, 
            additionalInfo = {
                btn = v2.MyQRCode
            }
        }, 
        [v1.SearchPeopleBtn] = {
            context = v3, 
            eventType = l_EventTypes_0.ButtonClick, 
            additionalInfo = {
                btn = v2.SearchPeople
            }
        }, 
        [v1.UnlockVoiceBtn] = {
            context = v3, 
            eventType = l_EventTypes_0.ButtonClick, 
            additionalInfo = {
                btn = v2.UnlockVoice
            }
        }, 
        [v1.MyProfileBtn] = {
            context = v3, 
            eventType = l_EventTypes_0.ButtonClick, 
            additionalInfo = {
                btn = v2.MyProfile
            }
        }
    };
end;

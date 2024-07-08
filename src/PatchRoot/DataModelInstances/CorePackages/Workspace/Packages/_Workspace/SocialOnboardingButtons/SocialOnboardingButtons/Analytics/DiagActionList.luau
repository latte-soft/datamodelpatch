local l_DiagEventTypes_0 = require(script:FindFirstAncestor("SocialOnboardingButtons").Parent.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes;
local v1 = require(script.Parent.EventNames);
return {
    [v1.AddFriendsBtn] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("AddFriendsBtnCounter", "AddFriendsBtnCounter")
    }, 
    [v1.FindContactsBtn] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("FindContactsBtnCounter", "FindContactsBtnCounter")
    }, 
    [v1.MyQRCodeBtn] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("MyQRCodeBtnCounter", "MyQRCodeBtnCounter")
    }, 
    [v1.SearchPeopleBtn] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("SearchPeopleBtnCounter", "SearchPeopleBtnCounter")
    }, 
    [v1.UnlockVoiceBtn] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("UnlockVoiceBtnCounter", "UnlockVoiceBtnCounter")
    }, 
    [v1.MyProfileBtn] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("MyProfileBtnCounter", "MyProfileBtnCounter")
    }
};

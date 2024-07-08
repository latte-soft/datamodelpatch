local l_DiagEventTypes_0 = require(script:FindFirstAncestor("ContactsToast").Parent.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes;
local v1 = require(script.Parent.EventNames);
return {
    [v1.ContactsToastSeen] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ContactsToastSeen", "ContactsToastSeen")
    }, 
    [v1.ContactsToastDismissed] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ContactsToastDismissed", "ContactsToastDismissed")
    }, 
    [v1.ContactsToastButtonPressed] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("ContactsToastButtonPressed", "ContactsToastButtonPressed")
    }
};

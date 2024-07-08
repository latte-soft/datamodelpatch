local l_Parent_0 = script:FindFirstAncestor("ContactsToast").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local v2 = require(script.Parent.EventNames);
local l_Enums_0 = v1.Analytics.Enums;
local v4 = require(script.Parent.BtnValues);
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v7 = require(l_Parent_0.Dash);
return {
    [v2.ContactsToastSeen] = {
        context = l_Contexts_0.ContactsToast, 
        eventType = l_EventTypes_0.UserSeen, 
        formatRulesForAdditionalInfo = {
            variant = v7.identity
        }
    }, 
    [v2.ContactsToastDismissed] = {
        context = l_Contexts_0.ContactsToast, 
        eventType = l_EventTypes_0.Dismissed, 
        formatRulesForAdditionalInfo = {
            variant = v7.identity
        }
    }, 
    [v2.ContactsToastButtonPressed] = {
        context = l_Contexts_0.ContactsToast, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v4.FindFriendsButton
        }, 
        formatRulesForAdditionalInfo = {
            variant = v7.identity
        }
    }
};

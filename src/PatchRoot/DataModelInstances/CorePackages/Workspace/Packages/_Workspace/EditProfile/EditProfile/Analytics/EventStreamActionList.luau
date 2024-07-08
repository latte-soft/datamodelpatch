local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local l_Enums_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v6 = require(l_script_FirstAncestor_0.Common.Constants);
local v7 = require(script.Parent.Enums.EventNames);
local v8 = require(script.Parent.Enums.BtnValues);
return {
    [v7.EditProfileOpened] = {
        context = l_Contexts_0.EditProfile, 
        eventType = l_EventTypes_0.PageLoad, 
        additionalInfo = {
            page = v6.EditProfilePage
        }
    }, 
    [v7.DisplayNameSaved] = {
        context = l_Contexts_0.EditProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v8.SaveDisplayName
        }, 
        formatRulesForAdditionalInfo = {
            displayName = v2.identity
        }
    }, 
    [v7.DisplayNameModalOpened] = {
        context = l_Contexts_0.EditProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v8.OpenEditDisplayName
        }
    }, 
    [v7.DisplayNameModalLoaded] = {
        context = l_Contexts_0.EditProfile, 
        eventType = l_EventTypes_0.PageLoad, 
        additionalInfo = {
            page = v6.EditDisplayNameModal
        }
    }, 
    [v7.EditUsernameOpened] = {
        context = l_Contexts_0.EditProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v8.OpenEditUsername
        }
    }, 
    [v7.UsernameSaved] = {
        context = l_Contexts_0.EditProfile, 
        eventType = l_EventTypes_0.UsernameSaved
    }, 
    [v7.FilteredDisplayName] = {
        context = l_Contexts_0.EditProfile, 
        eventType = l_EventTypes_0.FilteredDisplayName, 
        formatRulesForAdditionalInfo = {
            displayName = v2.identity
        }
    }, 
    [v7.DisplayNameTooShort] = {
        context = l_Contexts_0.EditProfile, 
        eventType = l_EventTypes_0.DisplayNameTooShort, 
        formatRulesForAdditionalInfo = {
            displayName = v2.identity
        }
    }, 
    [v7.DescriptionPINBlocked] = {
        context = l_Contexts_0.EditProfile, 
        eventType = l_EventTypes_0.DescriptionPINBlocked
    }, 
    [v7.OpenAvatarMarketplace] = {
        context = l_Contexts_0.EditProfile, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v8.OpenAvatarMarketplace
        }
    }
};

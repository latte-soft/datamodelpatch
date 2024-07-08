local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Dash_0 = require(l_Parent_0.dependencies).Dash;
local l_Enums_0 = require(l_Parent_1.SocialLuaAnalytics).Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v6 = require(script.Parent.Enums.EventNames);
local v7 = require(script.Parent.Enums.BtnValues);
return {
    [v6.CustomizeNameModalOpened] = {
        context = l_Contexts_0.CustomizeName, 
        eventType = l_EventTypes_0.PageLoad, 
        formatRulesForAdditionalInfo = {
            origin = l_Dash_0.identity
        }
    }, 
    [v6.CustomizeNameClearedInput] = {
        context = l_Contexts_0.CustomizeName, 
        eventType = l_EventTypes_0.CustomizeNameClearedInput, 
        formatRulesForAdditionalInfo = {
            origin = l_Dash_0.identity
        }
    }, 
    [v6.CustomizeNameMaximumCharLimitTyped] = {
        context = l_Contexts_0.CustomizeName, 
        eventType = l_EventTypes_0.CustomizeNameMaximumCharLimitTyped, 
        formatRulesForAdditionalInfo = {
            alias = l_Dash_0.identity, 
            origin = l_Dash_0.identity
        }
    }, 
    [v6.CustomizeNameModalClosed] = {
        context = l_Contexts_0.CustomizeName, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v7.CloseCustomizeName
        }, 
        formatRulesForAdditionalInfo = {
            origin = l_Dash_0.identity
        }
    }, 
    [v6.CustomizeNameSaved] = {
        context = l_Contexts_0.CustomizeName, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v7.SaveAlias
        }, 
        formatRulesForAdditionalInfo = {
            alias = l_Dash_0.identity, 
            origin = l_Dash_0.identity
        }
    }, 
    [v6.CustomizeNameSaveAttemptInvalidInput] = {
        context = l_Contexts_0.CustomizeName, 
        eventType = l_EventTypes_0.CustomizeNameSaveAttemptInvalidInput, 
        formatRulesForAdditionalInfo = {
            alias = l_Dash_0.identity, 
            origin = l_Dash_0.identity
        }
    }
};

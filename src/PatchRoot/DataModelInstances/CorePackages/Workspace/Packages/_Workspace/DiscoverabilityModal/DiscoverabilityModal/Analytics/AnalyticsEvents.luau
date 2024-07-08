local v0 = require(script.Parent.Parent.dependencies);
local v1 = require(script.Parent.Enums.EventNames);
local l_SocialLuaAnalytics_0 = v0.SocialLuaAnalytics;
local l_Dash_0 = v0.Dash;
local l_Enums_0 = l_SocialLuaAnalytics_0.Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v7 = require(script.Parent.Enums.BtnValues);
return {
    [v1.DiscoverabilityModalLoad] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.DiscoverabilityModalLoad, 
        formatRulesForAdditionalInfo = {
            version = l_Dash_0.identity, 
            wordingVersion = l_Dash_0.identity
        }
    }, 
    [v1.DiscoverabilityModalContinue] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.DiscoverabilityModalClick, 
        additionalInfo = {
            btn = v7.ContactImporter
        }, 
        formatRulesForAdditionalInfo = {
            selected = l_Dash_0.identity
        }
    }, 
    [v1.DiscoverabilityModalClose] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.DiscoverabilityModalClick, 
        additionalInfo = {
            btn = v7.Close
        }, 
        formatRulesForAdditionalInfo = {
            selected = l_Dash_0.identity
        }
    }, 
    [v1.DiscoverabilityModalRadioButtonClick] = {
        context = l_Contexts_0.ContactImport, 
        eventType = l_EventTypes_0.DiscoverabilityModalRadioButtonClick, 
        formatRulesForAdditionalInfo = {
            selected = l_Dash_0.identity
        }
    }
};

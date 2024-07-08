local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Dash_0 = require(l_Parent_0.dependencies).Dash;
local l_Enums_0 = require(l_Parent_1.SocialLuaAnalytics).Analytics.Enums;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
local v6 = require(script.Parent.EventNames);
return {
    [v6.InvisibleModeInteracted] = {
        context = l_Contexts_0.ProfileCard, 
        eventType = l_EventTypes_0.InvisibleModeInteracted, 
        formatRulesForAdditionalInfo = {
            invisibleModeActivated = l_Dash_0.identity, 
            surface = l_Dash_0.identity
        }
    }, 
    [v6.InvisibleModeTooltipInteracted] = {
        context = l_Contexts_0.ProfileCard, 
        eventType = l_EventTypes_0.InvisibleModeTooltipInteracted, 
        formatRulesForAdditionalInfo = {
            surface = l_Dash_0.identity
        }
    }, 
    [v6.InvisibleModeTooltipSeen] = {
        context = l_Contexts_0.ProfileCard, 
        eventType = l_EventTypes_0.InvisibleModeTooltipSeen, 
        formatRulesForAdditionalInfo = {
            surface = l_Dash_0.identity
        }
    }, 
    [v6.InvisibleModeViewed] = {
        context = l_Contexts_0.ProfileCard, 
        eventType = l_EventTypes_0.InvisibleModeViewed, 
        formatRulesForAdditionalInfo = {
            surface = l_Dash_0.identity
        }
    }, 
    [v6.InvisibleStateSeen] = {
        context = l_Contexts_0.PresenceIndicator, 
        eventType = l_EventTypes_0.InvisibleModeFeedback, 
        formatRulesForAdditionalInfo = {
            surface = l_Dash_0.identity
        }
    }
};

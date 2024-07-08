local l_CorePackages_0 = game:GetService("CorePackages");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v2 = require(l_CorePackages_0.Cryo);
return {
    displayEvent = function(v3)
        l_RbxAnalyticsService_0:SendEventDeferred("client", "ftuxTooltipClientEvent", "ftuxTooltipDisplayed", v2.Dictionary.join({
            action_type = "displayed"
        }, v3));
    end, 
    interactEvent = function(v4)
        l_RbxAnalyticsService_0:SendEventDeferred("client", "ftuxTooltipClientEvent", "ftuxTooltipInteracted", v2.Dictionary.join({
            action_type = "clicked"
        }, v4));
    end, 
    dismissEvent = function(v5)
        l_RbxAnalyticsService_0:SendEventDeferred("client", "ftuxTooltipClientEvent", "ftuxTooltipDismissed", v2.Dictionary.join({
            action_type = "dismissed"
        }, v5));
    end, 
    autoDismissEvent = function(v6)
        l_RbxAnalyticsService_0:SendEventDeferred("client", "ftuxTooltipClientEvent", "ftuxTooltipAutoDismissed", v2.Dictionary.join({
            action_type = "ignored"
        }, v6));
    end
};

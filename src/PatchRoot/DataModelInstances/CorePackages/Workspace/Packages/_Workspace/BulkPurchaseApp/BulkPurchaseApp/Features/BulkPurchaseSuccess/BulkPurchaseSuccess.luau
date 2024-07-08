local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_script_FirstAncestor_0.Components.AlertPrompt);
return function(v5)
    local v6 = l_useLocalization_0({
        title = "CoreScripts.BulkPurchasePrompt.SuccessPrompt.Heading", 
        bodyText = "CoreScripts.BulkPurchasePrompt.SuccessPrompt.Body", 
        dismissCTA = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.DismissCTA"
    });
    return v2.createElement(v4, {
        title = v6.title, 
        bodyText = v6.bodyText:gsub("{.*}", (tostring(v5.itemCount))), 
        dismissCTA = v6.dismissCTA, 
        onDismiss = v5.onDismiss
    });
end;

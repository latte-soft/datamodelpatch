local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.PurchaseErrors);
return {
    [v0.NotEnoughRobux] = "CoreScripts.PurchasePrompt.PurchaseFailed.NotEnoughRobux", 
    [v0.PurchaseDisabled] = "CoreScripts.PurchasePrompt.PurchaseFailed.PurchaseDisabled", 
    [v0.UnknownFailure] = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName", 
    [v0.NotForSale] = "CoreScripts.PurchasePrompt.PurchaseFailed.NotForSale", 
    [v0.Under13] = "CoreScripts.PurchasePrompt.PurchaseFailed.Under13", 
    [v0.AlreadyOwn] = "CoreScripts.PurchasePrompt.PurchaseFailed.AlreadyOwn", 
    [v0.TooManyPurchases] = "Feature.Toast.NetworkingError.TooManyRequests", 
    [v0.InvalidRequest] = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName", 
    [v0.Unauthorized] = "Feature.Toast.NetworkingError.Unauthorized"
};

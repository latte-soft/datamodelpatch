local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
return {
    selfViewVisibilityUpdatedSignal = require(l_RobloxGui_0.Modules.SelfView.selfViewVisibilityUpdatedSignal), 
    getSelfViewVisibility = require(l_RobloxGui_0.Modules.SelfView.publicApi).getSelfViewIsOpenAndVisible
};

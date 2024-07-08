local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.SelfView.selfViewVisibilityUpdatedSignal);
local v1 = false;
return {
    getSelfViewIsOpenAndVisible = function()
        return v1;
    end, 
    setSelfViewIsOpenAndVisible = function(v2)
        v1 = v2;
        v0:fire();
    end
};

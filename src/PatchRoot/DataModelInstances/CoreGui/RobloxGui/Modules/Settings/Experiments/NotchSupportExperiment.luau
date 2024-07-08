local v0 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.IXPServiceWrapper);
local v1 = false;
return {
    initialize = function()
        task.spawn(function()
            v0:WaitForInitialization();
            local l_v0_LayerData_0 = v0:GetLayerData("Engine.Interactivity.UICreation.NotchScreenSupport");
            if l_v0_LayerData_0 then
                v1 = l_v0_LayerData_0.notchEnabled;
            end;
        end);
    end, 
    enabled = function()
        return v1;
    end
};

local l_RunService_0 = game:GetService("RunService");
local l_IXPService_0 = game:GetService("IXPService");
return {
    InitializeAsync = function(_, v3, v4)
        local l_status_0, l_result_0 = pcall(function()
            if l_RunService_0:IsStudio() then
                l_IXPService_0:ClearUserLayers();
            end;
            l_IXPService_0:RegisterUserLayers(v4);
            l_IXPService_0:InitializeUserLayers(v3);
            local l_l_IXPService_0_UserLayerLoadingStatus_0 = l_IXPService_0:GetUserLayerLoadingStatus();
            while not (l_l_IXPService_0_UserLayerLoadingStatus_0 ~= Enum.IXPLoadingStatus.None) or l_l_IXPService_0_UserLayerLoadingStatus_0 == Enum.IXPLoadingStatus.Pending do
                l_IXPService_0.OnUserLayerLoadingStatusChanged:Wait();
                l_l_IXPService_0_UserLayerLoadingStatus_0 = l_IXPService_0:GetUserLayerLoadingStatus();
            end;
            return l_l_IXPService_0_UserLayerLoadingStatus_0;
        end);
        return l_status_0, l_result_0;
    end, 
    WaitForInitialization = function(_)
        local l_l_IXPService_0_UserLayerLoadingStatus_1 = l_IXPService_0:GetUserLayerLoadingStatus();
        while not (l_l_IXPService_0_UserLayerLoadingStatus_1 ~= Enum.IXPLoadingStatus.None) or l_l_IXPService_0_UserLayerLoadingStatus_1 == Enum.IXPLoadingStatus.Pending do
            l_IXPService_0.OnUserLayerLoadingStatusChanged:Wait();
            l_l_IXPService_0_UserLayerLoadingStatus_1 = l_IXPService_0:GetUserLayerLoadingStatus();
        end;
        return l_l_IXPService_0_UserLayerLoadingStatus_1;
    end, 
    GetLayerData = function(_, v11)
        local l_status_1, l_result_1 = pcall(function()
            return l_IXPService_0:GetUserLayerVariables(v11);
        end);
        return not not l_status_1 and l_result_1 or nil;
    end, 
    LogUserLayerExposure = function(_, v15)
        pcall(function()
            l_IXPService_0:LogUserLayerExposure(v15);
        end);
    end, 
    LogBrowserTrackerLayerExposure = function(_, v17)
        pcall(function()
            l_IXPService_0:LogBrowserTrackerLayerExposure(v17);
        end);
    end
};

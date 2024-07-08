local l_IXPService_0 = game:GetService("IXPService");
game:DefineFastFlag("FallbackPlaceIdParamEnabledForAll", false);
game:DefineFastFlag("ActionableSocialContextToastEnabledForAll", false);
local v1 = {};
local function v3()
    local l_l_IXPService_0_UserLayerLoadingStatus_0 = l_IXPService_0:GetUserLayerLoadingStatus();
    while not (l_l_IXPService_0_UserLayerLoadingStatus_0 ~= Enum.IXPLoadingStatus.None) or l_l_IXPService_0_UserLayerLoadingStatus_0 == Enum.IXPLoadingStatus.Pending do
        l_IXPService_0.OnUserLayerLoadingStatusChanged:Wait();
        l_l_IXPService_0_UserLayerLoadingStatus_0 = l_IXPService_0:GetUserLayerLoadingStatus();
    end;
    return l_l_IXPService_0_UserLayerLoadingStatus_0;
end;
v1.CheckIsFallbackPlaceIdParamEnabled = function()
    if not game:GetFastFlag("FallbackPlaceIdParamEnabledForAll") then
        v3();
        local l_status_0, l_result_0 = pcall(function()
            return l_IXPService_0:GetUserLayerVariables("PlayerApp.GameJoin.UX");
        end);
        if (not l_status_0 or not l_result_0) or not l_result_0.IsJoinWithUserIdParamEnabled then
            return false;
        else
            return true;
        end;
    else
        return true;
    end;
end;
v1.CheckIsActionableToastEnabled = function()
    if not game:GetFastFlag("ActionableSocialContextToastEnabledForAll") then
        v3();
        local l_status_1, l_result_1 = pcall(function()
            return l_IXPService_0:GetUserLayerVariables("PlayerApp.GameJoin.UX");
        end);
        if (not l_status_1 or not l_result_1) or not l_result_1.IsActionableToastsEnabled then
            return false;
        else
            return true;
        end;
    else
        return true;
    end;
end;
return v1;

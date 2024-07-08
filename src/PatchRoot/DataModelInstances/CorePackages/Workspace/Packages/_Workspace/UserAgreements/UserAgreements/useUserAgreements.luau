local l_Parent_0 = script:FindFirstAncestor("UserAgreements").Parent;
local v1 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
local l_AppPlatformService_0 = require(l_Parent_0.RoactServiceTags).AppPlatformService;
local l_AppAppLifecycleService_0 = require(l_Parent_0.RoactServiceTags).AppAppLifecycleService;
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local v12 = require(script.Parent.FetchUpdatedUserAgreements);
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_GetFFlagUserAgreementsOnAppForegrounded_0 = require(l_Parent_0.SharedFlags).GetFFlagUserAgreementsOnAppForegrounded;
local l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0 = require(l_Parent_0.SharedFlags).GetFFlagUseUpdatedVNGAgreementsWorkflow;
local function v17(v16)
    return v16.AuthenticationStatus.status == l_LoginStatus_0.LOGGED_IN;
end;
local function v22(v18, v19, v20, v21)
    v18(l_SetCentralOverlay_0(v19, {
        agreements = v20, 
        agreementAccepted = v21
    }, {
        DisableBackButtonClose = true
    }));
end;
local _ = function(v23)
    for _, v25 in v23, nil, nil do
        if v25.action == "ConvertToVngUser" then
            return true;
        end;
    end;
    return false;
end;
local function v39()
    local v27 = l_useRoactService_0(l_RoactNetworking_0);
    local v28 = l_useRoactService_0(l_RoactAnalytics_0);
    local v29 = l_useDispatch_0();
    local v31 = if not l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then nil else l_useAppPolicy_0(function(v30)
        return v30.getVNGFormRequired();
    end);
    local function v32()
    end;
    if not (not l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() or not v31) then
        v32 = function()
            v29(l_SetCentralOverlay_0(l_CentralOverlayType_0.VngContactInfoFormWebviewPopup, {}, {
                DisableBackButtonClose = true
            }));
        end;
    end;
    return v1.useCallback(function()
        if not (not v27 or not v28) and v29 then
            if not (not l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() or not v31) then
                v29(l_SetCentralOverlay_0(l_CentralOverlayType_0.VngComplianceLoadingPopup, {}, {
                    DisableBackButtonClose = true
                }));
            end;
            v12(v27, v28):andThen(function(v33)
                if not v33 or #v33 == 0 then
                    if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then
                        v32();
                    end;
                    return ;
                else
                    local v34;
                    for _, v36 in v33, nil, nil do
                        if v36.action == "ConvertToVngUser" then
                            v34 = true;
                            goto label0 --[[  true, false  ]];
                        end;
                    end;
                    v34 = false;
                    ::label0::;
                    if not v34 then
                        v22(v29, l_CentralOverlayType_0.UserAgreementsUpdatedPopup, v33, nil);
                        return ;
                    elseif not l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then
                        v22(v29, l_CentralOverlayType_0.VNGUserAgreementsPopup, v33, function(_)
                            v29(l_SetCentralOverlay_0(l_CentralOverlayType_0.VngContactInfoFormWebviewPopup, {}));
                        end);
                        return ;
                    else
                        v22(v29, l_CentralOverlayType_0.VNGUserAgreementsPopup, v33, v32);
                        return ;
                    end;
                end;
            end, function(_)
                if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then
                    v32();
                end;
            end);
            return ;
        else
            return ;
        end;
    end, {
        v27, 
        v28, 
        v29
    });
end;
local function v45()
    local v40 = v39();
    local v41 = l_useRoactService_0(l_AppPlatformService_0);
    local v42 = l_useRoactService_0(l_AppAppLifecycleService_0);
    local v43 = l_useSelector_0(v17);
    v1.useEffect(function()
        if (v41 or v42) and v43 then
            local v44 = nil;
            if not v42 then
                if v41 then
                    v44 = v41.OnLeaveConstrained:connect(v40);
                end;
            else
                v44 = v42:RegisterCallback(Enum.AppLifecycleState.Active, v40, true, false);
            end;
            if v44 ~= nil then
                return function()
                    v44:Disconnect();
                    v44 = nil;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end, {
        v43, 
        v40, 
        v41, 
        v42
    });
end;
local function v52()
    local v46 = v39();
    local v47 = l_useSelector_0(v17);
    local v49 = l_useAppPolicy_0(function(v48)
        return v48.getCheckUserAgreementsUpdatedOnLogin();
    end);
    local v50, v51 = v1.useState(false);
    v1.useEffect(function()
        if v47 then
            if not (not v49 or v50) then
                v51(true);
                v46();
            end;
            return ;
        else
            v51(false);
            return ;
        end;
    end, {
        v46, 
        v47, 
        v50, 
        v49
    });
end;
return function()
    if not l_GetFFlagUserAgreementsOnAppForegrounded_0() then
        local v53 = l_useRoactService_0(l_RoactNetworking_0);
        local v54 = l_useRoactService_0(l_RoactAnalytics_0);
        local v55 = l_useDispatch_0();
        local v56 = l_useSelector_0(v17);
        local v58 = l_useAppPolicy_0(function(v57)
            return v57.getCheckUserAgreementsUpdatedOnLogin();
        end);
        local v60 = if not l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then nil else l_useAppPolicy_0(function(v59)
            return v59.getVNGFormRequired();
        end);
        local function v61()
        end;
        if v60 then
            v61 = function()
                v55(l_SetCentralOverlay_0(l_CentralOverlayType_0.VngContactInfoFormWebviewPopup, {}, {
                    DisableBackButtonClose = true
                }));
            end;
        end;
        local v62, v63 = v1.useState(false);
        v1.useEffect(function()
            if not (not v53 or not v54) and v55 then
                if v56 then
                    if not (not v58 or v62) then
                        if not (not l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() or not v60) then
                            v55(l_SetCentralOverlay_0(l_CentralOverlayType_0.VngComplianceLoadingPopup, {}, {
                                DisableBackButtonClose = true
                            }));
                        end;
                        v63(true);
                        v12(v53, v54):andThen(function(v64)
                            if v64 and #v64 > 0 then
                                local v65 = false;
                                for _, v67 in ipairs(v64) do
                                    if v67.action == "ConvertToVngUser" then
                                        v65 = true;
                                        break;
                                    end;
                                end;
                                if not v65 then
                                    v55(l_SetCentralOverlay_0(l_CentralOverlayType_0.UserAgreementsUpdatedPopup, {
                                        agreements = v64
                                    }, {
                                        DisableBackButtonClose = true
                                    }));
                                    return ;
                                elseif not l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then
                                    v55(l_SetCentralOverlay_0(l_CentralOverlayType_0.VNGUserAgreementsPopup, {
                                        agreements = v64, 
                                        agreementAccepted = function(_)
                                            v55(l_SetCentralOverlay_0(l_CentralOverlayType_0.VngContactInfoFormWebviewPopup, {}));
                                        end
                                    }, {
                                        DisableBackButtonClose = true
                                    }));
                                    return ;
                                else
                                    v55(l_SetCentralOverlay_0(l_CentralOverlayType_0.VNGUserAgreementsPopup, {
                                        agreements = v64, 
                                        agreementAccepted = v61
                                    }, {
                                        DisableBackButtonClose = true
                                    }));
                                    return ;
                                end;
                            else
                                if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then
                                    v61();
                                end;
                                return ;
                            end;
                        end, function(_)
                            if l_GetFFlagUseUpdatedVNGAgreementsWorkflow_0() then
                                v61();
                            end;
                        end);
                    end;
                    return ;
                else
                    v63(false);
                    return ;
                end;
            else
                return ;
            end;
        end, {
            v53, 
            v54, 
            v55, 
            v56, 
            v62, 
            v58
        });
        return ;
    else
        v52();
        v45();
        return ;
    end;
end;

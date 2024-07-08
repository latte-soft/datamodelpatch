local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.RoactUtils).Hooks.useNavigation;
local v4 = require(l_script_FirstAncestor_0.Common.Enums);
local l_ActionTypeEnum_0 = v4.ActionTypeEnum;
local l_ActionStatusEnum_0 = v4.ActionStatusEnum;
local l_AccessResponseEnum_0 = v4.AccessResponseEnum;
local l_accountSettingsUpsellStrings_0 = require(l_script_FirstAncestor_0.Common.LocalizationStrings).accountSettingsUpsellStrings;
local l_LoadingSpinner_0 = require(l_Parent_0.UIBlox).App.Loading.LoadingSpinner;
local v10 = require(l_Parent_0.Cryo);
local v11 = require(l_script_FirstAncestor_0.Analytics.AnalyticsService);
local v12 = require(l_script_FirstAncestor_0.Analytics.sendModalActionEvent);
local v13 = require(l_script_FirstAncestor_0.Common.AmpApiProvider);
local v14 = require(l_script_FirstAncestor_0.Common.AppScreens);
local v15 = require(l_script_FirstAncestor_0.Components.ErrorScreen);
local l_useApolloClient_0 = require(l_Parent_0.ApolloClient).useApolloClient;
local v17 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAmpUpsellGql);
local v18 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAmpEmailUpsellSupport);
local v19 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAmpIDVUpsellSupport);
local function v24(v20)
    local v21 = {};
    for v22, v23 in pairs(v20) do
        if v23 == l_ActionStatusEnum_0.Success then
            table.insert(v21, v22);
        end;
    end;
    return v21;
end;
return function(v25)
    local v26 = l_useNavigation_0();
    local l_featureName_0 = v25.featureName;
    local l_openUpsells_0 = v25.openUpsells;
    local l_completionCallback_0 = v25.completionCallback;
    local v30 = if not v25.ampApiProvider then v13 else v25.ampApiProvider;
    local v31 = if not v25.analyticsService then v11.EventStream else v25.analyticsService;
    local v32 = if not v25.openAccountSettingsUpsell then v26.push else v25.openAccountSettingsUpsell;
    local v33, v34 = v2.useState({});
    local v35, v36 = v2.useState(false);
    local v37 = l_useApolloClient_0();
    local v40 = v2.useCallback(function(v38)
        if v38 == l_ActionTypeEnum_0.Phone then
            return {
                eventContext = "AmpUpsell", 
                origin = v14.AmpWizardContainer, 
                onSuccess = function()
                    v34(v10.Dictionary.join(v33, {
                        [l_ActionTypeEnum_0.Phone] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                onFailure = function()
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v33, {
                        [l_ActionTypeEnum_0.Phone] = l_ActionStatusEnum_0.Failure
                    }));
                end, 
                onCancelled = function()
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v33, {
                        [l_ActionTypeEnum_0.Phone] = l_ActionStatusEnum_0.Cancelled
                    }));
                end
            };
        elseif v18() and v38 == l_ActionTypeEnum_0.AddedEmail then
            return {
                eventContext = "AmpUpsell", 
                closeOnEmailUpdate = true, 
                addEmailOver13TextKey = "Feature.VerificationUpsell.Description.IDVerificationAddEmailText", 
                addEmailUnder13TextKey = "Feature.VerificationUpsell.Description.IDVerificationAddEmailText", 
                addEmailTitleKey = "Feature.VerificationUpsell.Heading.AddEmail", 
                successCallback = function(_)
                    v34(v10.Dictionary.join(v33, {
                        [l_ActionTypeEnum_0.Email] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                failureCallback = function()
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v33, {
                        [l_ActionTypeEnum_0.Phone] = l_ActionStatusEnum_0.Failure
                    }));
                end, 
                closeCentralOverlay = function()
                end
            };
        elseif v19() and v38 == l_ActionTypeEnum_0.GovernmentId then
            return {
                featureName = l_featureName_0, 
                onSuccess = function()
                    v34(v10.Dictionary.join(v33, {
                        [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Success
                    }));
                end, 
                onFailure = function()
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v33, {
                        [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Failure
                    }));
                end, 
                onCancelled = function()
                    l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v33, {
                        [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Cancelled
                    }));
                end
            };
        else
            return {};
        end;
    end, {
        v33
    });
    local v45 = v2.useCallback(function(v41)
        if #v41 == 0 then
            return ;
        else
            local _ = nil;
            local v43 = v41[1];
            local v44 = l_openUpsells_0[v43];
            if v44 ~= nil then
                v44((v40(v43)));
                return ;
            else
                v32({
                    featureName = l_featureName_0, 
                    localizationStrings = l_accountSettingsUpsellStrings_0[v43], 
                    onCloseModal = function()
                        v26.pop();
                        l_completionCallback_0(l_AccessResponseEnum_0.Denied, v10.Dictionary.join(v33, {
                            [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Cancelled
                        }));
                    end, 
                    onCancelled = function()
                        v26.pop();
                        v34(v10.Dictionary.join(v33, {
                            [l_ActionTypeEnum_0.GovernmentId] = l_ActionStatusEnum_0.Cancelled
                        }));
                    end
                });
                return ;
            end;
        end;
    end, {});
    local v48 = v2.useCallback(function(v46)
        v36(false);
        local v47 = if not v17() then v30.upsellFeatureAccess(v46, (v24(v33))) else v30.upsellFeatureAccessGql(v37, v46, (v24(v33)));
        if v47.access == l_AccessResponseEnum_0.Error then
            v36(true);
            return ;
        elseif v47.access == l_AccessResponseEnum_0.Actionable then
            v45(v47.recourse);
            return ;
        elseif v47.access == l_AccessResponseEnum_0.Granted then
            l_completionCallback_0(l_AccessResponseEnum_0.Granted, v33);
            return ;
        elseif v47.access == l_AccessResponseEnum_0.Denied then
            l_completionCallback_0(l_AccessResponseEnum_0.Denied, v33);
            return ;
        else
            l_completionCallback_0(l_AccessResponseEnum_0.Pending, v33);
            return ;
        end;
    end, {
        v30
    });
    v2.useEffect(function()
        v12(v31, v14.AmpWizardContainer, l_featureName_0, "Shown");
    end, {
        v31
    });
    v2.useEffect(function()
        v48(l_featureName_0);
    end, {
        v33, 
        l_featureName_0, 
        l_completionCallback_0
    });
    if not v35 then
        return v2.createElement(l_LoadingSpinner_0, {
            size = UDim2.fromOffset(42, 42), 
            position = UDim2.fromScale(0.5, 0.5), 
            anchorPoint = Vector2.new(0.5, 0.5)
        });
    else
        return v2.createElement(v15, {
            featureName = l_featureName_0, 
            onRetry = function()
                v36(false);
                v48(l_featureName_0);
            end, 
            onCancel = function()
                l_completionCallback_0(l_AccessResponseEnum_0.Denied, v33);
            end
        });
    end;
end;

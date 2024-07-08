local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Analytics);
local v5 = require(l_Parent_0.ServerUI);
local l_ReactServerUIView_0 = v5.ReactServerUIView;
local v7 = require(l_Parent_0.Cryo);
local l_Navigation_0 = v5.Navigation;
local v9 = require(l_Parent_0.HttpRequest);
local v10 = require(l_Parent_0.RoduxNetworking);
local v11 = require(l_Parent_0.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v13 = require(l_Parent_0.InputHandlers);
local v14 = require(l_Parent_0.ToastRodux);
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_useState_0 = v3.useState;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v18 = require(l_script_FirstAncestor_0.Common.Constants);
local l_useNavigation_0 = require(l_Parent_0.RoactUtils).Hooks.useNavigation;
local v20 = require(l_script_FirstAncestor_0.Templates.ReportFullscreenTemplate);
local v21 = require(l_script_FirstAncestor_0.Transformers.DynamicDialogUITransformer);
local v22 = require(l_script_FirstAncestor_0.Components.ReportListSelection);
local v23 = require(l_script_FirstAncestor_0.Components.ReportSubmission);
local v24 = require(l_script_FirstAncestor_0.Components.constructAbuseReportTags);
local l_GetFFlagDSALuaGeoGateBEDUIDevMode_0 = require(l_Parent_0.SharedFlags).GetFFlagDSALuaGeoGateBEDUIDevMode;
local l_isInDSAFeaturesOverrideList_0 = require(l_Parent_0.DsaIllegalContentReporting).isInDSAFeaturesOverrideList;
local l_isShowEUDSAIllegalContentReportingLink_0 = require(l_Parent_0.DsaIllegalContentReporting).isShowEUDSAIllegalContentReportingLink;
local v28 = {
    ListSelection = "listSelection", 
    Submission = "submission"
};
local v29 = {
    toastMessage = "Feature.ReportAbuse.Label.Confirmation.Title", 
    toastSubMessage = "Feature.ReportAbuse.Label.Confirmation.Subheading", 
    isLocalized = false, 
    toastType = v14.Enums.ToastType.SuccessConfirmation
};
local v30 = {
    toastMessage = "Feature.ReportAbuse.Message.ErrorSubmit", 
    isLocalized = false, 
    toastType = v14.Enums.ToastType.NetworkingError
};
local function v64(v31)
    local v32 = l_useDispatch_0();
    local v33, v34 = l_useState_0({});
    local v35 = nil;
    local function _()
        if not v35 then
            v35 = v4.new(v31.platform, v31.context);
        end;
        return v35;
    end;
    local function _(v37, v38)
        v34(function(v39)
            local v40 = table.clone(v39);
            table.insert(v40, v7.Dictionary.join(v38, {
                tagKey = v37
            }));
            return v40;
        end);
    end;
    local v43 = v11.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, (v3.useCallback(v13.onRelease(function(_)
        if not v35 then
            v35 = v4.new(v31.platform, v31.context);
        end;
        v35:onReportAbandoned();
    end), {
        v35
    })));
    local v44 = v10.config({
        keyPath = "AbuseReporting", 
        networkImpl = v9.config({
            requestFunction = v9.requestFunctions.HttpRbxApi
        })
    });
    local v58 = v21.new({
        componentMap = {
            [v28.ListSelection] = {
                name = v28.ListSelection, 
                component = v22, 
                props = {
                    onItemSelected = function(v45, v46)
                        local l_params_0 = v45.params;
                        local l_tagKey_0 = l_params_0.tagKey;
                        local v49 = {
                            tagValues = v46.tagValues, 
                            heading = l_params_0.heading, 
                            humanReadableText = v46.humanReadableText
                        };
                        v34(function(v50)
                            local v51 = table.clone(v50);
                            table.insert(v51, v7.Dictionary.join(v49, {
                                tagKey = l_tagKey_0
                            }));
                            return v51;
                        end);
                        if not v35 then
                            v35 = v4.new(v31.platform, v31.context);
                        end;
                        v35:onSingleListItemSelected();
                    end, 
                    onCancel = function()
                        if not v35 then
                            v35 = v4.new(v31.platform, v31.context);
                        end;
                        v35:onReportAbandoned();
                        v31.navigation.goBack();
                    end
                }
            }, 
            [v28.Submission] = {
                name = v28.Submission, 
                component = v23, 
                props = {
                    onCancel = function()
                        if not v35 then
                            v35 = v4.new(v31.platform, v31.context);
                        end;
                        v35:onReportAbandoned();
                        v31.navigation.goBack();
                    end, 
                    onMounted = function()
                        if not v35 then
                            v35 = v4.new(v31.platform, v31.context);
                        end;
                        v35:onSubmissionPageMount();
                    end, 
                    onSubmit = function(v52)
                        local l_url_0 = v52.params.url;
                        local v54 = {
                            safetyEvent = {
                                tags = v24(v52.report, {
                                    context = v31.context, 
                                    platform = v31.platform, 
                                    assetId = v31.assetId, 
                                    reportAbuseVector = v31.reportAbuseVector
                                })
                            }
                        };
                        v32(v44.POST({
                            Name = "SubmitAbuseReport"
                        }, function(v55)
                            return v55(l_url_0):body(v54);
                        end).API()):andThen(function(_)
                            v32(v14.Actions.SetCurrentToastMessage(v29));
                        end):catch(function(_)
                            v32(v14.Actions.SetCurrentToastMessage(v30));
                        end);
                        if not v35 then
                            v35 = v4.new(v31.platform, v31.context);
                        end;
                        v35:onReportSubmitted();
                        v31.navigation.goBack();
                    end
                }
            }
        }, 
        templateMap = {
            default = {
                component = v20
            }
        }
    });
    local function v60(v59)
        if v59.name == v28.Submission then
            return {
                report = v33
            };
        else
            return {};
        end;
    end;
    local l_V1_0 = v18.BEDUI_VERSIONS.V1;
    if not l_GetFFlagDSALuaGeoGateBEDUIDevMode_0() then
        if l_isInDSAFeaturesOverrideList_0() then
            l_V1_0 = v18.BEDUI_VERSIONS.DEV;
        end;
    elseif l_isShowEUDSAIllegalContentReportingLink_0() then
        l_V1_0 = v18.BEDUI_VERSIONS.DEV;
    end;
    return v3.createElement(l_ReactServerUIView_0, {
        url = "abuse-reporting/v1/dynamic-dialog", 
        queryArgs = {
            version = l_V1_0, 
            surface = v31.platform, 
            context = v31.context, 
            locale = l_LocalizationService_0.RobloxLocaleId, 
            target_type = v31.reportAbuseVector, 
            target_id = v31.assetId
        }, 
        mapComponentPropsFromState = v60, 
        transform = function(v62)
            return v58:transform(v62);
        end, 
        onError = function(_)
            v32(v14.Actions.SetCurrentToastMessage(v30));
            v31.navigation.goBack();
        end, 
        ref = v43
    });
end;
return function(v65)
    local v66 = l_useNavigation_0();
    return v3.createElement(l_Navigation_0, {}, {
        Screen = v3.createElement(v64, v7.Dictionary.join(v65, v66.getParam("reportData", {}), {
            navigation = v66
        }))
    });
end;

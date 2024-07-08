local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v5 = require(l_CorePackages_0.UIBlox);
local l_FullPageModal_0 = v5.App.Dialog.Modal.FullPageModal;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v8 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportListTable);
local v9 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportSummaryPage);
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTypes);
local v11 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportDialogBodyLoading);
local v12 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTargetComponent);
local v13 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportDataFetchStatusMessage);
local v14 = require(l_Modules_0.LuaApp.Components.AbuseReporting.Constants);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_useScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useScreenSize;
local l_isSelectedDataDSAIllegalContent_0 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting).isSelectedDataDSAIllegalContent;
local v21 = require(script.Parent.getThumbnailData);
local l_VRConstants_0 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility).VRConstants;
local _ = v5.App.Loading.ShimmerPanel;
local _ = require(l_CorePackages_0.Workspace.Packages.Style).mapTypographyVariantToFontEnum;
local l_isShowEUDSAIllegalContentReportingLink_0 = require(l_CorePackages_0.Workspace.Packages.DsaIllegalContentReporting).isShowEUDSAIllegalContentReportingLink;
local l_GetFFlagLuafiedReportThumbnail_0 = v4.GetFFlagLuafiedReportThumbnail;
local l_GetFFlagLuafiedReportErrorStates_0 = v4.GetFFlagLuafiedReportErrorStates;
local l_GetFFlagLuaAppNewStreamNotificationsEnabled_0 = v4.GetFFlagLuaAppNewStreamNotificationsEnabled;
local l_GetFFlagDSAIllegalContentReporting_0 = v4.GetFFlagDSAIllegalContentReporting;
local l_GetFFlagDSAVRSkipFrontendGeoCheck_0 = v4.GetFFlagDSAVRSkipFrontendGeoCheck;
local function _(v31)
    return l_GetFFlagLuafiedReportErrorStates_0() and v31.loadingState.BEDUILoading;
end;
local function _(v33)
    return l_GetFFlagLuafiedReportErrorStates_0() and v33.loadingState.BEDUIError;
end;
local function v42(v35, v36, v37, v38, v39, v40)
    local v41 = {};
    if v38 then
        table.insert(v41, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = function()
                    v35.onBack();
                end, 
                text = v36
            }
        });
    end;
    if v40 then
        table.insert(v41, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = function()
                    v35.onClose();
                end, 
                text = v37
            }
        });
    end;
    if v39 then
        table.insert(v41, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = function()
                    v35.onSubmitReport();
                end, 
                text = not not v35.BEDUIComponents and v35.BEDUIComponents.submission.buttonText or "", 
                isDisabled = v35.loadingState.submitLoading
            }
        });
    end;
    return v41;
end;
local function _(v43, v44)
    if not v43.loadingState.submitLoading and not v43.loadingState.BEDUILoading then
        return v44.Semantic.Color.Action.Alert.Content.Color3;
    else
        return v44.Semantic.Color.Text.Default.Color3;
    end;
end;
return function(v46)
    local v47 = l_useDesignTokens_0();
    local _ = l_useDispatch_0();
    local v49 = nil;
    if l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() then
        v49 = l_useScreenSize_0();
    end;
    local v50 = false;
    local v51 = false;
    if v46.BEDUIComponents ~= nil then
        v51 = false;
        if v46.BEDUIComponents.submission.text ~= nil then
            v51 = l_isSelectedDataDSAIllegalContent_0(v46.selectionData);
        end;
    end;
    v50 = if not l_GetFFlagDSAVRSkipFrontendGeoCheck_0() then v51 and l_isShowEUDSAIllegalContentReportingLink_0() else v51 and l_GetFFlagDSAIllegalContentReporting_0();
    local v52 = l_useSelector_0(v21({
        reportData = v46.reportData
    }));
    local v53 = false;
    if #v46.prevListNodes > 0 then
        v53 = not (l_GetFFlagLuafiedReportErrorStates_0() and v46.loadingState.BEDUIError);
    end;
    local v54 = false;
    if v46.currentList == nil then
        v54 = false;
        if #v46.selectionData > 0 then
            v54 = not v50;
        end;
    end;
    local v55 = l_GetFFlagLuafiedReportErrorStates_0() and v46.loadingState.BEDUIError;
    local v56 = if v46.loadingState.submitLoading or v46.loadingState.BEDUILoading then v47.Semantic.Color.Text.Default.Color3 else v47.Semantic.Color.Action.Alert.Content.Color3;
    return l_withLocalization_0({
        backButtonText = "CommonUI.Controls.Action.Back", 
        closeButtonText = "Feature.Friends.Action.Close"
    })(function(v57)
        return v3.createElement(l_FullPageModal_0, {
            distanceFromTop = if not not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() and l_UserInputService_0.StatusBarSize then l_UserInputService_0.StatusBarSize.Y else 0, 
            title = not not v46.BEDUIComponents and v46.BEDUIComponents.title.text or "", 
            screenSize = if (not not l_GetFFlagLuaAppNewStreamNotificationsEnabled_0() and v46.reportSurface ~= v14.BEDUI_SURFACES.VR) and v49 then v49 else l_VRConstants_0.MainScreenResolution, 
            buttonStackProps = if (v53 or v54) or v55 then {
                forcedFillDirection = Enum.FillDirection.Horizontal, 
                buttons = v42(v46, v57.backButtonText, v57.closeButtonText, v53, v54, v55)
            } else nil, 
            onCloseClicked = function()
                v46.onClose();
                v46.onLogAbandon();
            end
        }, {
            ViewFrame = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = v47.Global.Opacity_0
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                ReportTarget = if not l_GetFFlagLuafiedReportThumbnail_0() or l_GetFFlagLuafiedReportErrorStates_0() and v46.loadingState.BEDUIError then nil else v3.createElement(v12, {
                    primaryText = v52.primaryText, 
                    secondaryText = v52.secondaryText, 
                    thumbnailUrl = v52.thumbnailUrl
                }), 
                ReportContent = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, (l_GetFFlagLuafiedReportErrorStates_0() and v46.loadingState.BEDUIError) and 0 or -v47.Global.Size_1400), 
                    BackgroundTransparency = v47.Global.Opacity_0, 
                    LayoutOrder = 2
                }, {
                    ReportCategoryTable = if not v46.currentList then if #v46.selectionData > 0 then v3.createElement(v9, {
                        heading = not not v46.BEDUIComponents and v46.BEDUIComponents.submission.heading or "", 
                        selectionData = v46.selectionData, 
                        dsaText = not not v46.BEDUIComponents and v46.BEDUIComponents.submission.text or "", 
                        onSummaryPageMounted = v46.onSummaryPageMounted
                    }) else if not (l_GetFFlagLuafiedReportErrorStates_0() and v46.loadingState.BEDUILoading) then nil else v3.createElement(v11, {}) else v3.createElement(v8, {
                        currentList = v46.currentList, 
                        onSelect = v46.onSelect
                    }), 
                    ReportDataFetchStatusMessage = if not l_GetFFlagLuafiedReportErrorStates_0() then nil else v3.createElement(v13, {
                        statusPrimaryText = v46.loadingState.statusPrimaryText, 
                        statusSecondaryText = v46.loadingState.statusSecondaryText, 
                        BEDUIError = v46.loadingState.BEDUIError, 
                        submitError = v46.loadingState.submitError, 
                        color = v56
                    })
                })
            })
        });
    end);
end;

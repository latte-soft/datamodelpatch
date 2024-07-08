local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Rodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.OpenReportMenu);
local v5 = require(l_Parent_0.Actions.CloseReportMenu);
local _ = require(l_Parent_0.Actions.OpenReportDialog);
local _ = require(l_Parent_0.Actions.OpenCategoryMenu);
local v8 = require(l_Parent_0.Actions.SelectReportCategory);
local v9 = require(l_Parent_0.Actions.OpenReportSentDialog);
local _ = require(l_Parent_0.Actions.CloseReportSentDialog);
local v11 = require(l_Parent_0.Actions.SelectReportListing);
local v12 = require(l_Parent_0.Actions.SetVoiceReportingFlow);
local v13 = require(l_Parent_0.Actions.SetIdentifiedAvatars);
local v14 = require(l_Parent_0.Actions.SetSelectedAvatars);
local v15 = require(l_Parent_0.Actions.BeginReportFlow);
local v16 = require(l_Parent_0.Actions.EndReportFlow);
local v17 = require(l_Parent_0.Actions.ScreenshotAnnotated);
local v18 = require(l_Parent_0.Actions.NavigateBack);
local v19 = require(l_Parent_0.Resources.Constants);
local v20 = require(l_Parent_0.Flags.GetFFlagReportAnythingScreenshot);
return v2.createReducer({
    currentPage = v19.Page.None, 
    history = {}, 
    voiceReportingFlowEnabled = true, 
    reportType = v19.ReportType.Any, 
    beginningReportType = v19.ReportType.Any, 
    reportCategory = v19.Category.None, 
    targetPlayer = nil, 
    beginningTimestamp = 0, 
    sortedUserIds = {}, 
    screenshotAnnotationPoints = {}, 
    identifiedAvatars = {}, 
    selectedAvatars = {}
}, {
    [v16.name] = function(v21, _)
        return v1.Dictionary.join(v21, {
            history = {}, 
            currentPage = v19.Page.None, 
            targetPlayer = v1.None, 
            reportType = v19.ReportType.Any, 
            identifiedAvatars = {}, 
            selectedAvatars = {}, 
            screenshotAnnotationPoints = {}
        });
    end, 
    [v15.name] = function(v23, v24)
        local v25 = {
            reportCategory = v19.Category.None, 
            beginningTimestamp = workspace:GetServerTimeNow(), 
            sortedUserIds = {}, 
            history = {
                v19.Page.None
            }
        };
        if v24.reportType == v19.ReportType.Place then
            return v1.Dictionary.join(v23, v25, {
                reportType = v24.reportType, 
                beginningReportType = v24.reportType, 
                currentPage = v19.Page.ReportForm, 
                targetPlayer = v1.None
            });
        elseif v24.reportType == v19.ReportType.Player then
            return v1.Dictionary.join(v23, v25, {
                reportType = v24.reportType, 
                beginningReportType = v24.reportType, 
                targetPlayer = v24.targetPlayer, 
                currentPage = if not v23.voiceReportingFlowEnabled then v19.Page.ReportForm else v19.Page.Category
            });
        else
            return v1.Dictionary.join(v23, v25, {
                reportType = v19.ReportType.Any, 
                beginningReportType = v19.ReportType.Any, 
                targetPlayer = v1.None, 
                currentPage = if not v23.voiceReportingFlowEnabled then v19.Page.Listing else v19.Page.Category
            });
        end;
    end, 
    [v18.name] = function(v26, _)
        return v1.Dictionary.join(v26, {
            history = v1.List.removeIndex(v26.history, #v26.history), 
            currentPage = v26.history[#v26.history] or v26.currentPage
        });
    end, 
    [v8.name] = function(v28, v29)
        local v30 = v29.reportCategory == v19.Category.Experience;
        local v31 = v28.beginningReportType == v19.ReportType.Player;
        local l_Listing_0 = v19.Page.Listing;
        local l_reportType_0 = v28.reportType;
        if not v20() then
            if v30 or v31 then
                l_Listing_0 = v19.Page.ReportForm;
                if v30 then
                    l_reportType_0 = v19.ReportType.Place;
                end;
            end;
        elseif not v30 then
            if v31 then
                l_Listing_0 = v19.Page.ReportForm;
            end;
        else
            l_Listing_0 = v19.Page.ScreenshotDialog;
            l_reportType_0 = v19.ReportType.Place;
        end;
        return v1.Dictionary.join(v28, {
            history = v1.List.join(v28.history, {
                v28.currentPage
            }), 
            currentPage = l_Listing_0, 
            reportType = l_reportType_0, 
            reportCategory = v29.reportCategory
        });
    end, 
    [v11.name] = function(v34, v35)
        return v1.Dictionary.join(v34, {
            sortedUserIds = v1.List.join(v35.sortedUserIds or {}, {}), 
            history = v1.List.join(v34.history, {
                v34.currentPage
            }), 
            currentPage = v19.Page.ReportForm, 
            reportType = v35.reportType, 
            targetPlayer = v35.targetPlayer or v1.None
        });
    end, 
    [v17.name] = function(v36, v37)
        return v1.Dictionary.join(v36, {
            history = v1.List.join(v36.history, {
                v36.currentPage
            }), 
            currentPage = v19.Page.ReportForm, 
            screenshotAnnotationPoints = v37.annotationPoints
        });
    end, 
    [v4.name] = function(v38, _)
        return v1.Dictionary.join(v38, {
            isReportMenuOpen = true
        });
    end, 
    [v5.name] = function(v40, _)
        return v1.Dictionary.join(v40, {
            isReportMenuOpen = false
        });
    end, 
    [v9.name] = function(v42, v43)
        return v1.Dictionary.join(v42, {
            currentPage = v19.Page.ReportSent, 
            reportType = v43.reportType, 
            targetPlayer = v43.targetPlayer or v1.None
        });
    end, 
    [v12.name] = function(v44, v45)
        return v1.Dictionary.join(v44, {
            voiceReportingFlowEnabled = v45.enable
        });
    end, 
    [v13.name] = function(v46, v47)
        return v1.Dictionary.join(v46, {
            identifiedAvatars = v47.identifiedAvatars, 
            screenshotAnnotationPoints = {}
        });
    end, 
    [v14.name] = function(v48, v49)
        return v1.Dictionary.join(v48, {
            selectedAvatars = v49.selectedAvatars
        });
    end
});

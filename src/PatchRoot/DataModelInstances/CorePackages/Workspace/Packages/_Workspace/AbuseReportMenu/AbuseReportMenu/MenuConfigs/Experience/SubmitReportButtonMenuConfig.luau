local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Players_0 = game:GetService("Players");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Components.Constants);
local v5 = require(l_script_FirstAncestor_0.IXP.TnSIXPWrapper);
local v6 = require(l_script_FirstAncestor_0.ReportAnything.Utility.AbuseReportBuilder);
local v7 = require(l_script_FirstAncestor_0.Analytics.ReportAbuseAnalytics);
local v8 = require(l_script_FirstAncestor_0.MenuConfigs.getToastMessageFromAbuseReason);
return {
    componentType = "button", 
    getIsVisible = function(_)
        return true;
    end, 
    variant = "primary", 
    getIconSrc = function(_)
        return "";
    end, 
    getButtonLabel = function(_)
        return "Submit";
    end, 
    onClick = function(v12, _, v14)
        local l_abuseReason_0 = v12.abuseReason;
        if l_abuseReason_0 ~= nil and l_Players_0.LocalPlayer ~= nil then
            if not v5.getReportAnythingExperienceEnabled() then
                spawn(function()
                    local v16 = tostring(game.PlaceId);
                    local v17 = "N/A";
                    local v18 = "N/A";
                    pcall(function()
                        local l_l_MarketplaceService_0_ProductInfo_0 = l_MarketplaceService_0:GetProductInfo(game.PlaceId, Enum.InfoType.Asset);
                        v17 = l_l_MarketplaceService_0_ProductInfo_0.Name;
                        v18 = l_l_MarketplaceService_0_ProductInfo_0.Description;
                    end);
                    l_Players_0:ReportAbuse(nil, l_abuseReason_0, (string.format("User Report: \n    %s \n" .. "Place Title: \n    %s \n" .. "PlaceId: \n    %s \n" .. "Place Description: \n    %s \n", v12.comment, v17, v16, v18)));
                end);
                v14.analyticsDispatch({
                    type = v4.AnalyticsActions.SetSubmissionCompleted
                });
                v14.onReportComplete((v8(l_abuseReason_0)));
            else
                l_Players_0:ReportAbuseV3(l_Players_0.LocalPlayer, (v6.buildExperienceReportRequest({
                    localUserId = l_Players_0.LocalPlayer.UserId, 
                    placeId = game.PlaceId, 
                    abuseComment = v12.comment, 
                    abuseReason = l_abuseReason_0, 
                    menuEntryPoint = v7:getAbuseReportSessionEntryPoint(), 
                    variant = v6.Constants.Variant.NM
                }, v14.reportAnythingState, v14.reportAnythingAnalytics.getAccumulatedParameters())));
                v14.analyticsDispatch({
                    type = v4.AnalyticsActions.SetSubmissionCompleted
                });
                v14.onReportComplete((v8(l_abuseReason_0, true)));
                return ;
            end;
        end;
    end, 
    fieldLabel = "", 
    componentName = "SubmitButton"
};

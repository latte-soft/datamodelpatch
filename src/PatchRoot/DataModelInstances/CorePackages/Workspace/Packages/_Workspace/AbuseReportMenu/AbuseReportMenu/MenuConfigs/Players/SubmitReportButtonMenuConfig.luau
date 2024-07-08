local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.MenuConfigs.getToastMessageFromAbuseReason);
local v6 = require(l_RobloxGui_0.Modules.VoiceChat.createVoiceAbuseReportRequest);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v8 = require(l_script_FirstAncestor_0.ReportAnything.Utility.AbuseReportBuilder);
local v9 = require(l_script_FirstAncestor_0.Analytics.ReportAbuseAnalytics);
local v10 = require(l_script_FirstAncestor_0.Components.Constants);
local v11 = require(l_script_FirstAncestor_0.IXP.TnSIXPWrapper);
local v12 = require(l_Parent_0.Cryo);
isEligibleForVoiceSubmit = function(v13, v14)
    local v15 = false;
    if v13.allegedAbuser ~= nil then
        v15 = false;
        if v13.allegedAbuserId ~= nil then
            v15 = false;
            if v13.abuseReason ~= nil then
                v15 = false;
                if v13.methodOfAbuse ~= nil then
                    v15 = false;
                    if v14.analyticsState.menuOpenedUnixTimestampMilliseconds ~= nil then
                        v15 = l_Players_0.LocalPlayer ~= nil;
                    end;
                end;
            end;
        end;
    end;
    return v15;
end;
isEligibleForRAOtherSubmit = function(v16)
    local v17 = false;
    if v16.allegedAbuser ~= nil then
        v17 = false;
        if v16.allegedAbuserId ~= nil then
            v17 = false;
            if v16.abuseReason ~= nil then
                v17 = l_Players_0.LocalPlayer ~= nil;
            end;
        end;
    end;
    return v17;
end;
isEligibleForTextSubmit = function(v18)
    local v19 = false;
    if v18.allegedAbuser ~= nil then
        v19 = v18.abuseReason ~= nil;
    end;
    return v19;
end;
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
    getIsDisabled = function(v23, v24)
        local l_methodOfAbuse_0 = v23.methodOfAbuse;
        if l_methodOfAbuse_0 == v10.AbuseMethods.VoiceChat then
            return not isEligibleForVoiceSubmit(v23, v24);
        elseif (l_methodOfAbuse_0 ~= v10.AbuseMethods.TextChat and l_methodOfAbuse_0 ~= nil) and (not (l_methodOfAbuse_0 == v10.AbuseMethods.Other) or v11.getReportAnythingAvatarEnabled()) then
            if not (l_methodOfAbuse_0 ~= v10.AbuseMethods.Other) or l_methodOfAbuse_0 == v10.AbuseMethods.Avatar then
                return not isEligibleForRAOtherSubmit(v23);
            else
                return false;
            end;
        else
            return not isEligibleForTextSubmit(v23);
        end;
    end, 
    onClick = function(v26, _, v28)
        local l_allegedAbuser_0 = v26.allegedAbuser;
        local l_allegedAbuserId_0 = v26.allegedAbuserId;
        local l_abuseReason_0 = v26.abuseReason;
        local l_methodOfAbuse_1 = v26.methodOfAbuse;
        local l_menuOpenedUnixTimestampMilliseconds_0 = v28.analyticsState.menuOpenedUnixTimestampMilliseconds;
        if l_methodOfAbuse_1 == v10.AbuseMethods.VoiceChat then
            if isEligibleForVoiceSubmit(v26, v28) then
                pcall(function()
                    task.spawn(function()
                        l_Players_0:ReportAbuseV3(l_Players_0.LocalPlayer, (v6(l_Players_0, l_default_0, {
                            localUserId = l_Players_0.LocalPlayer.UserId, 
                            abuserUserId = l_allegedAbuserId_0, 
                            abuseComment = v26.comment, 
                            abuseReason = l_abuseReason_0, 
                            inExpMenuOpenedUnixMilli = l_menuOpenedUnixTimestampMilliseconds_0, 
                            sortedPlayerListUserIds = v12.List.map(v26.playerObjects, function(v34)
                                return v34.UserId;
                            end), 
                            abuseVector = v10.AbuseVector.Voice
                        })));
                        v28.analyticsDispatch({
                            type = v10.AnalyticsActions.SetSubmissionCompleted
                        });
                        v28.showReportSentPage(l_allegedAbuser_0);
                    end);
                end);
                return ;
            end;
        elseif (not (l_methodOfAbuse_1 ~= v10.AbuseMethods.TextChat) or l_methodOfAbuse_1 == v10.AbuseMethods.Other and not v11.getReportAnythingAvatarEnabled()) or l_methodOfAbuse_1 == nil then
            if isEligibleForTextSubmit(v26) then
                spawn(function()
                    l_Players_0:ReportAbuse(l_allegedAbuser_0, l_abuseReason_0, v26.comment);
                end);
                v28.analyticsDispatch({
                    type = v10.AnalyticsActions.SetSubmissionCompleted
                });
                v28.onReportComplete((v5(l_abuseReason_0)));
                return ;
            end;
        elseif not (not (not (l_methodOfAbuse_1 ~= v10.AbuseMethods.Other) or l_methodOfAbuse_1 == v10.AbuseMethods.Avatar) or not isEligibleForRAOtherSubmit(v26)) then
            pcall(function()
                task.spawn(function()
                    l_Players_0:ReportAbuseV3(l_Players_0.LocalPlayer, (v8.buildOtherReportRequest({
                        localUserId = l_Players_0.LocalPlayer.UserId, 
                        formSelectedAbuserUserId = l_allegedAbuserId_0, 
                        abuseComment = v26.comment, 
                        abuseReason = l_abuseReason_0, 
                        menuEntryPoint = v9:getAbuseReportSessionEntryPoint(), 
                        variant = v8.Constants.Variant.NM
                    }, v28.reportAnythingState, v28.reportAnythingAnalytics.getAccumulatedParameters())));
                    v28.analyticsDispatch({
                        type = v10.AnalyticsActions.SetSubmissionCompleted
                    });
                    v28.onReportComplete((v5(l_abuseReason_0, true)));
                end);
            end);
        end;
    end, 
    fieldLabel = "", 
    componentName = "SubmitButton"
};

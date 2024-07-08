local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local _ = require(l_CorePackages_0.Packages.Dash);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v8 = require(l_RobloxGui_0.Modules.VoiceChat.createVoiceAbuseReportRequest);
local v9 = require(l_RobloxGui_0.Modules.Common.Url);
local l_Parent_0 = script.Parent.Parent;
local v11 = require(l_Parent_0.Resources.Constants);
local v12 = require(l_Parent_0.Utility.SendAnalytics);
local v13 = require(l_Parent_0.Utility.SessionUtility);
sendAnalytics = function(v14, v15, v16, v17)
    v12(v14, v11.Analytics.ReportSubmittedName, {
        reportType = v14, 
        reportedEntityId = tostring(v15), 
        reportSource = v11.Analytics.ReportSourceInGame, 
        reason = v16, 
        abuseVector = v17
    });
end;
getAbuseVectorFromReportCategory = function(v18)
    if v18 == v11.Category.Voice then
        return "voice";
    elseif v18 == v11.Category.Text then
        return "chat";
    else
        return "other";
    end;
end;
submitUserAbuseReport = function(v19, v20)
    local v21 = v19.reportCategory == v11.Category.Voice;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 then
        pcall(function()
            coroutine.wrap(function()
                local v23 = getAbuseVectorFromReportCategory(v19.reportCategory);
                if not v21 then
                    l_Players_0:ReportAbuse(v19.abusingPlayer, v19.reason, v19.comment);
                else
                    local v24 = v8(l_Players_0, l_default_0, {
                        localUserId = l_LocalPlayer_0.UserId, 
                        abuserUserId = v19.abusingPlayer.UserId, 
                        abuseComment = v19.comment, 
                        abuseReason = v19.reason, 
                        inExpMenuOpenedUnixMilli = math.floor(v19.beginningTimestamp * 1000), 
                        sortedPlayerListUserIds = v19.sortedUserIds, 
                        abuseVector = v23
                    });
                    if not game:GetEngineFeature("AbuseReportV3") then
                        l_HttpRbxApiService_0:PostAsyncFullUrl(v9.APIS_URL .. "/abuse-reporting/v2/abuse-report", v24);
                    else
                        l_Players_0:ReportAbuseV3(l_LocalPlayer_0, v24);
                    end;
                end;
                sendAnalytics(v11.Analytics.ReportTypeUser, v19.abusingPlayer.UserId, v19.reason, v23);
                v13.endAbuseReportSession();
                if v20 then
                    v20();
                end;
            end)();
        end);
    end;
end;
submitPlaceAbuseReport = function(v25, v26)
    if v25.placeName ~= "" then
        coroutine.wrap(function()
            if not l_RunService_0:IsStudio() then
                l_Players_0:ReportAbuse(nil, v25.reason, (string.format("User Report: \n    %s \n" .. "Place Title: \n    %s \n" .. "PlaceId: \n    %s \n" .. "Place Description: \n    %s \n", v25.comment, v25.placeName, tostring(v25.placeId), v25.placeDescription)));
            end;
            sendAnalytics(v11.Analytics.ReportTypeGame, v25.placeId, v25.reason);
            v13.endAbuseReportSession();
            if v26 then
                v26();
            end;
        end)();
    end;
end;
return {
    submitUserAbuseReport = submitUserAbuseReport, 
    submitPlaceAbuseReport = submitPlaceAbuseReport
};

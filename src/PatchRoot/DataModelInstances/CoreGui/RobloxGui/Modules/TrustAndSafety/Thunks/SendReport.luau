local _ = game:GetService("Players");
local _ = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.VoiceChat.ReportAbuseLogic);
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Resources.Constants);
local v4 = require(l_Parent_0.Actions.ShowToast);
local v5 = require(l_Parent_0.Actions.OpenReportSentDialog);
local v6 = require(l_Parent_0.Actions.EndReportFlow);
local v7 = require(l_Parent_0.Utility.ReportManager);
return function(v8, v9, v10, v11, v12, v13, v14)
    return function(v15)
        local v16 = v15:getState();
        if v8 == v3.ReportType.Player then
            v7.submitUserAbuseReport({
                reportCategory = v12, 
                abusingPlayer = v9, 
                reason = v10, 
                comment = v11, 
                beginningTimestamp = v16.report.beginningTimestamp, 
                sortedUserIds = v16.report.sortedUserIds
            }, function()
                v15:dispatch(v5(v8, v9));
            end);
            return ;
        else
            if v8 == v3.ReportType.Place then
                v7.submitPlaceAbuseReport({
                    placeId = game.PlaceId, 
                    placeName = v16.placeInfo.name, 
                    placeDescription = v16.placeInfo.description, 
                    reason = v10, 
                    comment = v11
                }, function()
                    v15:dispatch(v4(v13, v14));
                end);
                v15:dispatch(v6());
            end;
            return ;
        end;
    end;
end;

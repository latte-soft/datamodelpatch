local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v3 = require(l_CorePackages_0.Cryo);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v8 = require(script.Parent.Parent.Flags.GetFFlagIBEnableSendCounters);
local v9 = {};
v9.__index = v9;
v9.__tostring = function()
    return "Service(Analytics)";
end;
v9.new = function(v10, v11)
    local v12 = {};
    setmetatable(v12, v9);
    v12.eventStream = l_EventStream_0.new(l_RbxAnalyticsService_0);
    v12.pid = tostring(game.PlaceId);
    v12.uid = tostring(l_Players_0.LocalPlayer.UserId);
    v12.feature = "inspectAndBuy";
    v12.inspecteeUid = v10;
    v12.ctx = v11;
    v12.reportOpenInspectMenu = function()
        v12:report("inspectUser", {});
    end;
    v12.reportTryOnButtonClicked = function(v13, v14)
        v12:report("tryItem", {
            itemType = v13, 
            itemID = v14
        });
    end;
    v12.reportFavoriteItem = function(v15, v16, v17, v18, v19, v20)
        v12:report("favoriteItem", {
            itemType = v15, 
            itemID = v16, 
            favorite = v17, 
            success = v18, 
            failureReason = v19, 
            favoriteCount = v20
        });
    end;
    v12.reportPurchaseAttempt = function(v21, v22)
        v12:report("purchaseAttemptItem", {
            itemType = v21, 
            itemID = v22
        });
    end;
    v12.reportPurchaseSuccess = function(v23, v24)
        v12:report("purchaseSuccessItem", {
            itemType = v23, 
            itemID = v24
        });
    end;
    v12.reportItemDetailPageOpened = function(v25, v26)
        v12:report("itemDetailView", {
            itemType = v25, 
            itemID = v26
        });
    end;
    if v8() then
        v12.platformStr = (function()
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            local v28 = "Unknown";
            if l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows then
                return "Windows";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
                return "OSX";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
                return "IOS";
            else
                if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
                    local l_l_HttpService_0_UserAgent_0 = l_HttpService_0:GetUserAgent();
                    v28 = not string.find(l_l_HttpService_0_UserAgent_0, "AmazonAppStore") and "Android" or "Amazon";
                    if string.find(l_l_HttpService_0_UserAgent_0, "OculusQuest3Store") then
                        return "Quest";
                    end;
                elseif not (l_l_UserInputService_0_Platform_0 ~= Enum.Platform.XBoxOne) or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBox360 then
                    return "XBox";
                elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP then
                    return "UWP";
                elseif not (l_l_UserInputService_0_Platform_0 ~= Enum.Platform.PS4 and l_l_UserInputService_0_Platform_0 ~= Enum.Platform.PS3) or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS5 then
                    v28 = "PlayStation";
                end;
                return v28;
            end;
        end)();
        v12.sendCounter = function(v30)
            if not l_RunService_0:IsStudio() then
                l_RbxAnalyticsService_0:ReportCounter("inspectAndBuy" .. "_" .. v12.platformStr .. "_" .. v30);
                return ;
            else
                return ;
            end;
        end;
    end;
    return v12;
end;
v9.report = function(v31, v32, v33)
    v31.eventStream:sendEventDeferred(v31.ctx, v32, (v3.Dictionary.join({
        pid = v31.pid, 
        uid = v31.uid, 
        inspecteeUid = v31.inspecteeUid, 
        feature = "inspectAndBuy"
    }, v33)));
end;
return v9;

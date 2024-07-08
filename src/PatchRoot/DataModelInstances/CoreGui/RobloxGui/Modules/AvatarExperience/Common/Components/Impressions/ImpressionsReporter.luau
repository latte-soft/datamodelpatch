local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CollectionService_0 = game:GetService("CollectionService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsUtil);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsSchema);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsEnums);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.AvatarExperienceScreenSizeImpressionsDetector);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.AvatarExperiencePointsTelemetry);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v11 = game:DefineFastFlag("EnableImpressionReporterCounter3", false);
local v12 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v13 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_ITEM_IMPRESSION_0 = v7.ActionType.ITEM_IMPRESSION;
return function(v15)
    local v16 = v13(v12);
    local v17 = if not v11 then nil else v13(v10);
    local v18, v19 = v3.useState(0);
    local v20 = v3.useState({});
    v3.useEffect(function()
        task.delay(1, function()
            v19(v18 + v4.ImpressionsDetectionInterval);
        end);
    end, {
        v18
    });
    return v3.createElement(v8, {
        parentRef = v15.parentRef, 
        pageFilter = v15.pageFilter, 
        onRequestImpressionsSignal = v15.onRequestImpressionsSignal, 
        collectObjectsFunc = function(_)
            return l_CollectionService_0:GetTagged(v15.impressionsTag);
        end, 
        filterImpressionFunc = function(v22)
            local l_v22_Attribute_0 = v22:GetAttribute(v15.impressionsTag);
            return l_v22_Attribute_0 and not v20[l_v22_Attribute_0];
        end, 
        onImpressionsDetected = function(v24)
            for _, v26 in v24, nil, nil do
                v20[v26:GetAttribute(v15.impressionsTag)] = true;
            end;
            local v27 = v5.packEvents(v6[v15.impressionsSchema], v24);
            if v27 then
                for _, v29 in v27, nil, nil do
                    local v30 = nil;
                    v30 = if not v15.eventNamePrefix then v15.eventName else v15.eventNamePrefix .. v15.eventName;
                    v29.requestId = v15.requestId;
                    v29.actionType = l_ITEM_IMPRESSION_0;
                    if v11 then
                        v17.sendCounter("AvatarCatalogImpressionReported");
                        v9.sendTelemetryEvent("Impression", {
                            id = v15.requestId
                        });
                    end;
                    v16:sendEventDeferred(v15.eventContext, v30, v29);
                end;
            end;
        end
    });
end;

local l_CorePackages_0 = game:GetService("CorePackages");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v2 = require(l_CorePackages_0.Cryo);
local _ = require(l_CorePackages_0.Workspace.Packages.TnSAvatarIdentification);
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local v5 = {
    EventType = {
        AvatarsIdentified = "ReportAnythingAvatarsIdentified"
    }, 
    Context = {
        LegacyMenu = "ReportAbuseLegacyMenu"
    }
};
local function _()
    return {
        annotationOptionSeenCount = 0, 
        annotationPageSeenCount = 0, 
        annotationPlaceCount = 0, 
        annotationUndoCount = 0, 
        annotationRedoCount = 0, 
        abandonedForRetake = false, 
        isPortraitMode = false
    };
end;
local v7 = {
    annotationOptionSeenCount = 0, 
    annotationPageSeenCount = 0, 
    annotationPlaceCount = 0, 
    annotationUndoCount = 0, 
    annotationRedoCount = 0, 
    abandonedForRetake = false, 
    isPortraitMode = false
};
local v8 = nil;
local function _()
    if not v8 then
        v8 = l_EventIngest_0.new(l_EventIngestService_0);
    end;
    return v8;
end;
return {
    incrementAnnotationOptionSeen = function()
        local l_v7_0 = v7;
        l_v7_0.annotationOptionSeenCount = l_v7_0.annotationOptionSeenCount + 1;
    end, 
    incrementAnnotationPageSeen = function()
        local l_v7_1 = v7;
        l_v7_1.annotationPageSeenCount = l_v7_1.annotationPageSeenCount + 1;
    end, 
    incrementAnnotationPlace = function()
        local l_v7_2 = v7;
        l_v7_2.annotationPlaceCount = l_v7_2.annotationPlaceCount + 1;
    end, 
    incrementAnnotationUndo = function()
        local l_v7_3 = v7;
        l_v7_3.annotationUndoCount = l_v7_3.annotationUndoCount + 1;
    end, 
    incrementAnnotationRedo = function()
        local l_v7_4 = v7;
        l_v7_4.annotationRedoCount = l_v7_4.annotationRedoCount + 1;
    end, 
    setAbandonedForRetake = function()
        v7.abandonedForRetake = true;
    end, 
    setIsPortraitMode = function()
        v7.isPortraitMode = true;
    end, 
    getAccumulatedParameters = function()
        return v7;
    end, 
    emitAvatarsIdentifiedStats = function(v15)
        local v16 = v2.Dictionary.join(v15, {
            duration = v15.duration * 1000000
        });
        if not v8 then
            v8 = l_EventIngest_0.new(l_EventIngestService_0);
        end;
        v8:sendEventDeferred(v5.Context.LegacyMenu, v5.EventType.AvatarsIdentified, v16);
    end, 
    clear = function()
        v7 = {
            annotationOptionSeenCount = 0, 
            annotationPageSeenCount = 0, 
            annotationPlaceCount = 0, 
            annotationUndoCount = 0, 
            annotationRedoCount = 0, 
            abandonedForRetake = false, 
            isPortraitMode = false
        };
    end
};

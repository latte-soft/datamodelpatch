local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.AvatarIdentification);
local l_EventIngest_0 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest;
local v6 = {
    EventType = {
        AvatarsIdentified = "ReportAnythingAvatarsIdentified"
    }, 
    Context = {
        LegacyMenu = "ReportAbuseLegacyMenu"
    }
};
local function _()
    return {
        previewBackCount = 0, 
        previewAttachCount = 0, 
        retakeCount = 0, 
        retakeAbandon = false, 
        highlightSceneCount = 0, 
        annotationBackCount = 0, 
        annotationPlaceCount = 0, 
        annotationUndoCount = 0, 
        annotationRedoCount = 0, 
        annotationNext = false
    };
end;
local v8 = {
    previewBackCount = 0, 
    previewAttachCount = 0, 
    retakeCount = 0, 
    retakeAbandon = false, 
    highlightSceneCount = 0, 
    annotationBackCount = 0, 
    annotationPlaceCount = 0, 
    annotationUndoCount = 0, 
    annotationRedoCount = 0, 
    annotationNext = false
};
local v9 = nil;
local function _()
    if not v9 then
        v9 = l_EventIngest_0.new(l_EventIngestService_0);
    end;
    return v9;
end;
return {
    incrementPreviewBack = function()
        local l_v8_0 = v8;
        l_v8_0.previewBackCount = l_v8_0.previewBackCount + 1;
    end, 
    incrementPreviewAttach = function()
        local l_v8_1 = v8;
        l_v8_1.previewAttachCount = l_v8_1.previewAttachCount + 1;
    end, 
    incrementRetake = function()
        local l_v8_2 = v8;
        l_v8_2.retakeCount = l_v8_2.retakeCount + 1;
    end, 
    setRetakeAbandon = function()
        v8.retakeAbandon = true;
    end, 
    incrementHighlightScene = function()
        local l_v8_3 = v8;
        l_v8_3.highlightSceneCount = l_v8_3.highlightSceneCount + 1;
    end, 
    incrementAnnotationBack = function()
        local l_v8_4 = v8;
        l_v8_4.annotationBackCount = l_v8_4.annotationBackCount + 1;
    end, 
    incrementAnnotationPlace = function()
        local l_v8_5 = v8;
        l_v8_5.annotationPlaceCount = l_v8_5.annotationPlaceCount + 1;
    end, 
    incrementAnnotationUndo = function()
        local l_v8_6 = v8;
        l_v8_6.annotationUndoCount = l_v8_6.annotationUndoCount + 1;
    end, 
    incrementAnnotationRedo = function()
        local l_v8_7 = v8;
        l_v8_7.annotationRedoCount = l_v8_7.annotationRedoCount + 1;
    end, 
    setAnnotationNext = function()
        v8.annotationNext = true;
    end, 
    getAccumulatedParameters = function()
        return v8;
    end, 
    emitAvatarsIdentifiedStats = function(v19)
        local v20 = v3.Dictionary.join(v19, {
            duration = v19.duration * 1000000
        });
        if not v9 then
            v9 = l_EventIngest_0.new(l_EventIngestService_0);
        end;
        v9:sendEventDeferred(v6.Context.LegacyMenu, v6.EventType.AvatarsIdentified, v20);
    end, 
    clear = function()
        v8 = {
            previewBackCount = 0, 
            previewAttachCount = 0, 
            retakeCount = 0, 
            retakeAbandon = false, 
            highlightSceneCount = 0, 
            annotationBackCount = 0, 
            annotationPlaceCount = 0, 
            annotationUndoCount = 0, 
            annotationRedoCount = 0, 
            annotationNext = false
        };
    end
};

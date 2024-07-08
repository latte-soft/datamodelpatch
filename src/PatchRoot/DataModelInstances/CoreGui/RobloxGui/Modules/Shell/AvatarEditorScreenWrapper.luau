local v0 = require(script.Parent.Analytics);
return {
    Show = function(_)
    end, 
    RemoveFocus = function(_)
    end, 
    Hide = function(_)
    end, 
    Focus = function(_)
    end, 
    SetParent = function(_)
    end, 
    GetAnalyticsInfo = function(_)
        return {
            [v0.WidgetNames("WidgetId")] = v0.WidgetNames("AvatarEditorScreenId")
        };
    end
};

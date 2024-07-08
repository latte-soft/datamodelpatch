local l_DeviceType_0 = require(script.Parent.Parent.Parent.Style.Constants).DeviceType;
local v1 = {
    [l_DeviceType_0.Desktop] = {
        startingOffsetPosition = 500, 
        thumbnailHeight = 200, 
        dualPanelBreakpoint = 1280, 
        headerBarBackgroundHeight = 80, 
        sideMargin = 48
    }, 
    [l_DeviceType_0.Tablet] = {
        startingOffsetPosition = 200, 
        thumbnailHeight = 150, 
        dualPanelBreakpoint = math.huge, 
        headerBarBackgroundHeight = 80, 
        sideMargin = 48
    }, 
    [l_DeviceType_0.Phone] = {
        startingOffsetPosition = 250, 
        thumbnailHeight = 100, 
        dualPanelBreakpoint = math.huge, 
        headerBarBackgroundHeight = 24, 
        sideMargin = 24
    }, 
    [l_DeviceType_0.Console] = {
        startingOffsetPosition = 500, 
        thumbnailHeight = 200, 
        dualPanelBreakpoint = 1280, 
        headerBarBackgroundHeight = 80, 
        sideMargin = 48
    }, 
    [l_DeviceType_0.VR] = {
        startingOffsetPosition = 500, 
        thumbnailHeight = 200, 
        dualPanelBreakpoint = 1280, 
        headerBarBackgroundHeight = 80, 
        sideMargin = 48
    }
};
return function(v2)
    local v3 = v1[v2];
    if v3 == nil then
        return v1[l_DeviceType_0.Desktop];
    else
        return v3;
    end;
end;

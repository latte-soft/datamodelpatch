local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local l_useDispatch_0 = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useDispatch;
local v4 = require(l_Parent_0.Enums.CaptureType);
local v5 = require(l_Parent_0.Actions.CarouselOpened);
local v6 = require(l_Parent_0.Analytics.EventNames);
local _ = require(l_Parent_0.Types);
local v8 = require(l_Parent_0.Analytics.useAnalytics);
return function(v9)
    local v10 = v8();
    local v11 = l_useDispatch_0();
    local v12, v13 = v2.useState(UDim2.fromScale(1, 1));
    return v2.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Image = if v9.capture.type == v4.Screenshot then v9.capture.contentId else nil, 
        ScaleType = Enum.ScaleType.Crop, 
        Size = UDim2.fromScale(1, 1), 
        [v2.Event.Activated] = v2.useCallback(function()
            v10.fireEvent(v6.CapturesCarouselOpened);
            v11(v5(v9.captureIndex));
        end, {})
    }, {
        VideoPreview = if v9.capture.type == v4.Video then v2.createElement("VideoFrame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Playing = false, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = v12, 
            Video = v9.capture.contentId, 
            [v2.Event.Loaded] = v2.useCallback(function(v14)
                local l_Resolution_0 = v14.Resolution;
                v13(UDim2.fromOffset(l_Resolution_0.X, l_Resolution_0.Y));
            end, {})
        }) else nil
    });
end;

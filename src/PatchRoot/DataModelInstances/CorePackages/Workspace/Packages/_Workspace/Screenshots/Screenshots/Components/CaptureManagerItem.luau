local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.UIBlox);
local l_Checkbox_0 = v5.App.InputButton.Checkbox;
local l_Images_0 = v5.App.ImageSet.Images;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local v10 = require(l_Parent_0.Enums.CaptureType);
local v11 = require(l_Parent_0.Analytics.EventNames);
local v12 = require(l_Parent_0.Thunks.SelectCapture);
local _ = require(l_Parent_0.Types);
local v14 = require(l_Parent_0.Analytics.useAnalytics);
local v15 = require(l_Parent_0.Flags.FFlagCaptureStorageBulkManagementM2Enabled);
local v16 = not v15 and 0.8 or 0.5;
return function(v17)
    local v18 = v14();
    local v19 = l_useDispatch_0();
    local v20, v21 = v3.useState(UDim2.fromScale(1, 1));
    local v22, v23 = v3.useState(false);
    local v25 = l_useSelector_0(function(v24)
        return v24.Screenshots.CaptureManager.SelectedCaptures;
    end);
    local v26 = v3.useCallback(function()
        v23(not v22);
        v18.fireEvent(v11.CapturesManagerItemActivated);
        v19(v12(v17.capture));
    end, {
        v22, 
        v17.capture
    });
    local v29 = v3.useCallback(function(v27)
        local l_Resolution_0 = v27.Resolution;
        v21(UDim2.fromOffset(l_Resolution_0.X, l_Resolution_0.Y));
    end, {});
    v3.useEffect(function()
        v23(v2.List.find(v25, v17.capture) ~= nil);
    end, {
        v25, 
        v17.capture
    });
    return v3.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Image = if v17.capture.type == v10.Screenshot then v17.capture.contentId else nil, 
        ImageTransparency = not v22 and 0 or v16, 
        ScaleType = Enum.ScaleType.Crop, 
        Size = UDim2.fromScale(1, 1), 
        [v3.Event.Activated] = v26
    }, {
        CheckboxFrame = if not v15 then nil else v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(1, -34, 0, 8), 
            Size = UDim2.fromOffset(26, 26)
        }, {
            Checkbox = if not v22 then v3.createElement("ImageButton", {
                BackgroundTransparency = 1, 
                Image = l_Images_0["squircles/hollow"].Image, 
                ImageRectOffset = l_Images_0["squircles/hollow"].ImageRectOffset, 
                ImageRectSize = l_Images_0["squircles/hollow"].ImageRectSize, 
                ImageTransparency = 0.7, 
                Size = UDim2.fromOffset(26, 26), 
                [v3.Event.Activated] = v26
            }) else v3.createElement(l_Checkbox_0, {
                isSelected = true, 
                isDisabled = false, 
                layoutOrder = 1, 
                text = "", 
                onActivated = v26
            })
        }), 
        VideoPreview = if v17.capture.type == v10.Video then v3.createElement("VideoFrame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Playing = false, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = v20, 
            Video = v17.capture.contentId, 
            [v3.Event.Loaded] = v29
        }) else nil
    });
end;

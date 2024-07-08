local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.AppCommonLib);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RobloxAppHooks);
local v5 = require(l_Parent_1.UIBlox);
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_memoize_0 = v2.memoize;
local l_useScreenSize_0 = v4.useScreenSize;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v10 = require(l_Parent_0.Enums.CaptureType);
local v11 = require(l_Parent_0.Utils.getCaptureSize);
local _ = require(l_Parent_0.Types);
local l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 = require(l_Parent_1.SharedFlags).FFlagCapturesCarouselCTABarUIUpdateEnabled;
local v24 = l_memoize_0(function(v14, v15, v16)
    local v17 = v14.X / v14.Y;
    local v18 = v15.X / v15.Y;
    if not l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 then
        if math.abs(v17 - v18) < 0.35 then
            return v15;
        else
            local v19 = v17 < 1;
            local v20 = v18 < 1;
            if not (not v19 or v20) then
                local l_Y_0 = v16.Y;
                return Vector2.new(math.floor(l_Y_0 * v17), l_Y_0);
            end;
        end;
    end;
    local l_X_0 = v15.X;
    local v23 = math.floor(l_X_0 / v17);
    if l_FFlagCapturesCarouselCTABarUIUpdateEnabled_0 and v15.Y < v23 then
        v23 = v15.Y;
        l_X_0 = math.floor(v23 * v17);
    end;
    return Vector2.new(l_X_0, v23);
end);
local function _(v25)
    return UDim2.fromScale(v25, v25);
end;
local function v28(v27)
    if not l_UserGameSettings_0.ReducedMotion then
        return 1;
    else
        return v27;
    end;
end;
local function v30(v29)
    if not l_UserGameSettings_0.ReducedMotion then
        return (UDim2.fromScale(v29, v29));
    else
        return (UDim2.fromScale(1, 1));
    end;
end;
return function(v31)
    local v32 = l_useStyle_0();
    local l_itemSize_0 = v31.itemSize;
    local v34, v35 = v3.useBinding(0);
    local v36, v37 = v3.useState(Vector2.new(0, 0));
    local v38 = l_useScreenSize_0();
    local l_imagePadding_0 = v31.imagePadding;
    local l_itemIndex_0 = v31.itemIndex;
    local v42 = v3.useCallback(function(v41)
        v35(v41.AbsolutePosition.X);
    end, {
        v35
    });
    v3.useEffect(function()
        if v31.capture.type == v10.Video then
            return ;
        else
            task.spawn(function()
                local v43 = v11(v31.capture.contentId);
                if not v43 then
                    v37(l_itemSize_0);
                    return ;
                else
                    v37(v43);
                    return ;
                end;
            end);
            return ;
        end;
    end, {
        l_itemSize_0, 
        v31.capture
    });
    local v46 = v3.useCallback(function(v44)
        local l_Resolution_0 = v44.Resolution;
        v37(Vector2.new(l_Resolution_0.X, l_Resolution_0.Y));
    end, {});
    local v52 = v3.useCallback(function(v47)
        local v48 = l_itemSize_0.X / 2;
        local v49 = v38.X / 2;
        local v50 = v47 + v48;
        local v51 = math.abs(v49 - v50);
        return math.sign(v49 - v50), (math.min(1, (v51 < 25 and 0 or v51 - 25) / (l_itemSize_0.X - 25)));
    end, {
        l_itemSize_0, 
        l_itemIndex_0, 
        v38
    });
    local v58 = v3.useCallback(function(v53)
        local _, v55 = v52(v53);
        local v56 = v24(v36, l_itemSize_0, v38);
        if v55 == 0 then
            return UDim2.fromOffset(v56.X, v56.Y);
        else
            local v57 = 1 - v55 * (1 - v31.unfocusedSizeMultiplier);
            return UDim2.fromOffset(math.floor(v56.X * v57), (math.floor(v56.Y * v57)));
        end;
    end, {
        v36, 
        l_itemSize_0, 
        v38, 
        v31.unfocusedSizeMultiplier, 
        v52
    });
    local v62 = v3.useCallback(function(v59)
        local v60, v61 = v52(v59);
        if v61 == 0 then
            return UDim2.fromScale(0.5, 0.5);
        else
            return UDim2.new(0.5, (((l_itemSize_0.X / 2 - l_imagePadding_0) - v58(v59).X.Offset / 2) * v61) * v60, 0.5, 0);
        end;
    end, {
        v36, 
        l_imagePadding_0, 
        l_itemSize_0, 
        v38, 
        v52, 
        v58
    });
    local l_Transparency_0 = v32.Theme.Overlay.Transparency;
    local v67 = v3.useCallback(function(v64)
        local _, v66 = v52(v64);
        return 1 - (1 - l_Transparency_0) * v66;
    end, {
        l_Transparency_0, 
        v52
    });
    return v3.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromScale(1, 1), 
        [v3.Change.AbsolutePosition] = v42
    }, {
        CaptureContainer = v3.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Position = v34:map(v62), 
            Size = v34:map(v58)
        }, {
            CaptureImage = if v31.capture.type == v10.Screenshot then v3.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v31.capture.contentId, 
                Position = UDim2.fromScale(0.5, 0.5), 
                ScaleType = Enum.ScaleType.Crop, 
                Size = if not v31.fadeOutBinding then UDim2.fromScale(1, 1) else v31.fadeOutBinding:map(v30), 
                Visible = v36 ~= Vector2.new(0, 0), 
                ZIndex = 1
            }) else nil, 
            CaptureVideo = if v31.capture.type == v10.Video then v3.createElement("VideoFrame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Playing = v34:map(function(v68)
                    local _, v70 = v52(v68);
                    return v70 < 0.5;
                end), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Looped = true, 
                Size = if not v31.fadeOutBinding then UDim2.fromScale(1, 1) else v31.fadeOutBinding:map(v30), 
                Video = v31.capture.contentId, 
                Volume = 0, 
                ZIndex = 1, 
                [v3.Event.Loaded] = v46
            }) else nil, 
            Overlay = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundColor3 = v32.Theme.Overlay.Color, 
                BackgroundTransparency = v3.joinBindings({
                    absoluteXPosition = v34, 
                    fadeOutBinding = v31.fadeOutBinding
                }):map((v3.useCallback(function(v71)
                    local l_absoluteXPosition_0 = v71.absoluteXPosition;
                    local l_fadeOutBinding_0 = v71.fadeOutBinding;
                    if not l_UserGameSettings_0.ReducedMotion or not l_fadeOutBinding_0 then
                        if not l_fadeOutBinding_0 then
                            return v67(l_absoluteXPosition_0);
                        else
                            return (math.min(v67(l_absoluteXPosition_0), l_fadeOutBinding_0));
                        end;
                    else
                        return 1;
                    end;
                end, {
                    v67
                }))), 
                BorderSizePixel = 0, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = if not v31.fadeOutBinding then UDim2.fromScale(1, 1) else v31.fadeOutBinding:map(v30), 
                ZIndex = 2
            }), 
            TransitionOverlay = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundColor3 = v32.Theme.BackgroundContrast.Color, 
                BackgroundTransparency = not v31.transitionBinding and 1 or v31.transitionBinding:map(v28), 
                BorderSizePixel = 0, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 3
            })
        })
    });
end;

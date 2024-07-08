local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactGamepad);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.RobloxTranslator);
local l_EmoteUtility_0 = require(l_CorePackages_0.Thumbnailing).EmoteUtility;
local v6 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v6.Style.withStyle;
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_SystemSlider_0 = v6.App.Slider.SystemSlider;
local v11 = require(script.Parent.EmoteThumbnailParameters);
local v12 = require(script.Parent.EmoteThumbnailView);
local v13 = {
    CurveAnimationTimeIncrements = 0.01
};
local v14 = {
    Rotation = {
        Precision = 0, 
        Range = NumberRange.new(0, 360), 
        Default = 0, 
        Increments = 361
    }
};
local v15 = v1.PureComponent:extend("EmoteThumbnailEditor");
v15.validateProps = v3.strictInterface({
    screenSize = v3.Vector2, 
    animationClip = v3.instanceIsA("AnimationClip"), 
    initialThumbnailParameters = v3.optional(v11.validate), 
    closePromptCallback = v3.callback, 
    updateThumbnailCallback = v3.callback
});
v15.init = function(v16)
    v16:setState({
        thumbnailParameters = v16.props.initialThumbnailParameters or v11.defaultParameters
    });
    v16.onCancelPressed = function()
        v16.props.closePromptCallback();
    end;
    v16.onUpdatePressed = function()
        v16.props.updateThumbnailCallback(v16.state.thumbnailParameters);
        v16.props.closePromptCallback();
    end;
    v16.onRotateChanged = function(v17)
        local v18 = table.clone(v16.state.thumbnailParameters);
        v18.thumbnailCharacterRotation = v17;
        v16:updateThumbnailParameters(v18);
    end;
    v16.onKeyframeOrTimeChanged = function(v19)
        local v20 = table.clone(v16.state.thumbnailParameters);
        v20.thumbnailTime = v19;
        v20.thumbnailKeyframe = v19;
        v16:updateThumbnailParameters(v20);
    end;
    v16.rotationSliderRef = v1.createRef();
    v16.timeSliderRef = v1.createRef();
    v16:updateSliderValuesForAnimationClip();
end;
v15.updateSliderValuesForAnimationClip = function(v21)
    local l_props_0 = v21.props;
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    if not l_props_0.animationClip:IsA("KeyframeSequence") then
        if not l_props_0.animationClip:IsA("CurveAnimation") then
            error("Unsupported animation type:", l_props_0.animationClip.ClassName);
        else
            local v26 = math.floor(l_EmoteUtility_0.GetCurveAnimationTimeLength(l_props_0.animationClip) / v13.CurveAnimationTimeIncrements);
            v23 = 0;
            v24 = v26 * v13.CurveAnimationTimeIncrements;
            v25 = v13.CurveAnimationTimeIncrements;
        end;
    else
        local l_Keyframes_0 = l_props_0.animationClip:GetKeyframes();
        v23 = 1;
        v24 = #l_Keyframes_0;
        v25 = 1;
    end;
    v21:setState({
        timeSliderMin = v23, 
        timeSliderMax = v24, 
        timeSliderStepInterval = v25
    });
end;
v15.updateThumbnailParameters = function(v28, v29)
    v28:setState({
        thumbnailParameters = v29
    });
end;
v15.renderMiddle = function(v30, v31)
    return l_withStyle_0(function(v32)
        local l_Font_0 = v32.Font;
        local l_Theme_0 = v32.Theme;
        local v35 = v30.props.screenSize.Y > 481;
        local v36 = {};
        if not v35 then
            v36.contentSize = UDim2.new(1, 0, 0, 150);
            v36.thumbnailPosition = UDim2.new(0, 0, 0, 0);
            v36.thumbnailAnchorPoint = Vector2.new(0, 0);
            v36.leversPosition = UDim2.new(0, 160, 0, 0);
            v36.leversSize = UDim2.new(1, -160, 0, 102);
        else
            v36.contentSize = UDim2.new(1, 0, 0, 262);
            v36.thumbnailPosition = UDim2.new(0.5, 0, 0, 0);
            v36.thumbnailAnchorPoint = Vector2.new(0.5, 0);
            v36.leversPosition = UDim2.new(0, 0, 0, 160);
            v36.leversSize = UDim2.new(1, 0, 0, 102);
        end;
        local l_thumbnailParameters_0 = v30.state.thumbnailParameters;
        local l_thumbnailKeyframe_0 = l_thumbnailParameters_0.thumbnailKeyframe;
        local l_thumbnailCharacterRotation_0 = l_thumbnailParameters_0.thumbnailCharacterRotation;
        local function _(v40)
            return (v40.Range.Max - v40.Range.Min) / (v40.Increments - 1);
        end;
        local l_createElement_0 = v1.createElement;
        local l_Frame_0 = v2.Focusable.Frame;
        local v44 = {
            Size = v36.contentSize, 
            BackgroundColor3 = Color3.new(1, 0, 1), 
            BackgroundTransparency = 1, 
            [v1.Ref] = v30.middleContentRef
        };
        local v45 = {};
        local l_createElement_1 = v1.createElement;
        local v47 = "Frame";
        local v48 = {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        };
        local v49 = {
            ThumbnailViewParent = v1.createElement("Frame", {
                LayoutOrder = 0, 
                Position = v36.thumbnailPosition, 
                AnchorPoint = v36.thumbnailAnchorPoint, 
                Size = UDim2.new(0, 150, 0, 150), 
                BackgroundColor3 = Color3.new(1, 1, 0), 
                BackgroundTransparency = 1
            }, {
                EmoteThumbnailView = v1.createElement(v12, {
                    position = UDim2.new(0.5, 0, 0.5, 0), 
                    anchorPoint = Vector2.new(0.5, 0.5), 
                    animationClip = v30.props.animationClip, 
                    thumbnailParameters = v30.state.thumbnailParameters
                })
            })
        };
        local l_createElement_2 = v1.createElement;
        local v51 = "Frame";
        local v52 = {
            LayoutOrder = 1, 
            Size = v36.leversSize, 
            AnchorPoint = Vector2.new(0, 0), 
            Position = v36.leversPosition, 
            BackgroundColor3 = Color3.new(1, 0, 0), 
            BackgroundTransparency = 1
        };
        local v53 = {
            ListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            FrameDescriptionLabel = v1.createElement("TextLabel", {
                LayoutOrder = 0, 
                Size = UDim2.new(1, 0, 0, 15), 
                Font = l_Font_0.Body.Font, 
                TextSize = 12, 
                Text = v31.timeLabelText, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            TimeSlider = v1.createElement(l_SystemSlider_0, {
                layoutOrder = 1, 
                min = v30.state.timeSliderMin, 
                max = v30.state.timeSliderMax, 
                stepInterval = v30.state.timeSliderStepInterval, 
                value = l_thumbnailKeyframe_0, 
                onValueChanged = v30.onKeyframeOrTimeChanged, 
                width = UDim.new(1, 0), 
                position = UDim2.new(0, 0, 0.5, 0), 
                anchorPoint = Vector2.new(0, 0.5), 
                NextSelectionDown = v30.rotationSliderRef, 
                [v1.Ref] = v30.timeSliderRef
            }), 
            RotationDescriptionLabel = v1.createElement("TextLabel", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 15), 
                Font = l_Font_0.Body.Font, 
                TextSize = 12, 
                Text = v31.rotationLabelText, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        };
        local l_createElement_3 = v1.createElement;
        local l_l_SystemSlider_0_0 = l_SystemSlider_0;
        local v56 = {
            layoutOrder = 3, 
            min = v14.Rotation.Range.Min, 
            max = v14.Rotation.Range.Max
        };
        local l_Rotation_0 = v14.Rotation;
        v56.stepInterval = (l_Rotation_0.Range.Max - l_Rotation_0.Range.Min) / (l_Rotation_0.Increments - 1);
        v56.value = l_thumbnailCharacterRotation_0;
        v56.onValueChanged = v30.onRotateChanged;
        v56.width = UDim.new(1, 0);
        v56.position = UDim2.new(0, 0, 0.5, 0);
        v56.anchorPoint = Vector2.new(0, 0.5);
        v56.NextSelectionUp = v30.timeSliderRef;
        v56[v1.Ref] = v30.rotationSliderRef;
        v53.RotationSlider = l_createElement_3(l_l_SystemSlider_0_0, v56);
        v49.Levers = l_createElement_2(v51, v52, v53);
        v45.TopSection = l_createElement_1(v47, v48, v49);
        return l_createElement_0(l_Frame_0, v44, v45);
    end);
end;
v15.renderAlertLocalized = function(v58, v59)
    return v1.createElement(l_InteractiveAlert_0, {
        title = v59.titleText or "", 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v58.onCancelPressed, 
                        text = v59.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v58.onUpdatePressed, 
                        text = v59.updateButtonText
                    }, 
                    isDefaultChild = false
                }
            }
        }, 
        middleContent = function()
            return v58:renderMiddle(v59);
        end, 
        screenSize = v58.props.screenSize, 
        defaultChildRef = v58.props.defaultChildRef, 
        isMiddleContentFocusable = true
    });
end;
local function v60()
    return {
        cancelButtonText = v4:FormatByKey("CoreScripts.EmoteThumbnailEditor.Action.Cancel"), 
        updateButtonText = v4:FormatByKey("CoreScripts.EmoteThumbnailEditor.Action.Update"), 
        titleText = v4:FormatByKey("CoreScripts.EmoteThumbnailEditor.Heading.EditThumbnail"), 
        rotationLabelText = v4:FormatByKey("CoreScripts.EmoteThumbnailEditor.Label.Rotation"), 
        timeLabelText = v4:FormatByKey("CoreScripts.EmoteThumbnailEditor.Label.Time")
    };
end;
v15.render = function(v61)
    return v61:renderAlertLocalized((v60()));
end;
return v15;

local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectButtonSliderValue);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetBodyColor3);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectRangeIdForSelectedBodyParts);
local v13 = require(l_Modules_0.AvatarExperience.Common.Context.useBodyDataCallbacksContext);
local v14 = require(l_CorePackages_0.Cryo);
local v15 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v15.Core.Style.withStyle;
local l_SystemSlider_0 = v15.App.Slider.SystemSlider;
local v18 = v2.PureComponent:extend("BodyColorsSliderFrame");
local v19 = Color3.new(0.75, 0.75, 0.75);
local v20 = game:DefineFastFlag("SendColorPickerAnalytics", false);
local l_GetFFlagColorPickerSliderOptimization_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagColorPickerSliderOptimization;
local v22 = require(l_Modules_0.AvatarExperience.Flags.FFlagColorPickerUseParentProps);
local v23 = game:DefineFastFlag("ColorPickerOnDragWhenMounted", false);
v18.validateProps = v4.strictInterface({
    selectedBodyPartIndex = if not v20 then nil else v4.optional(v4.number), 
    sliderValue = v4.number, 
    rangeStruct = v4.optional(v4.table), 
    setBodyColor3 = v4.optional(v4.callback), 
    setBodyColors = if not l_GetFFlagColorPickerSliderOptimization_0() then nil else v4.optional(v4.callback), 
    NextSelectionUp = v4.optional(v4.table), 
    sliderRef = v4.optional(v4.table), 
    gridAndSidebarFrameSizeBinding = v4.union(v4.UDim2, v4.table), 
    rangeIdForSelectedBodyParts = v4.optional(v4.string), 
    defaultBodyColorRanges = v4.optional(v4.table), 
    analytics = v4.table
});
v18.init = function(v24)
    if l_GetFFlagColorPickerSliderOptimization_0() then
        v24.state = {
            sliderValue = v24.props.sliderValue
        };
    end;
    v24.onSliderChanged = function(v25)
        local v26 = v7.getColor3AtValueForRangeId(v24.props.rangeIdForSelectedBodyParts, v25, v24.props.defaultBodyColorRanges);
        if not l_GetFFlagColorPickerSliderOptimization_0() then
            v24.props.setBodyColor3(v26, v24.props.rangeIdForSelectedBodyParts, v25, v24.props.analytics);
            return ;
        else
            v24:setState({
                sliderValue = v25
            });
            v24.props.setBodyColors(v26);
            return ;
        end;
    end;
    v24.onDragEnd = function()
        if not (not (v23 and v24.isMounted) and v23) then
            local l_sliderValue_0 = v24.state.sliderValue;
            local v28 = v7.getColor3AtValueForRangeId(v24.props.rangeIdForSelectedBodyParts, l_sliderValue_0, v24.props.defaultBodyColorRanges);
            if v20 then
                v24.props.analytics.colorPickerChanged(v24.props.rangeIdForSelectedBodyParts, v28, v24.props.selectedBodyPartIndex);
            end;
            if l_GetFFlagColorPickerSliderOptimization_0() then
                v24.props.setBodyColors(nil);
                v24.props.setBodyColor3(v28, v24.props.rangeIdForSelectedBodyParts, l_sliderValue_0, v24.props.analytics);
            end;
        end;
    end;
end;
if l_GetFFlagColorPickerSliderOptimization_0() then
    v18.didMount = function(v29)
        v29:setState({
            sliderValue = v29.props.sliderValue
        });
        if v23 then
            v29.isMounted = true;
        end;
    end;
    v18.didUpdate = function(v30, v31)
        if v31.sliderValue ~= v30.props.sliderValue then
            v30:setState({
                sliderValue = v30.props.sliderValue
            });
        end;
    end;
end;
v18.getCustomKnobColorLower = function(v32)
    return (v7.getColor3AtValueForRangeId(v32.props.rangeIdForSelectedBodyParts, if not l_GetFFlagColorPickerSliderOptimization_0() then v32.props.sliderValue else v32.state.sliderValue, v32.props.defaultBodyColorRanges));
end;
v18.renderTrack = function(v33)
    local l_rangeStruct_0 = v33.props.rangeStruct;
    if l_rangeStruct_0 then
        local v35 = {};
        for v36, v37 in l_rangeStruct_0.range, nil, nil do
            table.insert(v35, (ColorSequenceKeypoint.new((v36 - 1) / (#l_rangeStruct_0.range - 1), v37)));
        end;
        return v2.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, 0, 0, v6.BodyColorsSliderTrackHeight), 
            Position = UDim2.fromScale(0.5, 0.5), 
            BackgroundColor3 = v19
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }), 
            TrackContent = v2.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.new(1, -2, 0, v6.BodyColorsSliderTrackHeight - 2), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundColor3 = Color3.new(1, 1, 1)
            }, {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }), 
                UIGradient = v2.createElement("UIGradient", {
                    Color = ColorSequence.new(v35)
                })
            })
        });
    else
        return nil;
    end;
end;
v18.render = function(v38)
    return l_withStyle_0(function(v39)
        return v38:renderWithProviders(v39);
    end);
end;
v18.renderWithProviders = function(v40, v41)
    local l_Theme_0 = v41.Theme;
    return v2.createElement("Frame", {
        Size = v40.props.gridAndSidebarFrameSizeBinding:map(function(v43)
            return UDim2.new(1, -2 * v6.SkinColorSliderPadding, 0, -v43.Y.Offset);
        end), 
        Position = v40.props.gridAndSidebarFrameSizeBinding:map(function(v44)
            return UDim2.new(0, v6.SkinColorSliderPadding, 1, v44.Y.Offset);
        end), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color
    }, {
        Divider1 = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            BackgroundColor3 = l_Theme_0.Divider.Color, 
            BackgroundTransparency = l_Theme_0.Divider.Transparency
        }), 
        SliderBar = v2.createElement(l_SystemSlider_0, {
            min = 0, 
            max = 1, 
            stepInterval = 0.01, 
            value = if not l_GetFFlagColorPickerSliderOptimization_0() then v40.props.sliderValue else v40.state.sliderValue, 
            onValueChanged = v40.onSliderChanged, 
            onDragEnd = if v20 or l_GetFFlagColorPickerSliderOptimization_0() then v40.onDragEnd else nil, 
            width = UDim.new(1, 0), 
            position = UDim2.new(0.5, 0, 0, v6.BodyColorsSliderFrameHeight / 2), 
            anchorPoint = Vector2.new(0.5, 0.5), 
            customTrack = v40:renderTrack(), 
            customKnobColorLower = v40:getCustomKnobColorLower(), 
            customPressedKnobShadowTransparencyLower = 0.5, 
            customKnobBorderSize = 1, 
            customKnobBorderColor = v19, 
            [v2.Ref] = v40.props.sliderRef, 
            NextSelectionUp = v40.props.NextSelectionUp
        })
    });
end;
if v23 then
    v18.willUnmount = function(v45)
        v45.isMounted = false;
    end;
end;
v18 = v3.connect(function(v46, _)
    local l_AvatarExperience_0 = v46.AvatarExperience;
    local l_DefaultBodyColorRanges_0 = l_AvatarExperience_0.AvatarEditor.DefaultBodyColorRanges;
    local v50 = v12(v46);
    assert(v50, "rangeIdForSelectedBodyParts ~= nil.");
    local v51 = v7.getRangeStructForRangeId(v50, l_DefaultBodyColorRanges_0);
    assert(v51, "rangeStruct ~= nil.");
    return {
        rangeIdForSelectedBodyParts = if not v22 then v50 else nil, 
        defaultBodyColorRanges = if not v22 then l_DefaultBodyColorRanges_0 else nil, 
        selectedBodyPartIndex = if not v20 then nil else l_AvatarExperience_0.AvatarEditor.BodyColorPickerSettings.selectedBodyPartIndex, 
        rangeStruct = v51, 
        sliderValue = v10(l_AvatarExperience_0, v50)
    };
end, function(v52)
    return {
        setBodyColor3 = function(v53, v54, v55, v56)
            v52(v11(v53, v54, v55, v56));
        end
    };
end)((l_RoactServices_0.connect({
    analytics = v9
})(v18)));
if not l_GetFFlagColorPickerSliderOptimization_0() then
    return v18;
else
    return function(v57)
        return v5.createElement(v18, (v14.Dictionary.join(v13(), v57)));
    end;
end;

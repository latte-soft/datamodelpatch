local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.UIBlox);
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local l_Color_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Color;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyColors);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetBodyColor3);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendAnalytics);
local v15 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v16 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectRangeIdForSelectedBodyParts);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectButtonColor3);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectButtonSliderValue);
local v20 = require(l_Modules_0.AvatarExperience.Flags.ColorPickerSliderIXPTest);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_withStyle_0 = v5.Style.withStyle;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v25 = v3.PureComponent:extend("BodyColorButton");
local v26 = l_Images_0["icons/actions/selectOn"];
v25.validateProps = v2.strictInterface({
    rangeId = if not v20.isEnabled() then nil else v2.optional(v2.string), 
    brickId = if not v20.isEnabled() then v2.number else v2.optional(v2.number), 
    brickColor = if not v20.isEnabled() then v2.number else v2.optional(v2.number), 
    userId = v2.optional(v2.string), 
    selectedBodyPartColorIds = v2.optional(v2.table), 
    bodyColors = v2.optional(v2.table), 
    sliderValue = v2.optional(v2.number), 
    isBodyColorButtonSelected = v2.optional(v2.boolean), 
    buttonColor3 = v2.optional(v2.Color3), 
    setBodyColors = v2.optional(v2.callback), 
    sendAnalytics = v2.callback, 
    setBodyColor3 = v2.optional(v2.callback), 
    analytics = v2.table, 
    colorPickerSliderEnabled = v2.optional(v2.boolean)
});
v25.DEPRECATED_getBrickIdUsedByAllParts = function(v27)
    local l_bodyColors_0 = v27.props.bodyColors;
    local v29 = nil;
    for _, v31 in l_bodyColors_0, nil, nil do
        if v29 == nil then
            v29 = v31;
        elseif v29 ~= v31 then
            return nil;
        end;
    end;
    return v29;
end;
v25.DEPRECATED_getIsBodyPartSelected = function(v32, v33)
    local l_selectedBodyPartColorIds_0 = v32.props.selectedBodyPartColorIds;
    if l_selectedBodyPartColorIds_0 and #l_selectedBodyPartColorIds_0 > 0 then
        for _, v36 in l_selectedBodyPartColorIds_0, nil, nil do
            if v33 == v36 then
                return true;
            end;
        end;
        return false;
    else
        return true;
    end;
end;
v25.DEPRECATED_anySelectedBodyPartUsesThisColor = function(v37)
    local l_bodyColors_1 = v37.props.bodyColors;
    if l_bodyColors_1 then
        for v39, v40 in l_bodyColors_1, nil, nil do
            if v37:DEPRECATED_getIsBodyPartSelected(v39) and v40 == v37.props.brickId then
                return true;
            end;
        end;
    end;
    return false;
end;
v25.onActivated = function(v41)
    if not v41.props.colorPickerSliderEnabled then
        local l_sendAnalytics_0 = v41.props.sendAnalytics;
        local l_analytics_0 = v41.props.analytics;
        local l_selectedBodyPartColorIds_1 = v41.props.selectedBodyPartColorIds;
        local l_brickId_0 = v41.props.brickId;
        local l_bodyColors_2 = v41.props.bodyColors;
        local l_setBodyColors_0 = v41.props.setBodyColors;
        local l_l_bodyColors_2_0 = l_bodyColors_2;
        if l_selectedBodyPartColorIds_1 and #l_selectedBodyPartColorIds_1 > 0 then
            l_l_bodyColors_2_0 = table.clone(l_l_bodyColors_2_0);
            for _, v50 in l_selectedBodyPartColorIds_1, nil, nil do
                l_l_bodyColors_2_0[v50] = l_brickId_0;
            end;
        else
            l_l_bodyColors_2_0 = {
                headColorId = l_brickId_0, 
                leftArmColorId = l_brickId_0, 
                leftLegColorId = l_brickId_0, 
                rightArmColorId = l_brickId_0, 
                rightLegColorId = l_brickId_0, 
                torsoColorId = l_brickId_0
            };
        end;
        l_setBodyColors_0(l_l_bodyColors_2_0);
        l_sendAnalytics_0(l_analytics_0.setBodyColors, l_l_bodyColors_2_0);
        return ;
    else
        v41.props.setBodyColor3(v41.props.buttonColor3, v41.props.rangeId, v41.props.sliderValue, v41.props.analytics);
        return ;
    end;
end;
v25.DEPRECATED_hasColorEquipped = function(v51)
    local l_selectedBodyPartColorIds_2 = v51.props.selectedBodyPartColorIds;
    if l_selectedBodyPartColorIds_2 and #l_selectedBodyPartColorIds_2 > 1 then
        return v51:DEPRECATED_getBrickIdUsedByAllParts() == v51.props.brickId;
    else
        return v51:DEPRECATED_anySelectedBodyPartUsesThisColor();
    end;
end;
v25.render = function(v53)
    return l_withStyle_0(function(v54)
        local l_Theme_0 = v54.Theme;
        local v56 = nil;
        v56 = if not v53.props.colorPickerSliderEnabled then v53:DEPRECATED_hasColorEquipped() else v53.props.isBodyColorButtonSelected;
        local v57 = nil;
        if v56 then
            v57 = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0.8, 0, 0.8, 0), 
                BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
                BackgroundColor3 = l_Theme_0.Overlay.Color, 
                BorderSizePixel = 0
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }), 
                Checkmark = v3.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0, 30, 0, 30), 
                    BackgroundTransparency = 1, 
                    Image = v26, 
                    ImageColor3 = l_Theme_0.ContextualPrimaryContent.Color, 
                    ImageTransparency = l_Theme_0.ContextualPrimaryContent.Transparency
                })
            });
        end;
        local v58 = nil;
        if not v53.props.colorPickerSliderEnabled then
            v58 = l_Color_0.Color3FromHex(v53.props.brickColor);
        else
            v58 = v53.props.buttonColor3;
            assert(v58 ~= nil, "backgroundColor3 is nil");
        end;
        return l_withSelectionCursorProvider_0(function(v59)
            return v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                TextButton = v3.createElement(l_Focusable_0.TextButton, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = v58, 
                    Text = "", 
                    BorderSizePixel = 0, 
                    AutoButtonColor = false, 
                    ZIndex = 2, 
                    SelectionImageObject = v59(l_CursorKind_0.SkinToneCircle), 
                    [v3.Event.Activated] = function(_)
                        v53:onActivated();
                    end
                }, {
                    UICorner = v3.createElement("UICorner", {
                        CornerRadius = UDim.new(0.5, 0)
                    }), 
                    EquippedFrame = v57
                }), 
                Border = v3.createElement("Frame", {
                    Size = UDim2.new(1, 2, 1, 2), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundColor3 = l_Theme_0.Divider.Color, 
                    BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    ZIndex = 1
                }, {
                    UICorner = v3.createElement("UICorner", {
                        CornerRadius = UDim.new(0.5, 0)
                    })
                })
            });
        end);
    end);
end;
return (v15.connectTestVariables({
    colorPickerSliderEnabled = v20.EnabledForUser
})((v4.connect(function(v61, v62)
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    if not v62.colorPickerSliderEnabled then
        v63 = v61.AvatarExperience.AvatarEditor.Character.BodyColors;
        v64 = v61.AvatarExperience.AvatarEditor.BodyColorPickerSettings.selectedBodyPartColorIds;
    else
        v65 = v18(v61.AvatarExperience, v62.rangeId);
        v66 = v17(v61) == v62.rangeId;
        v67 = v16.getUserId(v61);
        v68 = v19(v61.AvatarExperience, v62.rangeId);
    end;
    return {
        sliderValue = v68, 
        buttonColor3 = v65, 
        isBodyColorButtonSelected = v66, 
        userId = v67, 
        bodyColors = v63, 
        selectedBodyPartColorIds = v64
    };
end, function(v69)
    local v70 = v15.readTestVariable(v20.EnabledForUser);
    return {
        setBodyColors = if v70 then nil else function(v71)
            v69(v12(v71));
        end, 
        sendAnalytics = function(v72, v73)
            v69(v14(v72, v73));
        end, 
        setBodyColor3 = if not v70 then nil else function(v74, v75, v76, v77)
            v69(v13(v74, v75, v76, v77));
        end
    };
end)((l_RoactServices_0.connect({
    analytics = v9
})(v25))))));

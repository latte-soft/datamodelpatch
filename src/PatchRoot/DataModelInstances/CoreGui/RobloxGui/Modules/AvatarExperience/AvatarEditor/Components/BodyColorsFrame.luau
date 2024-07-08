local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodyColorButton);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v8 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v10 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v10.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = v10.App.SelectionImage.withSelectionCursorProvider;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_CursorKind_0 = v10.App.SelectionImage.CursorKind;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_GridMetrics_0 = v10.App.Grid.GridMetrics;
local l_ShimmerPanel_0 = v10.App.Loading.ShimmerPanel;
local l_RadioButtonList_0 = v10.App.InputButton.RadioButtonList;
local l_DefaultMetricsGridView_0 = v10.App.Grid.DefaultMetricsGridView;
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodyColorsSliderFrame);
local v21 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyColorViewSetting);
local v22 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetSelectedBodyPartColorIds);
local v23 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyPartRangeIds);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetSelectedBodyPartIndex);
local v25 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectRangeIdForSelectedBodyParts);
local v27 = require(l_Modules_0.AvatarExperience.Common.Context.withAdaptiveScrolling);
local v28 = require(l_Modules_0.AvatarExperience.Flags.ColorPickerSliderIXPTest);
local v29 = require(l_Modules_0.AvatarExperience.Flags.FFlagColorPickerUseParentProps);
local v30 = v3.PureComponent:extend("BodyColorsFrame");
local v31 = table.create(v6.ShimmerColorCardsToDisplay, {});
local v32 = {
    minimumItemsPerRow = 5, 
    minimumItemWidth = 60
};
local function _(v33)
    return (tonumber(string.sub(v33, 2), 16));
end;
v30.validateProps = v2.strictInterface({
    Size = v2.UDim2, 
    NextSelectionUp = v2.optional(v2.table), 
    colorPickerSliderEnabled = v2.optional(v2.boolean), 
    viewSetting = v2.string, 
    rangeIdForSelectedBodyParts = v2.optional(v2.string), 
    defaultBodyColors = v2.optional(v2.table), 
    defaultBodyColorRanges = v2.optional(v2.table), 
    bodyColor3s = v2.optional(v2.table), 
    bodyPartRangeIds = v2.optional(v2.table), 
    selectedBodyPartIndex = v2.optional(v2.number), 
    setViewSetting = v2.callback, 
    setSelectedBodyPartColorIds = v2.optional(v2.callback), 
    setBodyPartRangeIds = v2.optional(v2.callback), 
    setSelectedBodyPartIndex = v2.optional(v2.callback), 
    adaptiveScrolling = v2.optional(v2.any)
});
v30.init = function(v35)
    if v35.props.colorPickerSliderEnabled then
        v35:setState({
            bodyColorsFrameHeight = 0, 
            bodyPartsListHeight = 0
        });
    end;
    v35.renderItem = function(v36)
        if not v35.props.colorPickerSliderEnabled then
            if not v36.brickColorId then
                return v35:getShimmerPanel();
            else
                return v3.createElement(v5, {
                    brickId = v36.brickColorId, 
                    brickColor = tonumber(string.sub(v36.hexColor, 2), 16)
                });
            end;
        elseif not v36.rangeId then
            return v35:getShimmerPanel();
        else
            return v3.createElement(v5, {
                rangeId = v36.rangeId
            });
        end;
    end;
    local v37, v38 = v3.createBinding(UDim2.new(0, 0, 1, 0));
    v35.canvasSizeBinding = v37;
    v35.updateCanvasSizeBinding = v38;
    v37, v38 = v3.createBinding(0);
    v35.bodyPartsListHeightBinding = v37;
    v35.updateBodyPartsListHeightBinding = v38;
    v37, v38 = v3.createBinding(0);
    v35.bodyColorsFrameHeightBinding = v37;
    v35.updateBodyColorsFrameHeightBinding = v38;
    v35.onUIListLayoutContentSizeChanged = function(v39)
        v35.updateCanvasSizeBinding(UDim2.new(0, 0, 0, v39.AbsoluteContentSize.Y + v6.SkinColorGridPadding * 2));
    end;
    v35.onBodyPartsListAbsoluteSizeChanged = function(v40)
        v35.updateBodyPartsListHeightBinding(v40.AbsoluteSize.Y);
    end;
    v35.onBodyColorsFrameAbsoluteSizeChanged = function(v41)
        v35.updateBodyColorsFrameHeightBinding(v41.AbsoluteSize.Y);
    end;
    v35.toggleViewButtonRef = v3.createRef();
    v35.bodyColorButtonsRef = v3.createRef();
    v35.bodyPartButtonsRef = v3.createRef();
    if v35.props.colorPickerSliderEnabled then
        v35.sliderRef = v3.createRef();
    end;
    v35:setSelectedBodyPartIndex(1);
end;
v30.setSelectedBodyPartIndex = function(v42, v43)
    if not v42.props.colorPickerSliderEnabled then
        local v44 = {};
        for _, v46 in v6.BodyPartButtonData[v43].bodyParts, nil, nil do
            table.insert(v44, v46);
        end;
        v42.props.setSelectedBodyPartColorIds(v44);
        return ;
    else
        v42.props.setSelectedBodyPartIndex(v43);
        return ;
    end;
end;
v30.getShimmerPanel = function(_)
    return v3.createElement(l_ShimmerPanel_0, {
        Size = UDim2.new(1, 0, 1, 0)
    });
end;
v30.getItems = function(v48)
    if not v48.props.colorPickerSliderEnabled then
        local l_defaultBodyColors_0 = v48.props.defaultBodyColors;
        return not not (l_defaultBodyColors_0 and #l_defaultBodyColors_0 > 0) and l_defaultBodyColors_0 or v31;
    else
        local l_defaultBodyColorRanges_0 = v48.props.defaultBodyColorRanges;
        return not not (l_defaultBodyColorRanges_0 and #l_defaultBodyColorRanges_0 > 0) and l_defaultBodyColorRanges_0 or v31;
    end;
end;
v30.getBodyPartsListHeight = function(v51)
    if v51.props.viewSetting == v6.ColorPickerViewSettings.AdvancedView then
        return v51.state.bodyPartsListHeight;
    else
        return 0;
    end;
end;
v30.getGridAndSidebarFrameSize = function(v52)
    if not v52:shouldRenderSliderBar() then
        return v52.props.Size;
    else
        return v3.joinBindings({
            v52.canvasSizeBinding, 
            v52.bodyPartsListHeightBinding, 
            v52.bodyColorsFrameHeightBinding
        }):map(function(v53)
            local l_Offset_0 = v53[1].Y.Offset;
            local v55 = v53[2];
            local v56 = v53[3];
            if v52.props.viewSetting ~= v6.ColorPickerViewSettings.AdvancedView then
                v55 = 0;
            end;
            return UDim2.new(1, 0, 1, -v9.getBodyColorsSliderFrameHeight(v6.BodyColorsSliderFrameHeight, l_Offset_0, v56, v55));
        end);
    end;
end;
v30.renderBodyColorButtons = function(v57, v58, v59)
    return v3.createElement(l_DefaultMetricsGridView_0, {
        renderItem = v57.renderItem, 
        getItemHeight = v8.GridItemHeightGetter(v7.ItemTileType.BodyColorButton), 
        getItemMetrics = l_GridMetrics_0.makeCustomMetricsGetter(v32), 
        itemPadding = Vector2.new(10, 10), 
        items = v58, 
        maxHeight = math.huge, 
        defaultChildIndex = 1, 
        NextSelectionDown = v57.toggleViewButtonRef, 
        NextSelectionUp = v57.props.NextSelectionUp, 
        NextSelectionLeft = v59, 
        [v3.Ref] = v57.bodyColorButtonsRef
    });
end;
v30.renderToggleButton = function(v60, v61, v62, v63, v64)
    return v3.createElement(l_Focusable_0.TextButton, {
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2, 
        Position = UDim2.fromScale(1, 0), 
        Size = UDim2.new(0, 100, 0, 30), 
        Text = v61, 
        Font = v62.Font.Header2.Font, 
        TextSize = v62.Font.BaseSize * v62.Font.Header2.RelativeSize, 
        TextColor3 = v62.Theme.TextEmphasis.Color, 
        NextSelectionUp = v60.bodyColorButtonsRef, 
        NextSelectionDown = not not v60.props.colorPickerSliderEnabled and v60.sliderRef or nil, 
        SelectionImageObject = v63(l_CursorKind_0.RoundedRect), 
        [v3.Ref] = v60.toggleViewButtonRef, 
        [v3.Event.Activated] = v64
    });
end;
v30.renderUIListLayout = function(v65)
    return v3.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, 20), 
        [v3.Change.AbsoluteContentSize] = v65.onUIListLayoutContentSizeChanged
    });
end;
v30.renderUIPadding = function(_)
    return v3.createElement("UIPadding", {
        PaddingTop = UDim.new(0, v6.SkinColorGridPadding), 
        PaddingBottom = UDim.new(0, v6.SkinColorGridPadding), 
        PaddingLeft = UDim.new(0, v6.SkinColorGridPadding), 
        PaddingRight = UDim.new(0, v6.SkinColorGridPadding)
    });
end;
v30.renderBodyPartsList = function(v67, v68)
    local v69 = {};
    for v70 = 1, #v6.BodyPartButtonData do
        table.insert(v69, {
            label = v68["bodyPart" .. v70]
        });
    end;
    local l_colorPickerSliderEnabled_0 = v67.props.colorPickerSliderEnabled;
    return v3.createElement(l_Focusable_0.Frame, {
        AutomaticSize = if not l_colorPickerSliderEnabled_0 then nil else Enum.AutomaticSize.Y, 
        Size = if not l_colorPickerSliderEnabled_0 then UDim2.new(0, 150, 1, 0) else UDim2.fromOffset(150, 0), 
        BackgroundTransparency = 1, 
        [v3.Change.AbsoluteSize] = if not l_colorPickerSliderEnabled_0 then nil else v67.onBodyPartsListAbsoluteSizeChanged
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v6.SkinColorGridPadding), 
            PaddingBottom = if not l_colorPickerSliderEnabled_0 then nil else UDim.new(0, v6.SkinColorGridPadding)
        }), 
        BodyPartRadioButtons = v3.createElement(l_Focusable_0[l_RadioButtonList_0], {
            radioButtons = v69, 
            onActivated = function(v72)
                v67:setSelectedBodyPartIndex(v72);
            end, 
            initialValue = not v67.props.colorPickerSliderEnabled and 1 or v67.props.selectedBodyPartIndex, 
            elementSize = UDim2.new(1, -10, 0, 25), 
            automaticSize = not not l_colorPickerSliderEnabled_0 or nil, 
            padding = UDim.new(0, 10), 
            NextSelectionRight = v67.bodyColorButtonsRef, 
            NextSelectionUp = v67.props.NextSelectionUp, 
            [v3.Ref] = v67.bodyPartButtonsRef
        })
    });
end;
v30.renderStandardView = function(v73)
    local v74 = v73.props.adaptiveScrolling or {};
    return l_withStyle_0(function(v75)
        return l_withSelectionCursorProvider_0(function(v76)
            return l_withLocalization_0({
                buttonText = "Feature.Avatar.Label.BodyColorAdvancedView"
            })(function(v77)
                local v78 = v73:getItems();
                local l_setViewSetting_0 = v73.props.setViewSetting;
                return v3.createElement(l_Focusable_0.ScrollingFrame, {
                    BackgroundTransparency = 1, 
                    CanvasSize = v73.canvasSizeBinding, 
                    ScrollBarThickness = 0, 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    Size = v73:getGridAndSidebarFrameSize(), 
                    NextSelectionUp = v73.props.NextSelectionUp, 
                    defaultChild = v73.bodyColorButtonsRef, 
                    ScrollingEnabled = v74.scrollingEnabled, 
                    [v3.Change.CanvasPosition] = v74.onCanvasPositionChanged
                }, {
                    UIListLayout = v73:renderUIListLayout(), 
                    UIPadding = v73:renderUIPadding(), 
                    BodyColorButtons = v73:renderBodyColorButtons(v78), 
                    AdvancedViewButton = v73:renderToggleButton(v77.buttonText, v75, v76, function()
                        l_setViewSetting_0(v6.ColorPickerViewSettings.AdvancedView);
                    end)
                });
            end);
        end);
    end);
end;
v30.renderAdvancedView = function(v80)
    local v81 = v80.props.adaptiveScrolling or {};
    return l_withStyle_0(function(v82)
        return l_withSelectionCursorProvider_0(function(v83)
            local v84 = {
                standardButtonText = "Feature.Avatar.Label.BodyColorStandardView"
            };
            for v85, _ in v6.BodyPartButtonData, nil, nil do
                v84["bodyPart" .. v85] = v6.BodyPartButtonData[v85].textKey;
            end;
            return l_withLocalization_0(v84)(function(v87)
                local v88 = v80:getItems();
                local v89 = v80:getGridAndSidebarFrameSize();
                local l_setViewSetting_1 = v80.props.setViewSetting;
                return v3.createElement(l_Focusable_0.ScrollingFrame, {
                    BackgroundTransparency = 1, 
                    Size = v89, 
                    CanvasSize = v80.canvasSizeBinding, 
                    ScrollBarThickness = 0, 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    Position = UDim2.fromScale(0, 0), 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    defaultChild = v80.bodyColorButtonsRef, 
                    ScrollingEnabled = v81.scrollingEnabled, 
                    [v3.Change.CanvasPosition] = v81.onCanvasPositionChanged
                }, {
                    BodyPartsList = v80:renderBodyPartsList(v87), 
                    BodyColorsGrid = v3.createElement(l_Focusable_0.Frame, {
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 150, 0, 0), 
                        Size = UDim2.new(1, -150, 1, 0), 
                        defaultChild = v80.bodyColorButtonsRef
                    }, {
                        UIPadding = v80:renderUIPadding(), 
                        UIListLayout = v80:renderUIListLayout(), 
                        BodyColorButtons = v80:renderBodyColorButtons(v88, v80.bodyPartButtonsRef), 
                        StandardViewButton = v80:renderToggleButton(v87.standardButtonText, v82, v83, function()
                            v80:setSelectedBodyPartIndex(1);
                            l_setViewSetting_1(v6.ColorPickerViewSettings.StandardView);
                        end)
                    })
                });
            end);
        end);
    end);
end;
v30.shouldRenderSliderBar = function(v91)
    if v91.props.colorPickerSliderEnabled then
        if v91.props.rangeIdForSelectedBodyParts then
            local l_bodyPartForSkinColoringIds_0 = v6.BodyPartButtonData[v91.props.selectedBodyPartIndex].bodyPartForSkinColoringIds;
            if (l_bodyPartForSkinColoringIds_0 and #l_bodyPartForSkinColoringIds_0 > 1) and v91.props.rangeIdForSelectedBodyParts == nil then
                return false;
            else
                return true;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v30.render = function(v93)
    local _ = nil;
    return v3.createElement(l_Focusable_0.Frame, {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Size = v93.props.Size, 
        Position = UDim2.fromOffset(0, 0), 
        defaultChild = v93.bodyColorButtonsRef, 
        [v3.Change.AbsoluteSize] = v93.onBodyColorsFrameAbsoluteSizeChanged
    }, {
        BodyColorsView = if v93.props.viewSetting == v6.ColorPickerViewSettings.AdvancedView then v93:renderAdvancedView() else v93:renderStandardView(), 
        BodyColorsSliderFrame = if not v93:shouldRenderSliderBar() then nil else v3.createElement(v20, {
            sliderRef = v93.sliderRef, 
            NextSelectionUp = v93.toggleViewButtonRef, 
            gridAndSidebarFrameSizeBinding = v93:getGridAndSidebarFrameSize(), 
            rangeIdForSelectedBodyParts = if not v29 then nil else v93.props.rangeIdForSelectedBodyParts, 
            defaultBodyColorRanges = if not v29 then nil else v93.props.defaultBodyColorRanges
        })
    });
end;
v30.didMount = function(v95)
    if v95.props.colorPickerSliderEnabled then
        local l_bodyColor3s_0 = v95.props.bodyColor3s;
        local l_bodyPartRangeIds_0 = v95.props.bodyPartRangeIds;
        local v98 = {};
        local v99 = false;
        for v100, v101 in l_bodyColor3s_0, nil, nil do
            if l_bodyPartRangeIds_0[v100] == nil then
                v99 = true;
                local v102, _ = v9.findRangeAndSliderValueForColor3(v101, v95.props.defaultBodyColorRanges);
                v98[v100] = v102;
            else
                v98[v100] = l_bodyPartRangeIds_0[v100];
            end;
        end;
        if v99 then
            v95.props.setBodyPartRangeIds(v98);
        end;
    end;
end;
return (v27((v25.connectTestVariables({
    colorPickerSliderEnabled = v28.EnabledForUser
})((v4.connect(function(v104, v105)
    local v106 = nil;
    local v107 = nil;
    local v108 = nil;
    local v109 = nil;
    local v110 = nil;
    local v111 = nil;
    if not v105.colorPickerSliderEnabled then
        v111 = v104.AvatarExperience.AvatarEditor.DefaultBodyColors;
    else
        v106 = v104.AvatarExperience.AvatarEditor.DefaultBodyColorRanges;
        v107 = v104.AvatarExperience.AvatarEditor.Character.BodyPartRangeIds;
        v108 = v104.AvatarExperience.AvatarEditor.Character.BodyColor3s;
        v109 = v104.AvatarExperience.AvatarEditor.BodyColorPickerSettings.selectedBodyPartIndex;
        v110 = v26(v104);
    end;
    return {
        defaultBodyColors = v111, 
        viewSetting = v104.AvatarExperience.AvatarEditor.BodyColorPickerSettings.viewSetting, 
        rangeIdForSelectedBodyParts = v110, 
        defaultBodyColorRanges = v106, 
        bodyColor3s = v108, 
        bodyPartRangeIds = v107, 
        selectedBodyPartIndex = v109
    };
end, function(v112)
    local v113 = v25.readTestVariable(v28.EnabledForUser);
    return {
        setViewSetting = function(v114)
            v112(v21(v114));
        end, 
        setSelectedBodyPartColorIds = if v113 then nil else function(v115)
            v112(v22(v115));
        end, 
        setBodyPartRangeIds = if not v113 then nil else function(v116)
            v112(v23(v116));
        end, 
        setSelectedBodyPartIndex = if not v113 then nil else function(v117)
            v112(v24(v117));
        end
    };
end)(v30))))));

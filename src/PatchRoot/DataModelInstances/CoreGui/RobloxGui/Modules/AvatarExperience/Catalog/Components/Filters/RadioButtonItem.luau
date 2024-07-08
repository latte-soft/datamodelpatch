local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_Interactable_0 = v4.Core.Control.Interactable;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_ControlState_0 = v4.Core.Control.Enum.ControlState;
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.ExpandingFrame);
local v14 = l_Images_0["component_assets/circle_24_stroke_1"];
local v15 = l_Images_0["component_assets/circle_16"];
local v16 = {
    [l_ControlState_0.Default] = "BackgroundDefault", 
    [l_ControlState_0.Hover] = "BackgroundOnHover", 
    [l_ControlState_0.Pressed] = "BackgroundOnPress"
};
local v17 = {
    [l_ControlState_0.Default] = "IconDefault", 
    [l_ControlState_0.Hover] = "IconEmphasis", 
    [l_ControlState_0.Pressed] = "IconDefault"
};
local function v23(v18, v19, v20)
    local v21 = v18[v19] or v18[l_ControlState_0.Default];
    local v22 = {
        Color = v20.Theme[v21].Color, 
        Transparency = v20.Theme[v21].Transparency
    };
    if not (v19 ~= l_ControlState_0.Default) or v19 == l_ControlState_0.Disabled then
        v22.Transparency = 1;
    end;
    return v22;
end;
local function v29(v24, v25, v26)
    local v27 = v24[v25] or v24[l_ControlState_0.Default];
    local v28 = {
        Color = v26.Theme[v27].Color, 
        Transparency = v26.Theme[v27].Transparency
    };
    if not (v25 ~= l_ControlState_0.Disabled) or v25 == l_ControlState_0.Pressed then
        v28.Transparency = 0.5 * v28.Transparency + 0.5;
    end;
    return v28;
end;
local function _(v30, v31)
    local v32 = {
        Color = v30.Color, 
        Transparency = v30.Transparency
    };
    if not (v31 ~= l_ControlState_0.Disabled) or v31 == l_ControlState_0.Pressed then
        v32.Transparency = 0.5 * v32.Transparency + 0.5;
    end;
    return v32;
end;
local function v56(v34)
    local v35, v36 = v2.useState(l_ControlState_0.Initialize);
    local v39 = v2.useCallback(function(_, v38)
        v36(v38);
    end, {});
    local v40 = v2.useCallback(function()
        if v34.onActivated then
            v34.onActivated(v34.id);
        end;
    end, {
        v34.onActivated, 
        v34.id
    });
    local v41 = l_useStyle_0();
    local l_Font_0 = v41.Font;
    local l_Theme_0 = v41.Theme;
    v35 = not not v34.useDefaultControlState and l_ControlState_0.Default or v35;
    local v44 = v29(v17, v35, v41);
    local v45 = v23(v16, v35, v41);
    local v46 = if not v34.isSelected then l_Theme_0.TextDefault else l_Theme_0.TextEmphasis;
    local l_v35_0 = v35;
    local v48 = {
        Color = v46.Color, 
        Transparency = v46.Transparency
    };
    if not (l_v35_0 ~= l_ControlState_0.Disabled) or l_v35_0 == l_ControlState_0.Pressed then
        v48.Transparency = 0.5 * v48.Transparency + 0.5;
    end;
    local l_v48_0 = v48;
    v46 = v34.itemHeight or 45;
    l_v35_0 = v2.useRef(nil);
    local v50;
    v48, v50 = v2.useBinding(v46);
    local function v53(v51)
        local l_v46_0 = v46;
        if v51 then
            l_v46_0 = l_v46_0 + v51.AbsoluteSize.Y;
        end;
        if not v34.hideDivider then
            l_v46_0 = l_v46_0 + 1;
        end;
        v50(l_v46_0);
        if v34.onHeightChanged then
            v34.onHeightChanged(l_v46_0);
        end;
    end;
    v2.useEffect(function()
        local l_current_0 = l_v35_0.current;
        local l_v46_1 = v46;
        if l_current_0 then
            l_v46_1 = l_v46_1 + l_current_0.AbsoluteSize.Y;
        end;
        if not v34.hideDivider then
            l_v46_1 = l_v46_1 + 1;
        end;
        v50(l_v46_1);
        if v34.onHeightChanged then
            v34.onHeightChanged(l_v46_1);
        end;
    end, {});
    return v2.createElement("Frame", {
        Size = v48:map(v11.mapHeightToSize), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        LayoutOrder = v34.layoutOrder, 
        ref = v34.frameRef, 
        NextSelectionLeft = v34.NextSelectionLeft, 
        NextSelectionRight = v34.NextSelectionRight, 
        NextSelectionUp = v34.NextSelectionUp, 
        NextSelectionDown = v34.NextSelectionDown
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right
        }), 
        Interactable = v2.createElement(l_Focusable_0[l_Interactable_0], {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, v46), 
            BackgroundColor3 = v45.Color, 
            BackgroundTransparency = v45.Transparency, 
            BorderSizePixel = 0, 
            AutoButtonColor = false, 
            [v2.Event.Activated] = not v34.isDisabled and v40, 
            ref = v34.defaultChildRef, 
            NextSelectionDown = if not (v34.expandedView and v34.isSelected == true) then nil else l_v35_0, 
            SelectionImageObject = v34.SelectionImageObject, 
            isDisabled = v34.isDisabled, 
            onStateChanged = v39
        }, {
            Contents = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v46), 
                LayoutOrder = 1
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingTop = UDim.new(0, 12), 
                    PaddingBottom = UDim.new(0, 12), 
                    PaddingRight = UDim.new(0, 12)
                }), 
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                CustomViewFrame = v34.customView and v2.createElement("Frame", {
                    Size = UDim2.new(1, -48, 1, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    CustomView = v34.customView
                }), 
                CustomViewSpacer = v34.customView and v2.createElement("Frame", {
                    Size = UDim2.new(0, 24, 1, 0), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }), 
                TitleText = (v34.text and not v34.customView) and v2.createElement(l_StyledTextLabel_0, {
                    size = UDim2.new(1, -24, 1, 0), 
                    colorStyle = l_v48_0, 
                    fontStyle = l_Font_0.Header2, 
                    text = v34.text, 
                    layoutOrder = 1, 
                    textXAlignment = Enum.TextXAlignment.Left
                }), 
                RightContent = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 24, 1, 0), 
                    LayoutOrder = 3
                }, {
                    SelectionImage = v2.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = v14, 
                        Size = UDim2.new(0, 24, 0, 24), 
                        ImageColor3 = v44.Color, 
                        ImageTransparency = v44.Transparency, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0.5, 0)
                    }, {
                        SelectedImage = v34.isSelected and v2.createElement(l_ImageSetLabel_0, {
                            BackgroundTransparency = 1, 
                            Image = v15, 
                            Size = UDim2.new(0, 16, 0, 16), 
                            ImageColor3 = v44.Color, 
                            ImageTransparency = v44.Transparency, 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.new(0.5, 0, 0.5, 0)
                        })
                    })
                })
            })
        }), 
        ExpandingFrame = v34.expandedView and v2.createElement(l_Focusable_0[v13], {
            LayoutOrder = 2, 
            Size = UDim2.new(1, -24, 0, v34.expandedViewHeight or 0), 
            isExpanded = v34.isSelected == true, 
            onAbsoluteSizeChanged = v53, 
            ref = l_v35_0, 
            NextSelectionUp = v34.defaultChildRef
        }, {
            ExpandedView = v34.expandedView
        }), 
        DividerFrame = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 3, 
            Size = UDim2.new(1, 0, 0, 1)
        }, {
            Divider = not v34.hideDivider and v2.createElement("Frame", {
                Size = UDim2.new(1, -24, 0, 1), 
                Position = UDim2.new(1, -12, 0, 0), 
                AnchorPoint = Vector2.new(1, 0), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Theme_0.Divider.Color, 
                BackgroundTransparency = l_Theme_0.Divider.Transparency
            })
        })
    });
end;
return v2.forwardRef(function(v57, v58)
    return v2.createElement(v56, v3.Dictionary.join(v57, {
        frameRef = v58
    }));
end);

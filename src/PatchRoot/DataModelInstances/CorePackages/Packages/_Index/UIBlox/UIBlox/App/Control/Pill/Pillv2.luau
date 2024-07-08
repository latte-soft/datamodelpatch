local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.React);
local v6 = require(l_Parent_0.ImageSet.Images);
local v7 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v8 = require(l_Parent_0.ImageSet.getIconSize);
local v9 = require(l_Parent_0.SelectionImage.useSelectionCursor);
local v10 = require(l_Parent_0.SelectionImage.CursorKind);
local v11 = require(l_Core_0.Style.useStyle);
local v12 = require(l_Core_0.Control.Enum.ControlState);
local v13 = require(l_Core_0.Control.Interactable);
local v14 = require(l_Core_0.Control.useControlState);
local v15 = require(l_Core_0.Button.getContentStyle);
local v16 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v17 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v18 = require(l_Parent_1.App.Loading.ShimmerPanel);
local v19 = require(l_Parent_0.SelectionCursor.useCursorByType);
local v20 = require(l_Parent_0.SelectionCursor.CursorType);
local v21 = require(l_Parent_1.UIBloxConfig);
local v22 = require(l_Parent_1.Core.Text.GetTextSize);
local v23 = {
    hasBorder = false, 
    isDisabled = false, 
    isLoading = false, 
    isSelected = false, 
    layoutOrder = 1, 
    text = ""
};
local v24 = {
    [v12.Default] = "SystemPrimaryContent", 
    [v12.Hover] = "SystemPrimaryContent"
};
local v25 = {
    [v12.Default] = "TextDefault", 
    [v12.Hover] = "TextEmphasis"
};
local v26 = {
    [v12.Default] = "SystemPrimaryContent", 
    [v12.Hover] = "SystemPrimaryContent"
};
local v27 = {
    [v12.Default] = "BackgroundUIDefault", 
    [v12.Hover] = "BackgroundUIDefault"
};
local v28 = {
    [v12.Default] = "SystemPrimaryDefault", 
    [v12.Hover] = "SystemPrimaryOnHover"
};
local v29 = {
    [v12.Default] = "BackgroundOnHover", 
    [v12.Hover] = "BackgroundOnHover"
};
local function v67(v30)
    local v31 = v4.Dictionary.join(v23, v30);
    local l_text_0 = v31.text;
    local v33, v34 = v14();
    local v37 = v5.useCallback(function(v35, v36)
        if v31.onStateChanged then
            v31.onStateChanged(v35, v36);
        end;
        v34(v35, v36);
    end, {
        v31.onStateChanged
    });
    local v38 = v11();
    local l_Font_0 = v38.Font;
    local v40 = if not v21.migrateToNewSelectionCursor then v9(v10.SmallPill) else v19(v20.SmallPill);
    local v41 = if not v31.isSelected then v25 else v26;
    local v42 = if not v31.isSelected then v27 else v28;
    local v43 = v15(v24, v33, v38);
    local v44 = v15(v41, v33, v38);
    local v45 = v15(v42, v33, v38);
    local v46 = v15(v29, v33, v38);
    local v47 = v8(v7.Small);
    local v48 = l_Font_0.CaptionHeader.RelativeSize * l_Font_0.BaseSize;
    local l_X_0 = v22(l_text_0, v48, l_Font_0.CaptionHeader.Font, Vector2.new(10000, 10000)).X;
    local v50 = l_X_0 + 24;
    local v51 = 216;
    if v31.isSelected then
        local v52 = 4 + v47;
        v50 = v50 + v52;
        v51 = v51 - v52;
    end;
    if not v31.isLoading then
        local v53 = not v31.isSelected and v33 == v12.Hover;
        local l_createElement_0 = v5.createElement;
        local l_v13_0 = v13;
        local v56 = {
            Size = UDim2.new(0, v50, 0, 28), 
            BackgroundColor3 = v45.Color, 
            BackgroundTransparency = v45.Transparency, 
            ImageColor3 = v45.Color, 
            ImageTransparency = v45.Transparency, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            LayoutOrder = v31.layoutOrder, 
            ScaleType = Enum.ScaleType.Slice, 
            isDisabled = v31.isDisabled, 
            SelectionImageObject = v40, 
            [v5.Event.Activated] = if v31.isLoading then nil else v31.onActivated, 
            onStateChanged = v37, 
            ref = v31.controlRef, 
            NextSelectionLeft = v31.NextSelectionLeft, 
            NextSelectionRight = v31.NextSelectionRight, 
            NextSelectionUp = v31.NextSelectionUp, 
            NextSelectionDown = v31.NextSelectionDown
        };
        local v57 = {
            UICorner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            UISizeConstraint = v5.createElement("UISizeConstraint", {
                MinSize = Vector2.new(28, 28), 
                MaxSize = Vector2.new(240, 28)
            })
        };
        local l_createElement_1 = v5.createElement;
        local v59 = "Frame";
        local v60 = {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v46.Color, 
            BackgroundTransparency = not v53 and 1 or v46.Transparency
        };
        local v61 = {
            UICorner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            UIStroke = if not v31.hasBorder then nil else v5.createElement("UIStroke", {
                Color = v38.Theme.Divider.Color, 
                Transparency = v38.Theme.Divider.Transparency, 
                Thickness = 1
            })
        };
        local l_createElement_2 = v5.createElement;
        local v63 = "Frame";
        local v64 = {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(0, (l_X_0 + 4) + v47, 1, 0), 
            ClipsDescendants = true, 
            BackgroundTransparency = 1
        };
        local v65 = {
            UIListLayout = v5.createElement("UIListLayout", {
                Padding = UDim.new(0, 4), 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            })
        };
        local v66 = false;
        if string.len(l_text_0) > 0 then
            v66 = v5.createElement("Frame", {
                Size = UDim2.fromOffset(l_X_0, v48), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1
            }, {
                PillText = v5.createElement(v16, {
                    Text = l_text_0, 
                    BackgroundTransparency = 1, 
                    fontStyle = l_Font_0.CaptionHeader, 
                    colorStyle = v44, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    Size = UDim2.fromOffset(v51, v48), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                }); 
                v5.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(v51, 28)
                })
            });
        end;
        v65.TextArea = v66;
        v65.CloseIcon = v31.isSelected and v5.createElement(v17.Label, {
            LayoutOrder = 2, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(v47, v47), 
            BackgroundTransparency = 1, 
            Image = v6["icons/navigation/close_small"], 
            ImageColor3 = v43.Color, 
            ImageTransparency = v43.Transparency
        });
        v65.UISizeConstraint = v5.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(216, 28)
        });
        v61.Content = l_createElement_2(v63, v64, v65);
        v57.BackgroundLayer2 = l_createElement_1(v59, v60, v61);
        return l_createElement_0(l_v13_0, v56, v57);
    else
        return v5.createElement(v18, {
            LayoutOrder = v31.layoutOrder, 
            Size = UDim2.new(0, v50, 0, 28), 
            cornerRadius = UDim.new(1, 0)
        });
    end;
end;
return v5.forwardRef(function(v68, v69)
    return v5.createElement(v67, v4.Dictionary.join(v68, {
        controlRef = v69
    }));
end);

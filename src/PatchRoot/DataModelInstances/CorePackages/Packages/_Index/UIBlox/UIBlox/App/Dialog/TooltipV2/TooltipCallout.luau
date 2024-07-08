local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local l_Parent_4 = l_Parent_3.Parent;
local v5 = require(l_Parent_4.React);
local v6 = require(l_Parent_4.LuauPolyfill);
local _ = require(l_Parent_0.Types);
local v8 = require(l_Parent_2.Text.StyledTextLabel);
local l_Label_0 = require(l_Parent_3.Core.ImageSet.ImageSetComponent).Label;
local v10 = require(l_Parent_2.Button.Button);
local v11 = require(l_Parent_2.Button.Enum.ButtonType);
local v12 = require(l_Parent_3.Core.Button.Enum.StandardButtonSize);
local l_KeyLabel_0 = l_Parent_2.Menu.KeyLabel;
local v14 = require(l_KeyLabel_0.KeyLabel);
local _ = require(l_KeyLabel_0.Types);
local l_getKeyLabelWidth_0 = require(l_KeyLabel_0.Utilities).getKeyLabelWidth;
local v17 = require(l_Parent_3.Core.Style.useStyle);
local v18 = require(l_Parent_0.Constants);
local v19 = require(l_Parent_3.Core.Text.GetTextSize);
local v20 = require(l_Parent_1.Tooltip.Enum.TooltipOrientation);
local v21 = require(l_Parent_3.App.Button.IconButton);
local v22 = require(l_Parent_3.App.ImageSet.Enum.IconSize);
local v23 = require(l_Parent_3.App.ImageSet.Images);
local function _(v24, v25)
    return Vector2.new(v24.X * v25.X, v24.Y * v25.Y);
end;
getOffsetPosition = function(v27, v28, v29, v30)
    local v31 = v18.ORIENTATION_VECTOR[v29];
    local v32 = v28 + Vector2.new(v30, v30);
    return v27 + Vector2.new(v31.X * v32.X, v31.Y * v32.Y);
end;
local function _(v33)
    return UDim2.fromOffset(v33.X, v33.Y);
end;
local function _(v35)
    return Vector2.new(0.5, 0.5) - 0.5 * v18.ORIENTATION_VECTOR[v35];
end;
local function _(v37, v38)
    return UDim.new(0, v37 or v38);
end;
local function _(v40, v41)
    return v40 + Vector2.new(v41[v20.Left] + v41[v20.Right], v41[v20.Top] + v41[v20.Bottom]);
end;
local function v50(v43, v44, v45)
    if not v43 or #v43 == 0 then
        return nil, v44;
    else
        local v46 = {};
        local v47 = 0;
        for v48, v49 in ipairs(v43) do
            v46[v48] = v5.createElement(v14, {
                keyCode = v49, 
                LayoutOrder = v48
            });
            v47 = v47 + l_getKeyLabelWidth_0(v49, v45);
        end;
        v47 = math.max(v47 + v18.HOTKEY_PADDING * (#v43 - 1), v44);
        v46.Layout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v18.HOTKEY_PADDING)
        });
        return v5.createElement("Frame", {
            Name = "Hotkeys", 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromOffset(v47, 0), 
            LayoutOrder = 3
        }, v46), v47;
    end;
end;
return v5.forwardRef(function(v51, v52)
    assert(v51.headerText or v51.bodyText, "Must supply either header or body");
    assert(not (v51.renderCustomComponents and v51.buttonProps), "renderCustomComponents and buttonProps are not compatible");
    local v53, v54 = v5.useState(Vector2.zero);
    local v55 = v17();
    local v56 = v51.textAlignment or Enum.TextXAlignment.Left;
    local v57 = Enum.HorizontalAlignment[v56.Name];
    local l_Theme_0 = v55.Theme;
    local l_Font_0 = v55.Font;
    local l_Settings_0 = v55.Settings;
    local l_BaseSize_0 = l_Font_0.BaseSize;
    local l_CaptionHeader_0 = l_Font_0.CaptionHeader;
    local v63 = l_BaseSize_0 * l_CaptionHeader_0.RelativeSize;
    local v64 = (v18.MAX_WIDTH - (v51.PaddingLeft or v18.DEFAULT_PADDING)) - (v51.PaddingRight or v18.DEFAULT_PADDING);
    local v65 = Vector2.new(v64, math.huge);
    local v66 = 0;
    local v67 = nil;
    if v51.headerText then
        local v68 = Vector2.new(v64, 2 * v63);
        local l_v68_0 = v68;
        if v51.onClose then
            l_v68_0 = l_v68_0 - Vector2.new(v18.CLOSE_BUTTON_SIZE, 0);
        end;
        v67 = v19(v51.headerText, v63, l_CaptionHeader_0.Font, l_v68_0):Min(v68);
        v66 = math.max(v66, v67.X);
    end;
    local l_CaptionBody_0 = l_Font_0.CaptionBody;
    local v71 = nil;
    if v51.bodyText then
        v71 = v19(v51.bodyText, l_BaseSize_0 * l_CaptionBody_0.RelativeSize, l_CaptionBody_0.Font, v65);
        v66 = math.max(v66, v71.X);
    end;
    if v51.minContentWidth then
        v66 = math.max(v66, v51.minContentWidth);
    end;
    local v72 = nil;
    local v73, v74 = v50(v51.hotkeyCodes, v66, l_Font_0);
    v72 = v73;
    v66 = v74;
    v73 = nil;
    if not v51.renderCustomComponents then
        if v51.buttonProps then
            v73 = {
                Layout = v5.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right
                }), 
                SizeContraint = v5.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(0, 28)
                }), 
                Button = v5.createElement(v10, (v6.Object.assign({}, v51.buttonProps, {
                    buttonType = v11.PrimarySystem, 
                    standardSize = v12.XSmall, 
                    fontStyle = l_CaptionHeader_0
                })))
            };
        end;
    else
        v73 = {
            Content = v51.renderCustomComponents(v66), 
            SizeConstraint = v5.createElement("UISizeConstraint", {
                MaxSize = v65
            })
        };
    end;
    v74 = v73 and v5.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(0, v66, 0, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 4, 
        Name = not v51.renderCustomComponents and "ButtonFrame" or "CustomComponents"
    }, v73);
    local v75 = if not not v72 and v74 then v5.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(0, v66, 0, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, {
        Layout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, v51.listPadding or v18.DEFAULT_LIST_PADDING), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Hotkeys = v72, 
        CustomContent = v74
    }) else v72 or v74;
    local v76 = if not v51.useLargeDropShadow then v18.DropShadow.Small else v18.DropShadow.Large;
    local v77 = v18.OPPOSITE_ORIENTATION[v51.orientation];
    local l_OFFSET_0 = v76.OFFSET;
    local v79 = v53 + Vector2.new(l_OFFSET_0[v20.Left] + l_OFFSET_0[v20.Right], l_OFFSET_0[v20.Top] + l_OFFSET_0[v20.Bottom]);
    l_OFFSET_0 = table.clone(v76.OFFSET);
    local v80 = v18.CONTENT_TO_CARET_TIP - l_OFFSET_0[v77];
    local v81 = math.max(0, v80);
    l_OFFSET_0[v77] = l_OFFSET_0[v77] + v81;
    local v82 = Vector2.new(l_OFFSET_0[v20.Left], l_OFFSET_0[v20.Top]);
    local v83 = Vector2.zero:Max(v18.ORIENTATION_VECTOR[v51.orientation] * v81);
    local v84 = Vector2.new(0.5, 0.5) - 0.5 * v18.ORIENTATION_VECTOR[v51.orientation];
    local v85 = ((v82 + Vector2.new(v53.X * v84.X, v53.Y * v84.Y)) - v51.contentOffsetVector) + v18.ORIENTATION_VECTOR[v77] * v18.CONTENT_TO_CARET_CENTER;
    local v86 = v53 + Vector2.new(l_OFFSET_0[v20.Left] + l_OFFSET_0[v20.Right], l_OFFSET_0[v20.Top] + l_OFFSET_0[v20.Bottom]);
    local v87 = getOffsetPosition(v51.triggerPointCenter, v51.triggerPointRadius, v51.orientation, (v18.CARET_DISTANCE + math.min(0, v80)) + math.floor(v51.distanceOffset + 0.5)) + v51.contentOffsetVector;
    v84 = v51.backgroundColor or l_Theme_0.UIDefault.Color;
    local v88 = (v51.backgroundTransparency or l_Theme_0.UIDefault.Transparency) * l_Settings_0.PreferredTransparency;
    local l_createElement_0 = v5.createElement;
    local v90 = "CanvasGroup";
    local v91 = {
        GroupTransparency = v51.transparency, 
        Position = UDim2.fromOffset(v87.X, v87.Y), 
        Size = UDim2.fromOffset(v86.X, v86.Y), 
        AnchorPoint = Vector2.new(0.5, 0.5) - 0.5 * v18.ORIENTATION_VECTOR[v51.orientation], 
        BackgroundTransparency = not v51.canvasBackground and 1 or v51.canvasBackground.Transparency, 
        BackgroundColor3 = if not v51.canvasBackground then nil else v51.canvasBackground.Color, 
        BorderSizePixel = 0
    };
    local v92 = {
        Caret = v5.createElement(l_Label_0, {
            Image = v18.CARET_IMAGE, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromOffset(v85.X, v85.Y), 
            BackgroundTransparency = 1, 
            Size = v18.CARET_SIZE, 
            Rotation = v18.CARET_ROTATION[v51.orientation], 
            ImageColor3 = v84, 
            ImageTransparency = v88, 
            ZIndex = 2
        }), 
        DropShadow = v5.createElement(l_Label_0, {
            Image = v76.IMAGE, 
            ImageColor3 = l_Theme_0.DropShadow.Color, 
            ImageTransparency = l_Theme_0.DropShadow.Transparency, 
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(v83.X, v83.Y), 
            Size = UDim2.fromOffset(v79.X, v79.Y), 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v76.SLICE_CENTER, 
            ZIndex = 1
        })
    };
    local l_createElement_1 = v5.createElement;
    local v94 = "Frame";
    local v96 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.fromOffset(v82.X, v82.Y), 
        BackgroundColor3 = v84, 
        BackgroundTransparency = v88, 
        [v5.Change.AbsoluteSize] = function(v95)
            v54(v95.AbsoluteSize);
            if v51.onContentSizeChanged then
                v51.onContentSizeChanged(v95.AbsoluteSize);
            end;
        end, 
        ref = v52, 
        ZIndex = 2
    };
    local v97 = {
        Layout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = v57, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v51.listPadding or v18.DEFAULT_LIST_PADDING)
        }), 
        Padding = v5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v51.PaddingTop or v18.DEFAULT_PADDING), 
            PaddingBottom = UDim.new(0, v51.PaddingBottom or v18.DEFAULT_PADDING), 
            PaddingLeft = UDim.new(0, v51.PaddingLeft or v18.DEFAULT_PADDING), 
            PaddingRight = UDim.new(0, v51.PaddingRight or v18.DEFAULT_PADDING)
        }), 
        Corner = v5.createElement("UICorner", {
            CornerRadius = v18.CORNER_RADIUS
        })
    };
    local l_headerText_0 = v51.headerText;
    if l_headerText_0 then
        l_headerText_0 = v5.createElement;
        local l_v8_0 = v8;
        local v100 = {
            text = v51.headerText, 
            fontStyle = l_CaptionHeader_0, 
            colorStyle = l_Theme_0.TextEmphasis, 
            textYAlignment = Enum.TextYAlignment.Center, 
            textXAlignment = v56, 
            textTruncate = Enum.TextTruncate.AtEnd, 
            layoutOrder = 1
        };
        local l_v67_0 = v67;
        v100.size = UDim2.fromOffset(l_v67_0.X, l_v67_0.Y);
        v100.fluidSizing = false;
        v100.richText = false;
        v100.lineHeight = 1;
        l_headerText_0 = l_headerText_0(l_v8_0, v100);
    end;
    v97.Header = l_headerText_0;
    l_headerText_0 = v51.bodyText;
    if l_headerText_0 then
        l_headerText_0 = v5.createElement;
        local l_v8_1 = v8;
        local v103 = {
            text = v51.bodyText, 
            fontStyle = l_CaptionBody_0, 
            colorStyle = l_Theme_0.TextEmphasis, 
            textYAlignment = Enum.TextYAlignment.Center, 
            textXAlignment = v56, 
            textTruncate = Enum.TextTruncate.None, 
            layoutOrder = 2
        };
        local l_v71_0 = v71;
        v103.size = UDim2.fromOffset(l_v71_0.X, l_v71_0.Y);
        v103.fluidSizing = false;
        v103.richText = false;
        v103.lineHeight = 1;
        l_headerText_0 = l_headerText_0(l_v8_1, v103);
    end;
    v97.Body = l_headerText_0;
    v97.Additional = v75;
    v92.Box = l_createElement_1(v94, v96, v97);
    l_createElement_1 = false;
    if v51.onClose ~= nil then
        l_createElement_1 = v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            ZIndex = 3, 
            Size = UDim2.fromOffset(v18.CLOSE_BUTTON_SIZE, v18.CLOSE_BUTTON_SIZE), 
            Position = UDim2.new(1, -(v18.CLOSE_BUTTON_SIZE + v18.CLOSE_BUTTON_PADDING * 2), 0, v18.CLOSE_BUTTON_SIZE / 2)
        }, {
            Button = v5.createElement(v21, {
                backgroundTransparency = 1, 
                icon = v23["icons/navigation/close"], 
                iconSize = v22.Small, 
                size = UDim2.new(1, 0, 1, 0), 
                onActivated = v51.onClose
            })
        });
    end;
    v92.CloseButton = l_createElement_1;
    return l_createElement_0(v90, v91, v92);
end);

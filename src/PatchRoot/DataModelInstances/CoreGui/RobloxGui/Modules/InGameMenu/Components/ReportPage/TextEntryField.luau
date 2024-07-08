local l_TextService_0 = game:GetService("TextService");
local v1 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_Cryo_0 = v1.Cryo;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent.Parent;
local v11 = require(l_Parent_0.Resources.Assets);
local v12 = require(script.Parent.FillCircle);
local v13 = require(l_Parent_0.Components.ThemedTextLabel);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v15 = l_Roact_0.PureComponent:extend("TextEntryField");
local v16 = l_Images_0["component_assets/circle_17"];
v15.validateProps = l_t_0.strictInterface({
    enabled = l_t_0.boolean, 
    text = l_t_0.string, 
    textChanged = l_t_0.callback, 
    maxTextLength = l_t_0.integer, 
    autoFocusOnEnabled = l_t_0.boolean, 
    PlaceholderText = l_t_0.string, 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    Size = l_t_0.UDim2, 
    Position = l_t_0.optional(l_t_0.UDim2), 
    textBoxRef = l_t_0.optional(l_t_0.table)
});
v15.init = function(v17)
    v17.textBoxRef = v17.props.textBoxRef or l_Roact_0.createRef();
    v17.state = {
        textBoxWidth = 100, 
        scrollingFrameHeight = 100, 
        canvasPosition = 0, 
        cursorPosition = 0
    };
end;
v15.calculateNeedsRescroll = function(v18, v19, v20)
    v18:setState(function(v21, v22)
        if v21.cursorPosition == -1 then
            return nil;
        else
            local v23 = v22.text:sub(1, v21.cursorPosition - 1);
            local v24 = v20.RelativeSize * v19.Font.BaseSize;
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v23, v24, v20.Font, (Vector2.new(v22.textBoxWidth, 10000)));
            if v21.scrollingFrameHeight + v21.canvasPosition < l_l_TextService_0_TextSize_0.Y then
                return {
                    canvasPosition = l_l_TextService_0_TextSize_0.Y - v21.scrollingFrameHeight
                };
            elseif l_l_TextService_0_TextSize_0.Y - v24 < v21.canvasPosition then
                return {
                    canvasPosition = l_l_TextService_0_TextSize_0.Y - v24
                };
            else
                return nil;
            end;
        end;
    end);
end;
v15.renderWithSelectionCursor = function(v26, v27)
    return l_withStyle_0(function(v28)
        local l_TextDefault_0 = v28.Theme.TextDefault;
        local l_Body_0 = v28.Font.Body;
        local l_l_TextService_0_TextSize_1 = l_TextService_0:GetTextSize(v26.props.text, l_Body_0.RelativeSize * v28.Font.BaseSize, l_Body_0.Font, Vector2.new(v26.state.textBoxWidth, 10000));
        local l_ImageRectSize_0 = v16.ImageRectSize;
        local l_ImageRectOffset_0 = v16.ImageRectOffset;
        local l_X_0 = l_ImageRectSize_0.X;
        local v35 = l_X_0 / 2;
        return l_Roact_0.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v11.Images.RoundedRect.Image, 
            ImageColor3 = v28.Theme.BackgroundMuted.Color, 
            ImageTransparency = v28.Theme.BackgroundMuted.Transparency, 
            Position = v26.props.Position, 
            ScaleType = v11.Images.RoundedRect.ScaleType, 
            Size = v26.props.Size, 
            SliceCenter = v11.Images.RoundedRect.SliceCenter, 
            LayoutOrder = v26.props.LayoutOrder
        }, {
            ScrollingFrame = l_Roact_0.createElement("ScrollingFrame", {
                Size = UDim2.new(1, -24, 1, -44), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 7), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                CanvasSize = UDim2.new(1, -24, 0, l_l_TextService_0_TextSize_1.Y), 
                ScrollBarThickness = 8, 
                VerticalScrollBarInset = Enum.ScrollBarInset.Always, 
                CanvasPosition = Vector2.new(0, v26.state.canvasPosition), 
                Selectable = false, 
                [l_Roact_0.Change.CanvasPosition] = function(v36)
                    v26:setState({
                        canvasPosition = v36.CanvasPosition.Y
                    });
                end, 
                [l_Roact_0.Change.AbsoluteSize] = function(v37)
                    v26:setState({
                        scrollingFrameHeight = v37.AbsoluteSize.Y
                    }, function()
                        v26:calculateNeedsRescroll(v28, l_Body_0);
                    end);
                end
            }, {
                TextBox = l_Roact_0.createElement("TextBox", {
                    Size = UDim2.new(1, -2, 1, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Text = v26.props.text, 
                    ClearTextOnFocus = false, 
                    TextEditable = v26.props.enabled, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    TextColor3 = l_TextDefault_0.Color, 
                    TextTransparency = l_TextDefault_0.Transparency, 
                    Font = l_Body_0.Font, 
                    TextSize = l_Body_0.RelativeSize * v28.Font.BaseSize, 
                    TextWrapped = true, 
                    SelectionImageObject = v27(l_CursorKind_0.InputFields), 
                    [l_Roact_0.Ref] = v26.textBoxRef, 
                    [l_Roact_0.Change.Text] = function(v38)
                        if v26.props.maxTextLength < utf8.len(utf8.nfcnormalize(v38.Text)) then
                            v38.Text = string.sub(v38.Text, 1, utf8.offset(v38.Text, v26.props.maxTextLength + 1) - 1);
                            return ;
                        else
                            v26.props.textChanged(v38.Text);
                            v26:setState({
                                cursorPosition = v38.CursorPosition
                            }, function()
                                v26:calculateNeedsRescroll(v28, l_Body_0);
                            end);
                            return ;
                        end;
                    end, 
                    [l_Roact_0.Change.AbsoluteSize] = function(v39)
                        v26:setState({
                            textBoxWidth = v39.AbsoluteSize.X
                        }, function()
                            v26:calculateNeedsRescroll(v28, l_Body_0);
                        end);
                    end, 
                    [l_Roact_0.Change.CursorPosition] = function(v40)
                        v26:setState({
                            cursorPosition = v40.CursorPosition
                        }, function()
                            v26:calculateNeedsRescroll(v28, l_Body_0);
                        end);
                    end
                }, {
                    PlaceholderText = l_Roact_0.createElement(v13, {
                        themeKey = "TextDefault", 
                        fontKey = "Body", 
                        Text = v26.props.PlaceholderText, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        TextTransparency = 0.5, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        Visible = v26.props.text == ""
                    })
                })
            }), 
            BottomBar = l_Roact_0.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = v16.Image, 
                ImageColor3 = v28.Theme.BackgroundMuted.Color, 
                ImageTransparency = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                Size = UDim2.new(1, 0, 0, 32), 
                SliceCenter = Rect.new(v35 - 1, 0, v35 + 1, 1), 
                SliceScale = 1 / l_Images_0.ImagesResolutionScale, 
                ImageRectSize = Vector2.new(l_X_0, v35), 
                ImageRectOffset = l_ImageRectOffset_0 + Vector2.new(0, v35)
            }, {
                TextAmmountIndicator = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(1, -10, 0.5, 0), 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    Size = UDim2.new(0, 20, 0, 20)
                }, {
                    l_Roact_0.createElement(v12, {
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        fillFraction = utf8.len(utf8.nfcnormalize(v26.props.text)) / (v26.props.maxTextLength - 10), 
                        largerCircleFraction = (v26.props.maxTextLength - 20) / v26.props.maxTextLength, 
                        popCircleFraction = 1, 
                        shakeCircleFraction = v26.props.maxTextLength / (v26.props.maxTextLength - 10), 
                        BackgroundColor = v28.Theme.BackgroundMuted.Color
                    })
                })
            })
        });
    end);
end;
v15.render = function(v41)
    return l_withSelectionCursorProvider_0(function(v42)
        return v41:renderWithSelectionCursor(v42);
    end);
end;
v15.didUpdate = function(v43, v44, _)
    if v43.props.enabled or not v44.enabled then
        if not (((not v43.props.enabled or v44.enabled) or not v43.props.autoFocusOnEnabled) or not v43.textBoxRef.current) then
            v43.textBoxRef.current:CaptureFocus();
        end;
    elseif not (not v43.textBoxRef.current or not v43.textBoxRef.current:IsFocused()) then
        v43.textBoxRef.current:ReleaseFocus();
        return ;
    end;
end;
return l_Roact_0.forwardRef(function(v46, v47)
    return l_Roact_0.createElement(v15, l_Cryo_0.Dictionary.join(v46, {
        textBoxRef = v47
    }));
end);

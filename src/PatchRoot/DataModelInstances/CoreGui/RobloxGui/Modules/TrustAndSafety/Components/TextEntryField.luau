local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.Resources.Assets);
local v8 = require(require(l_Parent_0.Dependencies).ThemedTextLabel);
local v9 = require(l_Parent_0.Components.FillCircle);
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v4.Core.Style.withStyle;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_withSelectionCursorProvider_0 = v4.App.SelectionImage.withSelectionCursorProvider;
local v14 = v3.PureComponent:extend("TextEntryField");
v14.validateProps = v5.strictInterface({
    enabled = v5.boolean, 
    text = v5.string, 
    textChanged = v5.callback, 
    maxTextLength = v5.integer, 
    autoFocusOnEnabled = v5.boolean, 
    PlaceholderText = v5.string, 
    LayoutOrder = v5.optional(v5.integer), 
    Size = v5.UDim2, 
    Position = v5.optional(v5.UDim2), 
    textBoxRef = v5.optional(v5.table)
});
v14.init = function(v15)
    v15.textBoxRef = v15.props.textBoxRef or v3.createRef();
    v15.state = {
        textBoxWidth = 100, 
        scrollingFrameHeight = 100, 
        canvasPosition = 0, 
        cursorPosition = 0
    };
end;
v14.calculateNeedsRescroll = function(v16, v17, v18)
    v16:setState(function(v19, v20)
        if v19.cursorPosition == -1 then
            return nil;
        else
            local v21 = v20.text:sub(1, v19.cursorPosition - 1);
            local v22 = v18.RelativeSize * v17.Font.BaseSize;
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v21, v22, v18.Font, (Vector2.new(v20.textBoxWidth, 10000)));
            if v19.scrollingFrameHeight + v19.canvasPosition < l_l_TextService_0_TextSize_0.Y then
                return {
                    canvasPosition = l_l_TextService_0_TextSize_0.Y - v19.scrollingFrameHeight
                };
            elseif l_l_TextService_0_TextSize_0.Y - v22 < v19.canvasPosition then
                return {
                    canvasPosition = l_l_TextService_0_TextSize_0.Y - v22
                };
            else
                return nil;
            end;
        end;
    end);
end;
v14.renderWithSelectionCursor = function(v24, v25)
    return l_withStyle_0(function(v26)
        local l_TextDefault_0 = v26.Theme.TextDefault;
        local l_Body_0 = v26.Font.Body;
        return v3.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v7.Images.RoundedRect.Image, 
            ImageColor3 = v26.Theme.BackgroundMuted.Color, 
            ImageTransparency = v26.Theme.BackgroundMuted.Transparency, 
            Position = v24.props.Position, 
            ScaleType = v7.Images.RoundedRect.ScaleType, 
            Size = v24.props.Size, 
            SliceCenter = v7.Images.RoundedRect.SliceCenter, 
            LayoutOrder = v24.props.LayoutOrder
        }, {
            ScrollingFrame = v3.createElement("ScrollingFrame", {
                Size = UDim2.new(1, -24, 1, -14), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 7), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                CanvasSize = UDim2.new(1, -24, 0, l_TextService_0:GetTextSize(v24.props.text, l_Body_0.RelativeSize * v26.Font.BaseSize, l_Body_0.Font, Vector2.new(v24.state.textBoxWidth, 10000)).Y), 
                ScrollBarThickness = 8, 
                VerticalScrollBarInset = Enum.ScrollBarInset.Always, 
                CanvasPosition = Vector2.new(0, v24.state.canvasPosition), 
                Selectable = false, 
                [v3.Change.CanvasPosition] = function(v29)
                    v24:setState({
                        canvasPosition = v29.CanvasPosition.Y
                    });
                end, 
                [v3.Change.AbsoluteSize] = function(v30)
                    v24:setState({
                        scrollingFrameHeight = v30.AbsoluteSize.Y
                    }, function()
                        v24:calculateNeedsRescroll(v26, l_Body_0);
                    end);
                end
            }, {
                TextBox = v3.createElement("TextBox", {
                    Size = UDim2.new(1, -2, 1, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Text = v24.props.text, 
                    ClearTextOnFocus = false, 
                    TextEditable = v24.props.enabled, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    TextColor3 = l_TextDefault_0.Color, 
                    TextTransparency = l_TextDefault_0.Transparency, 
                    Font = l_Body_0.Font, 
                    TextSize = l_Body_0.RelativeSize * v26.Font.BaseSize, 
                    TextWrapped = true, 
                    MultiLine = true, 
                    SelectionImageObject = v25(l_CursorKind_0.InputFields), 
                    [v3.Ref] = v24.textBoxRef, 
                    [v3.Change.Text] = function(v31)
                        local l_status_0, l_result_0 = pcall(function()
                            return utf8.len(utf8.nfcnormalize(v31.Text));
                        end);
                        if not l_status_0 or v24.props.maxTextLength < l_result_0 then
                            v31.Text = v24.props.text;
                            return ;
                        else
                            v24.props.textChanged(v31.Text);
                            v24:setState({
                                cursorPosition = v31.CursorPosition
                            }, function()
                                v24:calculateNeedsRescroll(v26, l_Body_0);
                            end);
                            return ;
                        end;
                    end, 
                    [v3.Change.AbsoluteSize] = function(v34)
                        v24:setState({
                            textBoxWidth = v34.AbsoluteSize.X
                        }, function()
                            v24:calculateNeedsRescroll(v26, l_Body_0);
                        end);
                    end, 
                    [v3.Change.CursorPosition] = function(v35)
                        v24:setState({
                            cursorPosition = v35.CursorPosition
                        }, function()
                            v24:calculateNeedsRescroll(v26, l_Body_0);
                        end);
                    end
                }, {
                    PlaceholderText = v3.createElement(v8, {
                        themeKey = "TextDefault", 
                        fontKey = "Body", 
                        Text = v24.props.PlaceholderText, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        TextTransparency = 0.5, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        Visible = v24.props.text == ""
                    })
                })
            }), 
            TextAmmountIndicator = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, -10, 1, -16), 
                AnchorPoint = Vector2.new(1, 0.5), 
                Size = UDim2.new(0, 20, 0, 20), 
                ZIndex = 1
            }, {
                v3.createElement(v9, {
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    fillFraction = utf8.len(utf8.nfcnormalize(v24.props.text)) / (v24.props.maxTextLength - 10), 
                    largerCircleFraction = (v24.props.maxTextLength - 20) / v24.props.maxTextLength, 
                    popCircleFraction = 1, 
                    shakeCircleFraction = v24.props.maxTextLength / (v24.props.maxTextLength - 10), 
                    BackgroundColor = v26.Theme.BackgroundMuted.Color
                })
            })
        });
    end);
end;
v14.render = function(v36)
    return l_withSelectionCursorProvider_0(function(v37)
        return v36:renderWithSelectionCursor(v37);
    end);
end;
v14.didUpdate = function(v38, v39, _)
    if v38.props.enabled or not v39.enabled then
        if not (((not v38.props.enabled or v39.enabled) or not v38.props.autoFocusOnEnabled) or not v38.textBoxRef.current) then
            v38.textBoxRef.current:CaptureFocus();
        end;
    elseif not (not v38.textBoxRef.current or not v38.textBoxRef.current:IsFocused()) then
        v38.textBoxRef.current:ReleaseFocus();
        return ;
    end;
end;
return v3.forwardRef(function(v41, v42)
    return v3.createElement(v14, v2.Dictionary.join(v41, {
        textBoxRef = v42
    }));
end);

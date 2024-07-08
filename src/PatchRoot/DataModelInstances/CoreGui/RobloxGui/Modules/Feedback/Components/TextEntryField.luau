local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.Resources.Assets);
local v8 = require(l_Parent_0.Components.PortedComponents.ThemedTextLabel);
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v4.Core.Style.withStyle;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_withSelectionCursorProvider_0 = v4.App.SelectionImage.withSelectionCursorProvider;
local v13 = v3.PureComponent:extend("TextEntryField");
v13.validateProps = v5.strictInterface({
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
v13.init = function(v14)
    v14.textBoxRef = v14.props.textBoxRef or v3.createRef();
    v14.state = {
        textBoxWidth = 100, 
        scrollingFrameHeight = 100, 
        canvasPosition = 0, 
        cursorPosition = 0
    };
end;
v13.calculateNeedsRescroll = function(v15, v16, v17)
    v15:setState(function(v18, v19)
        if v18.cursorPosition == -1 then
            return nil;
        else
            local v20 = v19.text:sub(1, v18.cursorPosition - 1);
            local v21 = v17.RelativeSize * v16.Font.BaseSize;
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v20, v21, v17.Font, (Vector2.new(v19.textBoxWidth, 10000)));
            if v18.scrollingFrameHeight + v18.canvasPosition < l_l_TextService_0_TextSize_0.Y then
                return {
                    canvasPosition = l_l_TextService_0_TextSize_0.Y - v18.scrollingFrameHeight
                };
            elseif l_l_TextService_0_TextSize_0.Y - v21 < v18.canvasPosition then
                return {
                    canvasPosition = l_l_TextService_0_TextSize_0.Y - v21
                };
            else
                return nil;
            end;
        end;
    end);
end;
v13.renderWithSelectionCursor = function(v23, v24)
    return l_withStyle_0(function(v25)
        local l_TextDefault_0 = v25.Theme.TextDefault;
        local l_Body_0 = v25.Font.Body;
        return v3.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v7.Images.RoundedRect.Image, 
            ImageColor3 = v25.Theme.BackgroundMuted.Color, 
            ImageTransparency = v25.Theme.BackgroundMuted.Transparency, 
            Position = v23.props.Position, 
            ScaleType = v7.Images.RoundedRect.ScaleType, 
            Size = v23.props.Size, 
            SliceCenter = v7.Images.RoundedRect.SliceCenter, 
            LayoutOrder = v23.props.LayoutOrder
        }, {
            ScrollingFrame = v3.createElement("ScrollingFrame", {
                Size = UDim2.new(1, -24, 1, -14), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 7), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                CanvasSize = UDim2.new(1, -24, 0, l_TextService_0:GetTextSize(v23.props.text, l_Body_0.RelativeSize * v25.Font.BaseSize, l_Body_0.Font, Vector2.new(v23.state.textBoxWidth, 10000)).Y), 
                ScrollBarThickness = 8, 
                VerticalScrollBarInset = Enum.ScrollBarInset.Always, 
                CanvasPosition = Vector2.new(0, v23.state.canvasPosition), 
                Selectable = false, 
                [v3.Change.CanvasPosition] = function(v28)
                    v23:setState({
                        canvasPosition = v28.CanvasPosition.Y
                    });
                end, 
                [v3.Change.AbsoluteSize] = function(v29)
                    v23:setState({
                        scrollingFrameHeight = v29.AbsoluteSize.Y
                    }, function()
                        v23:calculateNeedsRescroll(v25, l_Body_0);
                    end);
                end
            }, {
                TextBox = v3.createElement("TextBox", {
                    Size = UDim2.new(1, -2, 1, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Text = v23.props.text, 
                    ClearTextOnFocus = false, 
                    TextEditable = v23.props.enabled, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    TextColor3 = l_TextDefault_0.Color, 
                    TextTransparency = l_TextDefault_0.Transparency, 
                    Font = l_Body_0.Font, 
                    TextSize = l_Body_0.RelativeSize * v25.Font.BaseSize, 
                    TextWrapped = true, 
                    MultiLine = true, 
                    SelectionImageObject = v24(l_CursorKind_0.InputFields), 
                    [v3.Ref] = v23.textBoxRef, 
                    [v3.Change.Text] = function(v30)
                        local l_status_0, l_result_0 = pcall(function()
                            return utf8.len(utf8.nfcnormalize(v30.Text));
                        end);
                        if not l_status_0 or v23.props.maxTextLength < l_result_0 then
                            v30.Text = v23.props.text;
                            return ;
                        else
                            v23.props.textChanged(v30.Text);
                            v23:setState({
                                cursorPosition = v30.CursorPosition
                            }, function()
                                v23:calculateNeedsRescroll(v25, l_Body_0);
                            end);
                            return ;
                        end;
                    end, 
                    [v3.Change.AbsoluteSize] = function(v33)
                        v23:setState({
                            textBoxWidth = v33.AbsoluteSize.X
                        }, function()
                            v23:calculateNeedsRescroll(v25, l_Body_0);
                        end);
                    end, 
                    [v3.Change.CursorPosition] = function(v34)
                        v23:setState({
                            cursorPosition = v34.CursorPosition
                        }, function()
                            v23:calculateNeedsRescroll(v25, l_Body_0);
                        end);
                    end
                }, {
                    PlaceholderText = v3.createElement(v8, {
                        themeKey = "TextDefault", 
                        fontKey = "Body", 
                        Text = v23.props.PlaceholderText, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        TextTransparency = 0.5, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        Visible = v23.props.text == ""
                    })
                })
            })
        });
    end);
end;
v13.render = function(v35)
    return l_withSelectionCursorProvider_0(function(v36)
        return v35:renderWithSelectionCursor(v36);
    end);
end;
v13.didUpdate = function(v37, v38)
    if v37.props.enabled or not v38.enabled then
        if not (((not v37.props.enabled or v38.enabled) or not v37.props.autoFocusOnEnabled) or not v37.textBoxRef.current) then
            v37.textBoxRef.current:CaptureFocus();
        end;
    elseif not (not v37.textBoxRef.current or not v37.textBoxRef.current:IsFocused()) then
        v37.textBoxRef.current:ReleaseFocus();
        return ;
    end;
end;
return v3.forwardRef(function(v39, v40)
    return v3.createElement(v13, v2.Dictionary.join(v39, {
        textBoxRef = v40
    }));
end);

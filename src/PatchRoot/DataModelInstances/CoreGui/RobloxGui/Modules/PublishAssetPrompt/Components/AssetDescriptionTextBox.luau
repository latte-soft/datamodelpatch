local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local v7 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_Focusable_0 = v6.Focusable;
local v9 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v9.Style.withStyle;
local l_withSelectionCursorProvider_0 = v9.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v9.App.SelectionImage.CursorKind;
local l_Images_0 = v9.App.ImageSet.Images;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local v15 = l_Images_0["component_assets/circle_17_stroke_1"];
local v16 = Rect.new(8, 8, 8, 8);
local v17 = require(script.Parent.Parent.GetFFlagValidateDescription);
local v18 = v3.PureComponent:extend("AssetDescriptionTextBox");
v18.validateProps = v5.strictInterface({
    Size = v5.optional(v5.UDim2), 
    Position = v5.optional(v5.UDim2), 
    onAssetDescriptionUpdated = v5.callback, 
    descriptionTextBoxRef = v5.optional(v5.table), 
    NextSelectionUp = v5.optional(v5.table), 
    assetType = v5.optional(v5.enum(Enum.AssetType)), 
    defaultDescription = v5.optional(v5.string)
});
local function _(v19)
    local v20 = utf8.len(utf8.nfcnormalize(v19));
    if v20 == nil then
        return 0;
    else
        return v20;
    end;
end;
local function _(v22, v23)
    local v24 = utf8.len(utf8.nfcnormalize(v22));
    return v23 < (v24 == nil and 0 or v24);
end;
v18.init = function(v26)
    v26:setState({
        lastValidDescription = "", 
        assetDescription = v26.props.defaultDescription or "", 
        descriptionLength = 0, 
        scrollingFrameHeight = 100, 
        canvasHeight = 100, 
        canvasPosition = 0, 
        cursorPosition = 0, 
        textBoxWidth = 100, 
        isDescriptionValid = true
    });
    v26.wasInitiallyFocused = false;
    v26.tryFocusTextBox = function()
        if not v26.wasInitiallyFocused then
            local v27 = v26.props.descriptionTextBoxRef:getValue();
            if not (not v27 or not v27:IsDescendantOf(game)) then
                v27:CaptureFocus();
                v26.wasInitiallyFocused = true;
            end;
            return ;
        else
            return ;
        end;
    end;
end;
v18.calculateNeedsRescroll = function(v28, v29, v30)
    if v28.state.cursorPosition == -1 then
        return ;
    else
        local v31 = (v28.state.assetDescription or ""):sub(1, v28.state.cursorPosition - 1);
        local v32 = v30.RelativeSize * v29.Font.BaseSize;
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v31, v32, v30.Font, (Vector2.new(v28.state.textBoxWidth, 10000)));
        if v28.state.scrollingFrameHeight + v28.state.canvasPosition < l_l_TextService_0_TextSize_0.Y then
            v28:setState({
                canvasPosition = l_l_TextService_0_TextSize_0.Y - v28.state.scrollingFrameHeight
            });
            return ;
        else
            if l_l_TextService_0_TextSize_0.Y - v32 < v28.state.canvasPosition then
                v28:setState({
                    canvasPosition = l_l_TextService_0_TextSize_0.Y - v32
                });
            end;
            return ;
        end;
    end;
end;
v18.onTextChanged = function(v34, v35, v36, v37)
    local l_Text_0 = v35.Text;
    local v39 = not v17() and true or l_Text_0 ~= "";
    local l_lastValidDescription_0 = v34.state.lastValidDescription;
    local v41 = utf8.len(utf8.nfcnormalize(l_Text_0));
    if not ((v41 == nil and 0 or v41) > 1000) then
        l_lastValidDescription_0 = v35.Text;
    else
        l_Text_0 = l_lastValidDescription_0;
        v35.Text = l_Text_0;
    end;
    local v42 = utf8.len(utf8.nfcnormalize(l_Text_0));
    v34:setState({
        lastValidDescription = l_lastValidDescription_0, 
        assetDescription = l_Text_0, 
        descriptionLength = v42 == nil and 0 or v42, 
        canvasHeight = math.max(100, l_TextService_0:GetTextSize(l_Text_0, v37.RelativeSize * v36.Font.BaseSize, v37.Font, (Vector2.new(v34.state.textBoxWidth, 10000))).Y), 
        isDescriptionValid = v39
    });
    v34.props.onAssetDescriptionUpdated(l_Text_0, v39);
end;
v18.renderWithProviders = function(v43, v44, v45)
    local l_Font_0 = v44.Font;
    local l_CaptionBody_0 = l_Font_0.CaptionBody;
    local l_Theme_0 = v44.Theme;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v43.props.Size, 
        Position = v43.props.Position
    }, {
        TextboxContainer = v3.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v15, 
            ImageColor3 = l_Theme_0.UIDefault.Color, 
            ImageTransparency = l_Theme_0.UIDefault.Transparency, 
            LayoutOrder = 1, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, 0, 1, -15), 
            SliceCenter = v16
        }, {
            ScrollingFrame = v3.createElement("ScrollingFrame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                CanvasPosition = Vector2.new(0, v43.state.canvasPosition), 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                ScrollBarThickness = 12, 
                BorderSizePixel = 0, 
                [v3.Change.CanvasPosition] = function(v49)
                    v43:setState({
                        canvasPosition = v49.CanvasPosition.Y
                    });
                end, 
                [v3.Change.AbsoluteSize] = function(v50)
                    v43:setState({
                        scrollingFrameHeight = v50.AbsoluteSize.Y
                    });
                    v43:calculateNeedsRescroll(v44, l_CaptionBody_0);
                end
            }, {
                Textbox = v3.createElement(l_Focusable_0.TextBox, {
                    Text = v43.state.assetDescription, 
                    BackgroundTransparency = 1, 
                    ClearTextOnFocus = false, 
                    Font = l_Font_0.Header2.Font, 
                    TextSize = l_Font_0.BaseSize * l_CaptionBody_0.RelativeSize, 
                    PlaceholderColor3 = l_Theme_0.PlaceHolder.Color, 
                    PlaceholderText = v7:FormatByKey("CoreScripts.PublishAssetPrompt.AssetDescriptionPlaceholder"), 
                    Position = UDim2.fromOffset(6, 0), 
                    Size = UDim2.new(1, -24, 0, v43.state.canvasHeight), 
                    MultiLine = true, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    OverlayNativeInput = true, 
                    NextSelectionUp = v43.props.NextSelectionUp, 
                    [v3.Change.TextFits] = v43.onTextFitsChanged, 
                    SelectionImageObject = v45(l_CursorKind_0.InputFields), 
                    [v3.Ref] = v43.props.descriptionTextBoxRef, 
                    [v3.Event.AncestryChanged] = v43.tryFocusTextBox, 
                    [v3.Change.Text] = function(v51)
                        v43:onTextChanged(v51, v44, l_CaptionBody_0);
                    end, 
                    [v3.Change.AbsoluteSize] = function(v52)
                        v43:setState({
                            textBoxWidth = v52.AbsoluteSize.X
                        });
                        v43:calculateNeedsRescroll(v44, l_CaptionBody_0);
                    end, 
                    [v3.Change.CursorPosition] = function(v53)
                        v43:setState({
                            cursorPosition = v53.CursorPosition
                        });
                        v43:calculateNeedsRescroll(v44, l_CaptionBody_0);
                    end
                })
            })
        }), 
        LengthDisplay = if v43.state.descriptionLength / 1000 > 0.9 then v3.createElement("TextLabel", {
            Size = UDim2.new(not v17() and 1 or 0.2, 0, 0, 15), 
            AnchorPoint = Vector2.new(1, 1), 
            Position = UDim2.fromScale(1, 1), 
            Text = v43.state.descriptionLength .. "/" .. 1000, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            BackgroundTransparency = 1
        }) else nil, 
        WarningText = (v17() and (not not v17() and not v43.state.isDescriptionValid)) and v3.createElement("TextLabel", {
            Position = UDim2.new(0, 0, 1, -15), 
            BackgroundTransparency = 1, 
            Text = v7:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Size = UDim2.new(0.8, 0, 0, 20), 
            TextColor3 = l_Theme_0.Alert.Color, 
            TextWrapped = true, 
            Font = l_Font_0.Body.Font, 
            TextSize = 12
        })
    });
end;
v18.render = function(v54)
    return l_withStyle_0(function(v55)
        return l_withSelectionCursorProvider_0(function(v56)
            return v54:renderWithProviders(v55, v56);
        end);
    end);
end;
v18.didMount = function(v57)
    v57.tryFocusTextBox();
end;
return v4.connect(function(v58)
    return {
        assetType = v58.promptRequest.promptInfo.assetType
    };
end)(v18);

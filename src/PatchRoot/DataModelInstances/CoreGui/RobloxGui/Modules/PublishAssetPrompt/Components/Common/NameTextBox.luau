local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local l_Focusable_0 = v4.Focusable;
local v7 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v7.Style.withStyle;
local l_withSelectionCursorProvider_0 = v7.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v7.App.SelectionImage.CursorKind;
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local v13 = l_Images_0["component_assets/circle_17_stroke_1"];
local v14 = Rect.new(8, 8, 8, 8);
local v15 = v2.PureComponent:extend("NameTextBox");
local v16 = game:DefineFastFlag("RemoveNameRegex", false);
local v17 = require(script.Parent.Parent.Parent.FFlagPublishAvatarPromptEnabled);
v15.validateProps = v3.strictInterface({
    Size = v3.optional(v3.UDim2), 
    Position = v3.optional(v3.UDim2), 
    onNameUpdated = v3.callback, 
    LayoutOrder = v3.optional(v3.number), 
    nameTextBoxRef = v3.optional(v3.table), 
    NextSelectionDown = v3.optional(v3.table), 
    defaultName = v3.optional(v3.string)
});
local function _(v18, v19)
    local v20 = utf8.len(utf8.nfcnormalize(v18));
    if v20 == nil then
        return true;
    else
        return v19 < v20;
    end;
end;
v15.init = function(v22)
    v22:setState({
        name = v22.props.defaultName or "", 
        lastValidName = "", 
        isNameValid = true
    });
    v22.wasInitiallyFocused = false;
    v22.tryFocusTextBox = function()
        if not v22.wasInitiallyFocused then
            local v23 = if not v17 then v22.props.nameTextBoxRef:getValue() else v22.props.nameTextBoxRef and v22.props.nameTextBoxRef:getValue();
            if not (not v23 or not v23:IsDescendantOf(game)) then
                v23:CaptureFocus();
                v22.wasInitiallyFocused = true;
            end;
            return ;
        else
            return ;
        end;
    end;
    v22.onTextChanged = function(v24)
        local l_Text_0 = v24.Text;
        local v26 = utf8.len(utf8.nfcnormalize(l_Text_0));
        if v26 == nil or v26 > 50 then
            l_Text_0 = string.sub(l_Text_0, 1, utf8.offset(l_Text_0, 51) - 1);
            v24.Text = l_Text_0;
        end;
        local v27 = v22:checkIsNameValid(l_Text_0);
        local l_lastValidName_0 = v22.state.lastValidName;
        if v27 then
            l_lastValidName_0 = v24.Text;
        end;
        v22:setState({
            lastValidName = l_lastValidName_0, 
            isNameValid = v27, 
            name = l_Text_0
        });
        v22.props.onNameUpdated(l_Text_0, v27);
    end;
end;
v15.checkIsNameValid = function(_, v30)
    if not v16 then
        if string.match(v30, "[0-9a-zA-Z_'%s]+$") then
            if string.sub(v30, 1, 1) == " " then
                return false;
            end;
        else
            return false;
        end;
    end;
    if not string.match(v30, "^%s*$") then
        return true;
    else
        return false;
    end;
end;
v15.renderWithProviders = function(v31, v32, v33)
    local l_Font_0 = v32.Font;
    local l_Theme_0 = v32.Theme;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v31.props.Size, 
        Position = v31.props.Position, 
        LayoutOrder = if not v17 then nil else v31.props.LayoutOrder
    }, {
        TextBoxContainer = if not v17 then v2.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v13, 
            ImageColor3 = l_Theme_0.UIDefault.Color, 
            ImageTransparency = l_Theme_0.UIDefault.Transparency, 
            LayoutOrder = 1, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, 0, 0, 30), 
            SliceCenter = v14
        }, {
            Textbox = v2.createElement(l_Focusable_0.TextBox, {
                Text = v31.state.name, 
                BackgroundTransparency = 1, 
                ClearTextOnFocus = false, 
                Font = l_Font_0.CaptionBody.Font, 
                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                PlaceholderColor3 = l_Theme_0.PlaceHolder.Color, 
                PlaceholderText = v5:FormatByKey("CoreScripts.PublishAssetPrompt.AssetNamePlaceholder"), 
                Position = UDim2.fromOffset(6, 0), 
                Size = UDim2.new(1, -12, 1, 0), 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                OverlayNativeInput = true, 
                [v2.Change.Text] = v31.onTextChanged, 
                SelectionImageObject = v33(l_CursorKind_0.InputFields), 
                NextSelectionDown = v31.props.NextSelectionDown, 
                [v2.Ref] = v31.props.nameTextBoxRef, 
                [v2.Event.AncestryChanged] = v31.tryFocusTextBox
            })
        }) else v2.createElement("Frame", {
            BackgroundColor3 = l_Theme_0.BackgroundContrast.Color, 
            BackgroundTransparency = 0.5, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 30)
        }, {
            TextboxBorder = v2.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v13, 
                ImageColor3 = l_Theme_0.UIDefault.Color, 
                ImageTransparency = l_Theme_0.UIDefault.Transparency, 
                ScaleType = Enum.ScaleType.Slice, 
                Size = UDim2.new(1, 0, 1, 0), 
                SliceCenter = v14
            }, {
                Textbox = v2.createElement(l_Focusable_0.TextBox, {
                    Text = v31.state.name, 
                    BackgroundTransparency = 1, 
                    ClearTextOnFocus = false, 
                    Font = l_Font_0.CaptionBody.Font, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                    PlaceholderColor3 = l_Theme_0.PlaceHolder.Color, 
                    PlaceholderText = v31.props.defaultName, 
                    Position = UDim2.fromOffset(6, 0), 
                    Size = UDim2.new(1, -12, 1, 0), 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    OverlayNativeInput = true, 
                    [v2.Change.Text] = v31.onTextChanged, 
                    SelectionImageObject = v33(l_CursorKind_0.InputFields), 
                    NextSelectionDown = v31.props.NextSelectionDown, 
                    [v2.Ref] = v31.props.nameTextBoxRef, 
                    [v2.Event.AncestryChanged] = v31.tryFocusTextBox
                })
            }), 
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            })
        }), 
        WarningText = not v31.state.isNameValid and v2.createElement("TextLabel", {
            Position = UDim2.new(0, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Text = v5:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidName"), 
            LayoutOrder = 2, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Size = UDim2.new(1, 0, 0, 20), 
            TextColor3 = l_Theme_0.Alert.Color, 
            TextWrapped = true, 
            Font = l_Font_0.Body.Font, 
            TextSize = 12
        })
    });
end;
v15.render = function(v36)
    return l_withStyle_0(function(v37)
        return l_withSelectionCursorProvider_0(function(v38)
            return v36:renderWithProviders(v37, v38);
        end);
    end);
end;
v15.didMount = function(v39)
    v39.tryFocusTextBox();
end;
return v15;

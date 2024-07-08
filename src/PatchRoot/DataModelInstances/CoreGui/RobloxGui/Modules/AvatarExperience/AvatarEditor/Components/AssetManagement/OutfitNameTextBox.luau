local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.FitFrame);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_FitFrameVertical_0 = v3.FitFrameVertical;
local l_FitTextLabel_0 = v3.FitTextLabel;
local l_Focusable_0 = v4.Focusable;
local v9 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v9.Style.withStyle;
local l_withSelectionCursorProvider_0 = v9.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v9.App.SelectionImage.CursorKind;
local l_Images_0 = v9.App.ImageSet.Images;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local v15 = l_Images_0["component_assets/circle_17_stroke_1"];
local v16 = Rect.new(8, 8, 8, 8);
local v17 = v1.PureComponent:extend("OutfitNameTextBox");
v17.validateProps = v2.strictInterface({
    onOutfitNameUpdated = v2.callback
});
local function _(v18, v19)
    local v20 = utf8.len(v18);
    if v20 == nil then
        return true;
    elseif v20 <= v19 then
        return false;
    else
        return v19 < utf8.len(utf8.nfcnormalize(v18));
    end;
end;
v17.init = function(v22)
    v22:setState({
        lastValidName = "", 
        isNameInvalid = true, 
        outfitName = ""
    });
    v22.textBoxRef = v1.createRef();
    v22.wasInitiallyFocused = false;
    v22.tryFocusTextBox = function()
        if not v22.wasInitiallyFocused then
            local v23 = v22.textBoxRef:getValue();
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
        local l_l_Text_0_0 = l_Text_0;
        local v27 = utf8.len(l_l_Text_0_0);
        if v27 == nil or v27 > 99 and utf8.len(utf8.nfcnormalize(l_l_Text_0_0)) > 99 then
            l_Text_0 = v22.state.lastValidName;
            v24.Text = l_Text_0;
        end;
        local v28 = not string.match(l_Text_0, "^[0-9a-zA-Z%s]+$");
        l_l_Text_0_0 = v22.state.lastValidName;
        if not v28 then
            l_l_Text_0_0 = v24.Text;
        end;
        v22:setState({
            lastValidName = l_l_Text_0_0, 
            isNameInvalid = v28, 
            outfitName = l_Text_0
        });
        v22.props.onOutfitNameUpdated(l_Text_0, v28);
    end;
end;
v17.renderWithProviders = function(v29, v30, v31, v32)
    local l_Font_0 = v31.Font;
    local l_Theme_0 = v31.Theme;
    return v1.createElement(l_FitFrameVertical_0, {
        BackgroundTransparency = 1, 
        width = UDim.new(1, 0)
    }, {
        TextboxContainer = v1.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v15, 
            ImageColor3 = l_Theme_0.UIDefault.Color, 
            ImageTransparency = l_Theme_0.UIDefault.Transparency, 
            LayoutOrder = 1, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, 0, 0, 30), 
            SliceCenter = v16
        }, {
            Textbox = v1.createElement(l_Focusable_0.TextBox, {
                Text = "", 
                BackgroundTransparency = 1, 
                ClearTextOnFocus = false, 
                Font = l_Font_0.Header2.Font, 
                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                PlaceholderColor3 = l_Theme_0.PlaceHolder.Color, 
                PlaceholderText = v30.placeholderText, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.new(1, -12, 1, 0), 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                OverlayNativeInput = true, 
                [v1.Change.Text] = v29.onTextChanged, 
                SelectionImageObject = v32(l_CursorKind_0.InputFields), 
                [v1.Ref] = v29.textBoxRef, 
                [v1.Event.AncestryChanged] = v29.tryFocusTextBox
            })
        }), 
        WarningText = (v29.state.isNameInvalid and v29.state.outfitName ~= "") and v1.createElement(l_FitTextLabel_0, {
            width = UDim.new(1, 0), 
            BackgroundTransparency = 1, 
            Text = v30.warningText, 
            LayoutOrder = 2, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0, 20), 
            TextColor3 = l_Theme_0.Alert.Color, 
            TextWrapped = true, 
            Font = l_Font_0.Body.Font, 
            TextSize = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize
        })
    });
end;
v17.render = function(v35)
    return l_withLocalization_0({
        placeholderText = "Feature.Avatar.Label.Name", 
        warningText = "Feature.Avatar.Label.CostumeWarning"
    })(function(v36)
        return l_withStyle_0(function(v37)
            return l_withSelectionCursorProvider_0(function(v38)
                return v35:renderWithProviders(v36, v37, v38);
            end);
        end);
    end);
end;
v17.didMount = function(v39)
    v39.tryFocusTextBox();
end;
return v17;

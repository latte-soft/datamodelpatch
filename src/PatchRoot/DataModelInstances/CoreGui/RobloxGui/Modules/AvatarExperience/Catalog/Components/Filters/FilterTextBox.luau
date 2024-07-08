local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v5 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_useSelectionCursor_0 = v5.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v11 = l_Images_0["component_assets/circle_17_stroke_1"];
local v12 = Rect.new(8, 8, 8, 8);
return function(v13)
    local v14 = l_useStyle_0();
    local l_Font_0 = v14.Font;
    local l_Theme_0 = v14.Theme;
    return v2.createElement("Frame", {
        BackgroundTransparency = l_Theme_0.UIMuted.Transparency, 
        BackgroundColor3 = l_Theme_0.UIMuted.Color, 
        Size = if not v13.width then UDim2.new(1, 0, 0, 30) else UDim2.new(v13.width.Scale, v13.width.Offset, 0, 30), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        BorderSizePixel = 0, 
        LayoutOrder = v13.layoutOrder
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Outline = v2.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v11, 
            ImageColor3 = l_Theme_0.UIDefault.Color, 
            ImageTransparency = l_Theme_0.UIDefault.Transparency, 
            LayoutOrder = 1, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, 0, 0, 30), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            SliceCenter = v12
        }), 
        Textbox = v2.createElement(l_Focusable_0.TextBox, {
            Text = v13.text, 
            BackgroundTransparency = 1, 
            ClearTextOnFocus = false, 
            Font = l_Font_0.Header2.Font, 
            TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
            PlaceholderColor3 = l_Theme_0.PlaceHolder.Color, 
            PlaceholderText = v13.placeholderText, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(1, -16, 1, 0), 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            OverlayNativeInput = true, 
            [v2.Change.Text] = function(v17)
                local l_Text_0 = v17.Text;
                if v13.onTextChanged then
                    v13.onTextChanged(l_Text_0);
                end;
            end, 
            [v2.Event.Focused] = v13.onFocused, 
            SelectionImageObject = l_useSelectionCursor_0(l_CursorKind_0.InputFields), 
            ref = v13.textBoxRef, 
            NextSelectionLeft = v13.NextSelectionLeft, 
            NextSelectionRight = v13.NextSelectionRight, 
            NextSelectionUp = v13.NextSelectionUp, 
            NextSelectionDown = v13.NextSelectionDown
        })
    });
end;

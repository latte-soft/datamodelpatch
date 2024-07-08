local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local l_ImageSetLabel_0 = v2.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local l_withSelectionCursorProvider_0 = v2.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v2.App.SelectionImage.CursorKind;
local l_GetFFlagLuaAppFixSelectionCursor_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppFixSelectionCursor;
local v8 = v1.PureComponent:extend("GenericTextBox");
v8.defaultProps = {
    PaddingX = 0, 
    PaddingY = 0
};
v8.render = function(v9)
    if not l_GetFFlagLuaAppFixSelectionCursor_0() then
        return v9:renderWithSelectionCursor(nil);
    else
        return l_withSelectionCursorProvider_0(function(v10)
            return v9:renderWithSelectionCursor(v10);
        end);
    end;
end;
v8.renderWithSelectionCursor = function(v11, v12)
    local l_Size_0 = v11.props.Size;
    local l_Position_0 = v11.props.Position;
    local l_LayoutOrder_0 = v11.props.LayoutOrder;
    local l_Text_0 = v11.props.Text;
    local l_Font_0 = v11.props.Font;
    local l_TextSize_0 = v11.props.TextSize;
    local l_PlaceholderText_0 = v11.props.PlaceholderText;
    local l_TextXAlignment_0 = v11.props.TextXAlignment;
    local l_TextColor_0 = v11.props.TextColor;
    local l_PlaceholderColor_0 = v11.props.PlaceholderColor;
    local l_ClearTextOnFocus_0 = v11.props.ClearTextOnFocus;
    local l_TextInputType_0 = v11.props.TextInputType;
    local l_ReturnKeyType_0 = v11.props.ReturnKeyType;
    local l_ManualFocusRelease_0 = v11.props.ManualFocusRelease;
    local l_NextSelectionDown_0 = v11.props.NextSelectionDown;
    local l_NextSelectionLeft_0 = v11.props.NextSelectionLeft;
    local l_NextSelectionRight_0 = v11.props.NextSelectionRight;
    local l_NextSelectionUp_0 = v11.props.NextSelectionUp;
    local l_Color_0 = v11.props.Color;
    local l_Transparency_0 = v11.props.Transparency;
    local l_TextTransparency_0 = v11.props.TextTransparency;
    local l_onChangeText_0 = v11.props.onChangeText;
    local l_onAncestryChanged_0 = v11.props.onAncestryChanged;
    local l_onReturnPressedFromOnScreenKeyboard_0 = v11.props.onReturnPressedFromOnScreenKeyboard;
    local l_onFocused_0 = v11.props.onFocused;
    local l_onFocusLost_0 = v11.props.onFocusLost;
    local l_onMouseEnter_0 = v11.props.onMouseEnter;
    local l_onMouseLeave_0 = v11.props.onMouseLeave;
    local l_PaddingX_0 = v11.props.PaddingX;
    local l_PaddingY_0 = v11.props.PaddingY;
    local l_TextBoxRef_0 = v11.props.TextBoxRef;
    local v44 = nil;
    if l_GetFFlagLuaAppFixSelectionCursor_0() then
        v44 = v12(l_CursorKind_0.InputButton);
    end;
    return v1.createElement(l_ImageSetLabel_0, {
        Size = l_Size_0, 
        Position = l_Position_0, 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundTransparency = 1, 
        Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
        ImageColor3 = l_Color_0, 
        ImageTransparency = l_Transparency_0, 
        BorderSizePixel = 0, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 9, 9)
    }, {
        UIPadding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_PaddingY_0), 
            PaddingBottom = UDim.new(0, l_PaddingY_0), 
            PaddingLeft = UDim.new(0, l_PaddingX_0), 
            PaddingRight = UDim.new(0, l_PaddingX_0)
        }), 
        TextBox = v1.createElement("TextBox", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Text = l_Text_0, 
            PlaceholderText = l_PlaceholderText_0, 
            PlaceholderColor3 = l_PlaceholderColor_0, 
            Font = l_Font_0, 
            TextSize = l_TextSize_0, 
            TextColor3 = l_TextColor_0, 
            TextTransparency = l_TextTransparency_0, 
            TextXAlignment = l_TextXAlignment_0, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundTransparency = 1, 
            ClearTextOnFocus = l_ClearTextOnFocus_0, 
            OverlayNativeInput = true, 
            ClipsDescendants = true, 
            TextInputType = l_TextInputType_0, 
            ReturnKeyType = l_ReturnKeyType_0, 
            ManualFocusRelease = l_ManualFocusRelease_0, 
            NextSelectionDown = l_NextSelectionDown_0, 
            NextSelectionLeft = l_NextSelectionLeft_0, 
            NextSelectionRight = l_NextSelectionRight_0, 
            NextSelectionUp = l_NextSelectionUp_0, 
            SelectionImageObject = v44, 
            [v1.Ref] = l_TextBoxRef_0, 
            [v1.Change.Text] = l_onChangeText_0, 
            [v1.Event.AncestryChanged] = l_onAncestryChanged_0, 
            [v1.Event.ReturnPressedFromOnScreenKeyboard] = l_onReturnPressedFromOnScreenKeyboard_0, 
            [v1.Event.Focused] = l_onFocused_0, 
            [v1.Event.FocusLost] = l_onFocusLost_0, 
            [v1.Event.MouseEnter] = l_onMouseEnter_0, 
            [v1.Event.MouseLeave] = l_onMouseLeave_0
        })
    });
end;
return v8;

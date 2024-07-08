local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v4 = require(l_CorePackages_0.UIBlox);
local l_withSelectionCursorProvider_0 = v4.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local v8 = Rect.new(7, 8, 7, 8);
local v9 = v2.PureComponent:extend("IconTextBox");
v9.defaultProps = {
    LayoutOrder = 0, 
    imagePadding = 6
};
v9.render = function(v10)
    return v4.Style.withStyle(function(v11)
        local l_Font_0 = v11.Font;
        local l_Theme_0 = v11.Theme;
        local l_Image_0 = v10.props.Image;
        local l_imagePadding_0 = v10.props.imagePadding;
        local l_LayoutOrder_0 = v10.props.LayoutOrder;
        local l_PlaceholderText_0 = v10.props.PlaceholderText;
        local v18 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        local v19 = v18 + l_imagePadding_0 * 2;
        local l_forwardRef_0 = v10.props.forwardRef;
        return l_withSelectionCursorProvider_0(function(v21)
            return v2.createElement("ImageLabel", {
                ImageRectSize = Vector2.new(0, 0), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/LuaDiscussions/buttonStroke.png", 
                ImageColor3 = l_Theme_0.UIDefault.Color, 
                ImageRectOffset = Vector2.new(0, 0), 
                LayoutOrder = l_LayoutOrder_0, 
                ScaleType = Enum.ScaleType.Slice, 
                Size = UDim2.new(1, 0, 0, 30), 
                SliceCenter = v8
            }, {
                IconImage = v2.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Position = UDim2.new(0, l_imagePadding_0, 0.5, 0), 
                    Size = UDim2.new(0, v18, 0, v18), 
                    Image = l_Image_0, 
                    ImageColor3 = l_Theme_0.TextDefault.Color, 
                    ImageTransparency = l_Theme_0.TextDefault.Transparency
                }), 
                Textbox = v2.createElement(l_Focusable_0.TextBox, {
                    BackgroundTransparency = 1, 
                    ClearTextOnFocus = false, 
                    Font = l_Font_0.Header2.Font, 
                    PlaceholderText = l_PlaceholderText_0, 
                    PlaceholderColor3 = l_Theme_0.PlaceHolder.Color, 
                    Position = UDim2.new(0, v19, 0, 0), 
                    Size = UDim2.new(1, -v19, 1, 0), 
                    TextInputType = v10.props.TextInputType, 
                    Text = "", 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextSize = v18, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    OverlayNativeInput = true, 
                    [v2.Change.Text] = v10.props[v2.Change.Text], 
                    [v2.Ref] = l_forwardRef_0, 
                    NextSelectionLeft = v10.props.NextSelectionLeft, 
                    NextSelectionRight = v10.props.NextSelectionRight, 
                    NextSelectionUp = v10.props.NextSelectionUp, 
                    NextSelectionDown = v10.props.NextSelectionDown, 
                    SelectionImageObject = v21(l_CursorKind_0.RoundedRectNoInset)
                })
            });
        end);
    end);
end;
return v2.forwardRef(function(v22, v23)
    return v2.createElement(v9, v1.Dictionary.join(v22, {
        forwardRef = v23
    }));
end);

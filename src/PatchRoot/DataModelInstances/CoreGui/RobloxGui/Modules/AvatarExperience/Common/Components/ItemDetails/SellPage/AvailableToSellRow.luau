local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local v5 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_withStyle_0 = v5.Style.withStyle;
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local v11 = l_Images_0["icons/actions/edit/add"];
local v12 = v2.PureComponent:extend("AvailableToSellRow");
v12.defaultProps = {
    horizontalPadding = 24, 
    onActivated = function()
    end
};
v12.render = function(v13)
    return l_withStyle_0(function(v14)
        local l_Font_0 = v14.Font;
        local l_Theme_0 = v14.Theme;
        local l_Position_0 = v13.props.Position;
        local l_LayoutOrder_0 = v13.props.LayoutOrder;
        local l_horizontalPadding_0 = v13.props.horizontalPadding;
        local l_onActivated_0 = v13.props.onActivated;
        local v21 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        local l_Text_0 = v13.props.Text;
        local l_forwardRef_0 = v13.props.forwardRef;
        return l_withSelectionCursorProvider_0(function(v24)
            return v2.createElement(l_Focusable_0.Frame, {
                BackgroundTransparency = 1, 
                LayoutOrder = l_LayoutOrder_0, 
                Position = l_Position_0, 
                Size = UDim2.new(1, 0, 0, 70), 
                NextSelectionLeft = v13.props.NextSelectionLeft, 
                NextSelectionRight = v13.props.NextSelectionRight, 
                NextSelectionUp = v13.props.NextSelectionUp, 
                NextSelectionDown = v13.props.NextSelectionDown, 
                [v2.Ref] = l_forwardRef_0, 
                SelectionImageObject = v24(l_CursorKind_0.RoundedRectNoInset), 
                inputBindings = {
                    SellItem = v3.Input.onBegin(Enum.KeyCode.ButtonA, l_onActivated_0)
                }
            }, {
                Paddding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_horizontalPadding_0), 
                    PaddingRight = UDim.new(0, l_horizontalPadding_0)
                }), 
                TextLabel = v2.createElement("TextLabel", {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Font = l_Font_0.Body.Font, 
                    LayoutOrder = 1, 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    Size = UDim2.new(1, -50, 1, 0), 
                    Text = l_Text_0, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextSize = v21, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                PressableButton = v2.createElement("TextButton", {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Position = UDim2.new(1, -50, 0.5, 0), 
                    Size = UDim2.new(0, 50, 0, 50), 
                    Text = "", 
                    [v2.Event.Activated] = l_onActivated_0
                }, {
                    RemoveButton = v2.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Image = v11, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                        LayoutOrder = 2, 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.new(0, 40, 0, 40)
                    })
                })
            });
        end);
    end);
end;
return v2.forwardRef(function(v25, v26)
    return v2.createElement(v12, v1.Dictionary.join(v25, {
        forwardRef = v26
    }));
end);

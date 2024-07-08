local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.UIBlox);
local l_RoactFitComponents_0 = require(l_CorePackages_0.AvatarExperienceDeps).RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_withStyle_0 = v6.Style.withStyle;
local l_withSelectionCursorProvider_0 = v6.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v6.App.ImageSet.Images;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local v15 = l_Images_0["icons/common/robux"];
local v16 = l_Images_0["icons/actions/edit/remove"];
local v17 = v2.PureComponent:extend("CurrentlySellingRow");
v17.defaultProps = {
    horizontalPadding = 0, 
    onActivated = function()
    end
};
v17.render = function(v18)
    local l_userAssetInfo_0 = v18.props.userAssetInfo;
    if l_userAssetInfo_0 then
        return l_withStyle_0(function(v20)
            local l_Font_0 = v20.Font;
            local l_Theme_0 = v20.Theme;
            local l_Position_0 = v18.props.Position;
            local l_LayoutOrder_0 = v18.props.LayoutOrder;
            local l_horizontalPadding_0 = v18.props.horizontalPadding;
            local l_onActivated_0 = v18.props.onActivated;
            local l_isLimitedUnique_0 = v18.props.isLimitedUnique;
            local v28 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
            local v29 = "# " .. tostring(l_userAssetInfo_0.serialNumber);
            local l_priceInRobux_0 = l_userAssetInfo_0.priceInRobux;
            local l_forwardRef_0 = v18.props.forwardRef;
            return l_withSelectionCursorProvider_0(function(v32)
                return v2.createElement(l_Focusable_0.Frame, {
                    BackgroundTransparency = 1, 
                    LayoutOrder = l_LayoutOrder_0, 
                    Position = l_Position_0, 
                    Size = UDim2.new(1, 0, 0, 70), 
                    NextSelectionLeft = v18.props.NextSelectionLeft, 
                    NextSelectionRight = v18.props.NextSelectionRight, 
                    NextSelectionUp = v18.props.NextSelectionUp, 
                    NextSelectionDown = v18.props.NextSelectionDown, 
                    [v2.Ref] = l_forwardRef_0, 
                    onFocusGained = v18.props.onFocusGained, 
                    SelectionImageObject = v32(l_CursorKind_0.RoundedRectNoInset), 
                    inputBindings = {
                        RemoveItemFromSale = v3.Input.onBegin(Enum.KeyCode.ButtonA, l_onActivated_0)
                    }
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, l_horizontalPadding_0), 
                        PaddingRight = UDim.new(0, l_horizontalPadding_0)
                    }), 
                    SerialAndPriceContainer = v2.createElement(l_FitFrameVertical_0, {
                        width = UDim.new(1, 0), 
                        contentPadding = UDim.new(0, 6), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        SerialNumberTextLabel = l_isLimitedUnique_0 and v2.createElement(l_FitTextLabel_0, {
                            width = UDim.new(1, 0), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Font = l_Font_0.Body.Font, 
                            LayoutOrder = 1, 
                            Position = UDim2.new(0, 0, 0, -v28), 
                            Size = UDim2.new(1, 0, 0, 0), 
                            Text = v29, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color, 
                            TextSize = v28, 
                            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        }), 
                        RobuxContainer = v2.createElement(l_FitFrameVertical_0, {
                            width = UDim.new(1, -40), 
                            contentPadding = UDim.new(0, 6), 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            LayoutOrder = 2
                        }, {
                            Image = v2.createElement(l_ImageSetLabel_0, {
                                LayoutOrder = 1, 
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(0, v28, 0, v28), 
                                Image = v15, 
                                ImageColor3 = l_Theme_0.TextDefault.Color, 
                                ImageTransparency = l_Theme_0.TextDefault.Transparency
                            }), 
                            Text = v2.createElement(l_FitTextLabel_0, {
                                width = UDim.new(1, 0), 
                                LayoutOrder = 2, 
                                Size = UDim2.new(1, -v28, 0, v28), 
                                BackgroundTransparency = 1, 
                                Text = tostring(l_priceInRobux_0), 
                                Font = l_Font_0.Body.Font, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                                TextSize = v28, 
                                TextXAlignment = Enum.TextXAlignment.Left
                            })
                        })
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
                        RemoveIcon = v2.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Image = v16, 
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
    else
        return ;
    end;
end;
v17 = v5.connect(function(v33, v34)
    return {
        userAssetInfo = v33.AvatarExperience.Catalog.UserAssets[v34.userAssetId]
    };
end)(v17);
return v2.forwardRef(function(v35, v36)
    return v2.createElement(v17, v1.Dictionary.join(v35, {
        forwardRef = v36
    }));
end);

local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local l_FitFrameVertical_0 = require(l_Parent_2.RoactFitComponents).FitFrameVertical;
local v5 = require(l_Parent_2.UIBlox);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_withStyle_0 = v5.Core.Style.withStyle;
local v9 = require(l_Parent_1.Locale.MultiTextLocalizer);
local v10 = require(l_Parent_0.ProductDetails);
local v11 = v3.Component:extend(script.Name);
v11.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0)
};
v11.init = function(v12)
    v12.contentRef = v3.createRef();
    v12.state = {
        contentSize = Vector2.new(0, 0), 
        footerSize = Vector2.new(0, 0)
    };
    v12.changeContentSize = function(v13)
        if v12.state.contentSize ~= v13.AbsoluteSize then
            v12:setState({
                contentSize = v13.AbsoluteSize
            });
        end;
    end;
end;
v11.render = function(v14)
    return v3.createElement(v9, {
        keys = {
            InsufficientRobuxTitle = {
                key = ("IAPExperience.InsufficientRobux.%s"):format("Title.InsufficientRobux")
            }, 
            YouNeed = {
                key = ("IAPExperience.InsufficientRobux.%s"):format("Text.YouNeed")
            }, 
            RobuxStore = {
                key = ("IAPExperience.InsufficientRobux.%s"):format("Action.RobuxStore")
            }, 
            ButtonCancel = {
                key = ("IAPExperience.InsufficientRobux.%s"):format("Action.Cancel")
            }
        }, 
        render = function(v15)
            return v14:renderAlert(v15);
        end
    });
end;
v11.renderAlert = function(v16, v17)
    local l_props_0 = v16.props;
    return l_withStyle_0(function(v19)
        local l_Theme_0 = v19.Theme;
        local l_Font_0 = v19.Font;
        local v22 = v17.YouNeed:gsub("{robux}", (string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring((Color3.new(math.round(l_Theme_0.TextEmphasis.Color.R * 255), math.round(l_Theme_0.TextEmphasis.Color.G * 255), (math.round(l_Theme_0.TextEmphasis.Color.B * 255))))), utf8.char(57346), (tostring(l_props_0.itemRobuxCost - l_props_0.balanceAmount)))));
        return v3.createElement(l_InteractiveAlert_0, {
            screenSize = l_props_0.screenSize, 
            position = l_props_0.position, 
            anchorPoint = l_props_0.anchorPoint, 
            title = v17.InsufficientRobuxTitle, 
            middleContent = function()
                return v3.createElement(l_FitFrameVertical_0, {
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    contentPadding = UDim.new(0, 15), 
                    [v3.Ref] = v16.contentRef, 
                    [v3.Change.AbsoluteSize] = v16.changeContentSize
                }, {
                    ProductDetails = v3.createElement(v10, {
                        layoutOrder = 1, 
                        model = l_props_0.model, 
                        itemIcon = l_props_0.itemIcon, 
                        itemName = l_props_0.itemName, 
                        itemRobuxCost = l_props_0.itemRobuxCost
                    }), 
                    Underline = v3.createElement("Frame", {
                        LayoutOrder = 2, 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        Size = UDim2.new(1, 0, 0, 1)
                    }), 
                    AdditionalBuyText = v3.createElement("TextLabel", {
                        LayoutOrder = 3, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, v16.state.contentSize.X, 0, 0), 
                        RichText = true, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextWrapped = true, 
                        Font = l_Font_0.Body.Font, 
                        Text = v22, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextTransparency = l_Theme_0.TextDefault.Transparency
                    })
                });
            end, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = l_props_0.cancelPurchaseActivated, 
                            text = v17.ButtonCancel, 
                            inputIcon = l_props_0.cancelControllerIcon
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = l_props_0.robuxStoreActivated, 
                            text = v17.RobuxStore, 
                            inputIcon = l_props_0.acceptControllerIcon
                        }
                    }
                }
            }
        });
    end);
end;
return v11;

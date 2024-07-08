local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.RoactFitComponents);
local l_FitFrameVertical_0 = v3.FitFrameVertical;
local l_FitTextLabel_0 = v3.FitTextLabel;
local v6 = require(l_Parent_1.UIBlox);
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v6.App.Constant.IconSize;
local l_withStyle_0 = v6.Core.Style.withStyle;
local v13 = require(l_Parent_0.Locale.MultiTextLocalizer);
local v14 = require(l_Parent_0.Generic.HumanoidViewport);
local v15 = require(l_Parent_0.Flags.getEnableHumanoidViewportItemIcon);
local v16 = l_Images_0["icons/status/imageunavailable"];
local v17 = v2.Component:extend(script.Name);
v17.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0)
};
v17.init = function(v18)
    v18.contentRef = v2.createRef();
    v18.state = {
        contentSize = Vector2.new(0, 0)
    };
    v18.changeContentSize = function(v19)
        if v18.state.contentSize ~= v19.AbsoluteSize then
            v18:setState({
                contentSize = v19.AbsoluteSize
            });
        end;
    end;
end;
v17.render = function(v20)
    return v2.createElement(v13, {
        keys = {
            PurchaseSucceededTitle = {
                key = ("IAPExperience.PurchaseSuccess.%s"):format("Title.PurchaseSucceeded")
            }, 
            YouOwnText = {
                key = ("IAPExperience.PurchaseSuccess.%s"):format("Text.YouOwn"), 
                params = {
                    name = v20.props.itemName
                }
            }, 
            BalanceNow = {
                key = ("IAPExperience.PurchaseSuccess.%s"):format("Text.BalanceNow")
            }, 
            BackToGameButtonText = {
                key = ("IAPExperience.PurchaseSuccess.%s"):format("Action.BackToGame")
            }, 
            EquipText = {
                key = ("IAPExperience.PurchaseSuccess.%s"):format("Action.Equip")
            }, 
            BackToShopText = {
                key = ("IAPExperience.PurchaseSuccess.%s"):format("Action.BackToShop")
            }
        }, 
        render = function(v21)
            return v20:renderAlert(v21);
        end
    });
end;
v17.renderAlert = function(v22, v23)
    local l_props_0 = v22.props;
    return l_withStyle_0(function(v25)
        local l_Theme_0 = v25.Theme;
        local l_Font_0 = v25.Font;
        local v28 = v23.YouOwnText .. " " .. v23.BalanceNow:gsub("{robux}", utf8.char(57346) .. tostring(l_props_0.balance));
        local v29 = nil;
        v29 = if not v22.props.equipActivated then {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = l_props_0.doneActivated, 
                        text = v23.BackToGameButtonText, 
                        inputIcon = l_props_0.confirmControllerIcon
                    }
                }
            }
        } else {
            buttons = {
                {
                    props = {
                        onActivated = l_props_0.doneActivated, 
                        text = v23.BackToShopText, 
                        inputIcon = l_props_0.cancelControllerIcon
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = l_props_0.equipActivated, 
                        text = v23.EquipText, 
                        inputIcon = l_props_0.confirmControllerIcon
                    }
                }
            }
        };
        local v30 = if not l_props_0.itemIcon then v2.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 5, 0, 5), 
            Size = UDim2.new(0, l_IconSize_0.Large, 0, l_IconSize_0.Large), 
            ScaleType = Enum.ScaleType.Stretch, 
            Image = v16, 
            ImageColor3 = l_Theme_0.UIDefault.Color, 
            ImageTransparency = l_Theme_0.UIDefault.Transparency
        }) else v2.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 5, 0, 5), 
            Size = UDim2.new(0, 85, 0, 85), 
            ScaleType = Enum.ScaleType.Stretch, 
            Image = l_props_0.itemIcon, 
            ImageTransparency = 0
        });
        if not (not v15() or not l_props_0.model) then
            v30 = v2.createElement(v14, {
                model = l_props_0.model, 
                Position = UDim2.fromOffset(5, 5), 
                Size = UDim2.fromOffset(85, 85)
            });
        end;
        return v2.createElement(l_InteractiveAlert_0, {
            screenSize = l_props_0.screenSize, 
            position = l_props_0.position, 
            anchorPoint = l_props_0.anchorPoint, 
            title = v23.PurchaseSucceededTitle, 
            middleContent = function()
                return v2.createElement(l_FitFrameVertical_0, {
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    contentPadding = UDim.new(0, 24), 
                    [v2.Ref] = v22.contentRef, 
                    [v2.Change.AbsoluteSize] = v22.changeContentSize
                }, {
                    ItemIconFrame = v2.createElement(l_FitFrameVertical_0, {
                        LayoutOrder = 0, 
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }, {
                        ItemIcon = v30
                    }), 
                    YouOwnText = v2.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        TextWrapped = true, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        maximumWidth = v22.state.contentSize.X, 
                        Font = l_Font_0.Body.Font, 
                        Text = v28, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color
                    })
                });
            end, 
            buttonStackInfo = v29
        });
    end);
end;
return v17;

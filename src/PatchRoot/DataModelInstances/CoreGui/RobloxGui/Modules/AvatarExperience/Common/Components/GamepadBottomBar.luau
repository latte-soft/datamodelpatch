local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.AvatarExperienceDeps);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Cryo);
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v9 = require(l_CorePackages_0.UIBlox);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_FitFrameHorizontal_0 = v3.RoactFitComponents.FitFrameHorizontal;
local l_withStyle_0 = v9.Style.withStyle;
local l_SpringAnimatedItem_0 = v9.Utility.SpringAnimatedItem;
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadBottomBarContent);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadBottomBarElement);
local v16 = require(l_Modules_0.LuaApp.Constants);
local v17 = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local v18 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v19 = {
    dampingRatio = 1, 
    frequency = 2.5
};
local v20 = v4.PureComponent:extend("GamepadBottomBar");
v20.validateProps = v6.strictInterface({
    displayOrder = v6.number, 
    hideGamepadBottomBar = v6.optional(v6.boolean), 
    boundInputs = v6.table, 
    screenSize = v6.Vector2
});
v20.defaultProps = {
    hideGamepadBottomBar = false
};
v20.getDerivedStateFromProps = function(v21, _)
    local v23 = v18.getNumElementsWithKeyField(v21.boundInputs) > 0;
    return {
        showBar = v23, 
        height = not not v23 and v16.GAMEPAD_BOTTOM_BAR_SIZE or v16.GAMEPAD_BOTTOM_BAR_SIZE / 2
    };
end;
v20.renderWithLocalization = function(v24, v25)
    if v24.state.showBar then
        return l_withStyle_0(function(v26)
            local l_Theme_0 = v26.Theme;
            local l_Font_0 = v26.Font;
            local l_Font_1 = l_Font_0.Header2.Font;
            local v30 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
            local v31 = v25.bText or v25.backText;
            local v32 = (24 + ((v9.App.Constant.IconSize.Regular + l_Text_0.GetTextWidth(v31, l_Font_1, v30)) + 8)) + 36;
            return v4.createElement(v4.Portal, {
                target = l_CoreGui_0
            }, {
                PortalUIForGamepadBottomBar = v4.createElement(v17, {
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    DisplayOrder = v24.props.displayOrder, 
                    Enabled = not v24.props.hideGamepadBottomBar
                }, {
                    AnimatedFrame = v4.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
                        regularProps = {
                            AnchorPoint = Vector2.new(0, 0), 
                            Position = UDim2.new(0, 0, 0, 0), 
                            BackgroundColor3 = l_Theme_0.BackgroundUIContrast.Color, 
                            BackgroundTransparency = l_Theme_0.BackgroundUIContrast.Transparency, 
                            Size = UDim2.new(1, 0, 0, v16.GAMEPAD_BOTTOM_BAR_SIZE), 
                            ZIndex = 3
                        }, 
                        animatedValues = {
                            positionY = v24.state.height
                        }, 
                        mapValuesToProps = function(v33)
                            return {
                                Position = UDim2.new(0, 0, 1, -v33.positionY)
                            };
                        end, 
                        springOptions = v19
                    }, {
                        BackElement = v4.createElement(v15, {
                            elementIcon = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", 
                            elementText = v31, 
                            position = UDim2.new(0, 24, 0, 0)
                        }), 
                        UIElementsFrame = v4.createElement("Frame", {
                            Position = UDim2.new(0, v32, 0, 0), 
                            Size = UDim2.new(1, -v32, 1, 0), 
                            BackgroundTransparency = 1, 
                            ClipsDescendants = true
                        }, {
                            UIElements = v4.createElement(l_FitFrameHorizontal_0, {
                                height = UDim.new(1, 0), 
                                FillDirection = Enum.FillDirection.Horizontal, 
                                AnchorPoint = Vector2.new(1, 0), 
                                BackgroundTransparency = 1, 
                                Position = UDim2.new(1, -24, 0, 0), 
                                contentPadding = UDim.new(0, 36)
                            }, {
                                GamepadBottomBarElements = v4.createElement(v14, {
                                    width = v24.props.screenSize.X - v32, 
                                    boundInputs = v24.props.boundInputs
                                })
                            })
                        })
                    })
                })
            });
        end);
    else
        return nil;
    end;
end;
v20.render = function(v34)
    local v35 = {
        backText = "CommonUI.Controls.Action.Back"
    };
    local v36 = v34.props.boundInputs[Enum.KeyCode.ButtonB];
    if not (not v36 or not v36.key) then
        v35 = v7.Dictionary.join(v35, {
            bText = v36.key
        });
    end;
    return l_withLocalization_0(v35)(function(v37)
        return v34:renderWithLocalization(v37);
    end);
end;
return (v5.connect(function(v38, _)
    return {
        boundInputs = v38.GamepadBottomBar.boundInputs, 
        screenSize = v38.ScreenSize
    };
end)(v20));

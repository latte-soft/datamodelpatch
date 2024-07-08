local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local _ = require(script:FindFirstAncestor("TopBar").TokenMappers.MenuNavigationPromptTokenMapper);
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v9 = {
    ButtonSelect = "CoreScripts.InGameMenu.Label.ViewButton", 
    ButtonTouchpad = "CoreScripts.InGameMenu.Label.TouchpadButton", 
    ButtonShare = "CoreScripts.InGameMenu.Label.TouchpadButton"
};
local v10 = nil;
local v11 = nil;
local v12 = nil;
local function v18(v13)
    local l_MenuNavigationPrompt_0 = l_useDesignTokens_0().LuaApps.MenuNavigationPrompt;
    local l_Color_0 = l_MenuNavigationPrompt_0.Color;
    local l_Size_0 = l_MenuNavigationPrompt_0.Size;
    local l_Space_0 = l_MenuNavigationPrompt_0.Space;
    return v2.createElement("Frame", {
        BackgroundColor3 = l_Color_0.backgroundUiColor.Color3, 
        BackgroundTransparency = l_Color_0.backgroundUiColor.Transparency, 
        Visible = v13.Visible, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(l_Size_0.promptWidth / l_Size_0.displayWidth, 0), 
        Position = v13.Position, 
        AnchorPoint = Vector2.new(0.5, 0.5)
    }, {
        Corner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, l_MenuNavigationPrompt_0.Radius.cornerRadius)
        }), 
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        HeaderArea = v2.createElement(v11), 
        Separator = v2.createElement("Frame", {
            LayoutOrder = 100, 
            Size = UDim2.new(1, -2 * l_Space_0.bodyPadding, 0, 1), 
            BackgroundColor3 = l_Color_0.separatorColor.Color3, 
            BackgroundTransparency = l_Color_0.separatorColor.Transparency, 
            BorderSizePixel = 0
        }), 
        Body = v2.createElement(v12), 
        UISizeConstraint = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(math.huge, math.huge), 
            MinSize = Vector2.new(l_Size_0.imageWidth + 2 * l_Space_0.bodyPadding, 1)
        })
    });
end;
v10 = function()
    local l_MenuNavigationPrompt_1 = l_useDesignTokens_0().LuaApps.MenuNavigationPrompt;
    local l_Typography_0 = l_MenuNavigationPrompt_1.Typography;
    local l_Color_1 = l_MenuNavigationPrompt_1.Color;
    local l_Size_1 = l_MenuNavigationPrompt_1.Size;
    local l_Space_1 = l_MenuNavigationPrompt_1.Space;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = 0, 
        AutomaticSize = Enum.AutomaticSize.XY
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_Space_1.iconPadding)
        }), 
        ButtonLabelGroup = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 0
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, l_Space_1.iconPadding)
            }), 
            Icon = v2.createElement("ImageLabel", {
                LayoutOrder = 0, 
                BackgroundTransparency = 1, 
                Image = not game:GetEngineFeature("GetImageForKeyCode") and "rbxasset://textures/ui/Controls/DesignSystem/ButtonSelect@2x.png" or l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonSelect), 
                Size = UDim2.fromOffset(l_Size_1.iconSize, l_Size_1.iconSize)
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, l_Space_1.iconPadding), 
                    PaddingBottom = UDim.new(0, l_Space_1.iconPadding), 
                    PaddingRight = UDim.new(0, l_Space_1.iconPadding), 
                    PaddingLeft = UDim.new(0, l_Space_1.iconPadding)
                })
            }), 
            ControllerButtonLabel = v2.createElement("TextLabel", {
                Text = l_useLocalization_0({
                    ButtonLabelText = v9[l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.ButtonSelect)] or "CoreScripts.InGameMenu.Label.ViewButton"
                }).ButtonLabelText, 
                LayoutOrder = 100, 
                BackgroundTransparency = 1, 
                Font = l_Typography_0.label.Font, 
                TextSize = l_Typography_0.label.FontSize, 
                TextColor3 = l_Color_1.textColor.Color3, 
                Size = UDim2.fromOffset(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        }), 
        ControllerImage = v2.createElement("ImageLabel", {
            Image = "rbxasset://textures/ui/Gamepad/ControllerSelect@2x.png", 
            Size = UDim2.fromScale(1, 1), 
            LayoutOrder = 100, 
            BackgroundTransparency = 1
        }, {
            UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
                AspectRatio = l_Size_1.imageWidth / l_Size_1.imageHeight
            }), 
            UISizeConstraint = v2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(l_Size_1.imageWidth, l_Size_1.imageHeight), 
                MinSize = Vector2.new(l_Size_1.imageWidth * 0.5, l_Size_1.imageHeight * 0.5)
            })
        })
    });
end;
v11 = function()
    local l_MenuNavigationPrompt_2 = l_useDesignTokens_0().LuaApps.MenuNavigationPrompt;
    local l_Typography_1 = l_MenuNavigationPrompt_2.Typography;
    local l_Color_2 = l_MenuNavigationPrompt_2.Color;
    local l_Space_2 = l_MenuNavigationPrompt_2.Space;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = 0, 
        BackgroundTransparency = 1
    }, {
        Header = v2.createElement("TextLabel", {
            LayoutOrder = 0, 
            Text = l_useLocalization_0({
                HeaderText = "CoreScripts.InGameMenu.PageTitle.ToggleMenuNavigation"
            }).HeaderText, 
            BackgroundTransparency = 1, 
            Font = l_Typography_1.header.Font, 
            TextSize = l_Typography_1.header.FontSize, 
            TextColor3 = l_Color_2.textColor.Color3, 
            Size = UDim2.fromOffset(0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Space_2.titlePadding), 
            PaddingBottom = UDim.new(0, l_Space_2.titlePadding), 
            PaddingLeft = UDim.new(0, l_Space_2.bodyPadding), 
            PaddingRight = UDim.new(0, l_Space_2.bodyPadding)
        })
    });
end;
v12 = function()
    local l_MenuNavigationPrompt_3 = l_useDesignTokens_0().LuaApps.MenuNavigationPrompt;
    local l_Typography_2 = l_MenuNavigationPrompt_3.Typography;
    local l_Color_3 = l_MenuNavigationPrompt_3.Color;
    local l_Size_2 = l_MenuNavigationPrompt_3.Size;
    local l_Space_3 = l_MenuNavigationPrompt_3.Space;
    local v33 = l_useLocalization_0({
        CaptionText = "CoreScripts.InGameMenu.EducationalPopup.MenuNavigationToggleText", 
        OkText = "CoreScripts.InGameMenu.Ok"
    });
    return v2.createElement("Frame", {
        LayoutOrder = 200, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_Space_3.bodyPadding)
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_Space_3.bodyPadding), 
            PaddingRight = UDim.new(0, l_Space_3.bodyPadding), 
            PaddingTop = UDim.new(0, l_Space_3.bodyPadding), 
            PaddingBottom = UDim.new(0, l_Space_3.bodyPadding)
        }), 
        ControllerArea = v2.createElement(v10), 
        ImageDescription = v2.createElement("TextLabel", {
            Text = v33.CaptionText, 
            LayoutOrder = 100, 
            BackgroundTransparency = 1, 
            Font = l_Typography_2.caption.Font, 
            TextSize = l_Typography_2.caption.FontSize, 
            TextColor3 = l_Color_3.textColor.Color3, 
            TextWrapped = true, 
            LineHeight = l_Typography_2.caption.LineHeight, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        ConfirmationButton = v2.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.PrimarySystem, 
            layoutOrder = 200, 
            size = UDim2.new(1, 0, 0, l_Size_2.buttonHeight), 
            text = v33.OkText, 
            onActivated = function()
            end
        })
    });
end;
return v18;

local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script:FindFirstAncestor("InputUi").Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local _ = require(script.Parent.GamepadDisconnectTokenMapper);
local l_game_EngineFeature_0 = game:GetEngineFeature("GamepadMessageKeyEngineFeature");
return function(v11)
    local v12 = l_useDesignTokens_0();
    local l_Color3_0 = v12.Semantic.Color.Text.Emphasis.Color3;
    local l_Transparency_0 = v12.Semantic.Color.Text.Emphasis.Transparency;
    local l_GamepadDisconnect_0 = v12.LuaApps.GamepadDisconnect;
    local l_designWidth_0 = l_GamepadDisconnect_0.designWidth;
    local l_imageWidth_0 = l_GamepadDisconnect_0.imageWidth;
    local l_imageHeight_0 = l_GamepadDisconnect_0.imageHeight;
    local l_textContainerWidth_0 = l_GamepadDisconnect_0.textContainerWidth;
    local l_horizontalInnerPadding_0 = l_GamepadDisconnect_0.horizontalInnerPadding;
    local l_verticalPadding_0 = l_GamepadDisconnect_0.verticalPadding;
    local v22 = "";
    if not l_game_EngineFeature_0 then
        v22 = "Feature.GamepadDisconnect.Label.Message";
    else
        v22 = l_MemStorageService_0:GetItem("GamepadDisconnectMessageKey");
        if v22 == "" then
            v22 = "Feature.GamepadDisconnect.Label.MessageGeneric";
        end;
    end;
    local v23 = l_useLocalization_0({
        title = "Feature.GamepadDisconnect.Label.Title", 
        message = v22
    });
    return v3.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Active = true
    }, {
        Modal = v3.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(1, 0, 1, -l_verticalPadding_0 * 2), 
            BackgroundTransparency = v12.Semantic.Color.BackgroundUi.Contrast.Transparency, 
            BackgroundColor3 = v12.Semantic.Color.BackgroundUi.Contrast.Color3, 
            BorderSizePixel = 0
        }, {
            Content = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.new(1, 0, 0, l_imageHeight_0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(l_horizontalInnerPadding_0 / l_designWidth_0, 0)
                }), 
                ControllerImage = v3.createElement("ImageLabel", {
                    Image = "rbxasset://textures/ui/Gamepad/Controller.png", 
                    Size = UDim2.new(l_imageWidth_0 / l_designWidth_0, 0, 0, l_imageHeight_0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    UIAspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = l_imageWidth_0 / l_imageHeight_0
                    }), 
                    UISizeConstraint = v3.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(l_imageWidth_0, l_imageHeight_0), 
                        MinSize = Vector2.new(l_imageWidth_0 * 0.5, l_imageHeight_0 * 0.5)
                    })
                }), 
                TextContainer = v3.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(l_textContainerWidth_0 / l_designWidth_0, 0, 0, l_imageHeight_0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    UIListLayout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, v12.Global.Space_400)
                    }), 
                    TitleRow = v3.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.fromScale(1, 0), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        UIListLayout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            Padding = UDim.new(24 / l_textContainerWidth_0, 0)
                        }), 
                        Icon = v3.createElement(l_ImageSetLabel_0, {
                            Image = l_Images_0["icons/menu/about_large"], 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 1, 
                            Size = UDim2.fromOffset(v12.Global.Size_600, v12.Global.Size_600)
                        }), 
                        Title = v3.createElement("TextLabel", {
                            Text = v23.title, 
                            BackgroundTransparency = 1, 
                            TextColor3 = l_Color3_0, 
                            TextTransparency = l_Transparency_0, 
                            TextSize = v12.Semantic.Typography.Title.FontSize, 
                            Font = v12.Semantic.Typography.Title.Font, 
                            LayoutOrder = 2, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        })
                    }), 
                    Message = v3.createElement("TextLabel", {
                        Text = string.format(v23.message, v11.username, l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.A)), 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Size = UDim2.fromOffset(0, 0), 
                        BackgroundTransparency = 1, 
                        TextColor3 = l_Color3_0, 
                        TextTransparency = l_Transparency_0, 
                        TextSize = v12.Semantic.Typography.Subheader.FontSize, 
                        Font = v12.Semantic.Typography.Subheader.Font, 
                        LayoutOrder = 2, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                })
            })
        })
    });
end;

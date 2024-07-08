local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Components.FullscreenPageWithSafeArea);
local v3 = require(l_Modules_0.LuaApp.Components.Authentication.LandingPageVideo);
local v4 = require(l_CorePackages_0.Packages.React);
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
return function(v9)
    local v10 = {
        Position = UDim2.new(0.5, 0, 1, 0), 
        AnchorPoint = Vector2.new(0.5, 1), 
        LogoPositionYScale = 0.08, 
        BodyPositionYScale = 0.3
    };
    local v11 = l_getSafeAreaSize_0(v9.screenSize, v9.globalGuiInset).Y.Offset - v9.statusBarHeight;
    local v12 = v11 * 0.3;
    local v13 = v11 * v10.LogoPositionYScale;
    local v14 = l_useLocalization_0({
        sloganText = "Feature.Landing.Heading.LandingSlogan"
    });
    local v15 = l_useDesignTokens_0();
    return v4.createElement(v2, {
        includeStatusBar = true, 
        renderFullscreenBackground = function(_)
            return v4.createElement(v3, {
                screenSize = v9.screenSize
            });
        end
    }, {
        Contents = v4.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            ZIndex = 2
        }, {
            {
                Logo = v4.createElement("ImageLabel", {
                    Position = UDim2.new(0.5, 0, 0, v13), 
                    BackgroundTransparency = 1, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Size = UDim2.new(0.7, 0, 0.7, 0), 
                    Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/logo_white_1x.png", 
                    ZIndex = 1
                }, {
                    UISizeConstraint = v4.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(150, 25.951557093425606)
                    }), 
                    UIAspectRatioConstraint = v4.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 5.78, 
                        AspectType = Enum.AspectType.FitWithinMaxSize
                    })
                }), 
                ContentContainer = v4.createElement("Frame", {
                    Position = UDim2.new(0.5, 0, 0, v12), 
                    Size = UDim2.new(1, 0, 1, -v12), 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    BackgroundTransparency = 1, 
                    ZIndex = 2
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        Padding = UDim.new(0, 16), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Bottom
                    }), 
                    Text = v4.createElement("TextLabel", {
                        Size = UDim2.new(1, -40, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Text = v14.sloganText, 
                        TextColor3 = v15.Semantic.Color.Text.Emphasis.Color3, 
                        TextSize = v15.Semantic.Typography.Title.FontSize, 
                        Font = v15.Semantic.Typography.Title.Font, 
                        TextXAlignment = if v9.formFactor == l_FormFactor_0.COMPACT then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Bottom, 
                        TextWrapped = true, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        UISizeConstraint = if v9.formFactor == l_FormFactor_0.COMPACT then v4.createElement("UISizeConstraint", {
                            MaxSize = Vector2.new(360, math.huge)
                        }) else nil
                    }), 
                    Content = v4.createElement("Frame", {
                        Position = v10.Position, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        AnchorPoint = v10.AnchorPoint, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2
                    }, {
                        v9.children
                    })
                })
            }
        })
    });
end;

local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.RoactRodux);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_CorePackages_0.UIBlox);
local v5 = require(l_CorePackages_0.Workspace.Packages.Style);
local v6 = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTargetThumbnail);
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTypes);
local l_useDesignTokens_0 = v5.useDesignTokens;
local l_mapTypographyVariantToFontEnum_0 = v5.mapTypographyVariantToFontEnum;
return function(v10)
    local v11 = l_useDesignTokens_0();
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v11.Global.Size_1400), 
        BackgroundTransparency = v11.Global.Opacity_0, 
        LayoutOrder = 2
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v11.Global.Space_300), 
            PaddingBottom = UDim.new(0, v11.Global.Space_700)
        }), 
        TargetInner = v1.createElement("Frame", {
            Size = UDim2.new(0, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.X, 
            BackgroundTransparency = v11.Global.Opacity_0, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Thumbnail = v1.createElement(v6, {
                thumbnailUrl = v10.thumbnailUrl
            }), 
            Texts = v1.createElement("Frame", {
                Size = UDim2.new(0, 0, 1, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = v11.Global.Opacity_0
            }, {
                Layout = v1.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v11.Global.Space_150)
                }), 
                PrimaryText = v1.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v10.primaryText, 
                    Font = l_mapTypographyVariantToFontEnum_0(v11.Semantic.Typography.Subheader), 
                    LayoutOrder = 1, 
                    TextColor3 = v11.Semantic.Color.Text.Emphasis.Color3, 
                    TextTransparency = v11.Semantic.Color.Text.Emphasis.Transparency, 
                    TextSize = v11.Semantic.Typography.Subheader.FontSize, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Size = UDim2.new(0, 0, 0, v11.Semantic.Typography.Subheader.FontSize), 
                    BackgroundTransparency = v11.Global.Opacity_0
                }), 
                SecondaryText = v1.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v10.secondaryText, 
                    Font = l_mapTypographyVariantToFontEnum_0(v11.Semantic.Typography.Body), 
                    LayoutOrder = 2, 
                    TextColor3 = v11.Semantic.Color.Text.Default.Color3, 
                    TextTransparency = v11.Semantic.Color.Text.Emphasis.Transparency, 
                    TextSize = v11.Semantic.Typography.Body.FontSize, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Size = UDim2.new(0, 0, 0, v11.Semantic.Typography.Subheader.FontSize), 
                    BackgroundTransparency = v11.Global.Opacity_0
                })
            })
        })
    });
end;

local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.Style);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.ReportTypes);
local _ = require(l_Modules_0.LuaApp.Components.AbuseReporting.Constants);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_mapTypographyVariantToFontEnum_0 = v3.mapTypographyVariantToFontEnum;
return function(v9)
    local v10 = l_useDesignTokens_0();
    return l_withLocalization_0({
        statusPrimaryText = v9.statusPrimaryText, 
        statusSecondaryText = v9.statusSecondaryText
    })(function(v11)
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = v10.Global.Opacity_0
        }, {
            FetchStatus = if not v9.submitError then if v9.BEDUIError then v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0.9, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = v10.Global.Opacity_0
            }, {
                Layout = v2.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                PrimaryText = v2.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v9.statusPrimaryText, 
                    Font = l_mapTypographyVariantToFontEnum_0(v10.Semantic.Typography.Title), 
                    LayoutOrder = 1, 
                    TextColor3 = v10.Semantic.Color.Text.Emphasis.Color3, 
                    TextTransparency = v10.Semantic.Color.Text.Emphasis.Transparency, 
                    TextSize = v10.Semantic.Typography.Title.FontSize, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    Size = UDim2.new(1, 0, 0, v10.Semantic.Typography.Title.FontSize), 
                    BackgroundTransparency = v10.Global.Opacity_0
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, v10.Global.Space_200)
                    })
                }), 
                SecondaryText = v2.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v9.statusSecondaryText, 
                    Font = l_mapTypographyVariantToFontEnum_0(v10.Semantic.Typography.Header), 
                    LayoutOrder = 2, 
                    TextColor3 = v10.Semantic.Color.Text.Default.Color3, 
                    TextTransparency = v10.Semantic.Color.Text.Emphasis.Transparency, 
                    TextSize = v10.Semantic.Typography.Header.FontSize, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    Size = UDim2.new(1, 0, 0, v10.Semantic.Typography.Header.FontSize), 
                    BackgroundTransparency = v10.Global.Opacity_0
                })
            }) else nil else v2.createElement("TextLabel", {
                Position = UDim2.new(0, 0, 1, -v10.Semantic.Typography.Subheader.FontSize - v10.Global.Size_150), 
                Text = v11.statusPrimaryText, 
                Font = l_mapTypographyVariantToFontEnum_0(v10.Semantic.Typography.Body), 
                TextColor3 = v9.color, 
                TextSize = v10.Semantic.Typography.Body.FontSize, 
                Size = UDim2.new(1, 0, 0, v10.Semantic.Typography.Subheader.FontSize), 
                BackgroundTransparency = v10.Global.Opacity_0, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        });
    end);
end;

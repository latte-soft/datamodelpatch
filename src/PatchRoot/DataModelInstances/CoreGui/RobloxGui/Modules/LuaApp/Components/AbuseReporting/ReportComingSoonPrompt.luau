local _ = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local l_VRConstants_0 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility).VRConstants;
local v5 = require(l_CorePackages_0.Workspace.Packages.Style);
local v6 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_FullPageModal_0 = v3.App.Dialog.Modal.FullPageModal;
local l_useDesignTokens_0 = v5.useDesignTokens;
local l_mapTypographyVariantToFontEnum_0 = v5.mapTypographyVariantToFontEnum;
return function(v10)
    local v11 = l_useDesignTokens_0();
    v6.assert(false, "Report Dialog's title and body text have not been localized. This needs to be addressed before this feature is released.");
    return v2.createElement(l_FullPageModal_0, {
        title = "Reporting Coming Soon", 
        onCloseClicked = v10.onClose, 
        screenSize = l_VRConstants_0.MainScreenResolution
    }, {
        Texts = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 15)
            }), 
            PrimaryText = v2.createElement("TextLabel", {
                Text = "Reporting is coming soon to this platform.", 
                Font = l_mapTypographyVariantToFontEnum_0(v11.Semantic.Typography.Subheader), 
                LayoutOrder = 1, 
                TextColor3 = v11.Semantic.Color.Text.Emphasis.Color3, 
                TextTransparency = v11.Semantic.Color.Text.Emphasis.Transparency, 
                TextSize = v11.Semantic.Typography.Subheader.FontSize, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                Size = UDim2.new(1, 0, 0, v11.Semantic.Typography.Subheader.FontSize), 
                BackgroundTransparency = 1
            })
        })
    });
end;

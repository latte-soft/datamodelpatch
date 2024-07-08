local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script:FindFirstAncestor("BulkPurchaseApp").Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_NumberLocalization_0 = require(l_Parent_0.Localization).NumberLocalization;
local v5 = require(l_Parent_0.UIBlox);
local l_StyledTextLabel_0 = v5.App.Text.StyledTextLabel;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v5.App.ImageSet.Images;
local function v10(v9)
    return v2.createElement(l_ImageSetLabel_0, {
        Size = v9.Size, 
        Image = l_Images_0["icons/common/robux_small"], 
        ImageColor3 = v9.color, 
        ImageTransparency = 0, 
        BackgroundTransparency = 1, 
        LayoutOrder = v9.LayoutOrder
    });
end;
return function(v11)
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, v2.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        FillDirection = Enum.FillDirection.Horizontal, 
        Padding = UDim.new(0, l_useDesignTokens_0().Global.Space_50)
    }), v2.createElement(v10, {
        Size = UDim2.fromOffset(v11.fontStyle.FontSize, v11.fontStyle.FontSize), 
        color = v11.colorStyle.Color3, 
        LayoutOrder = 1
    }), v2.createElement(l_StyledTextLabel_0, {
        fontStyle = v11.fontStyle, 
        colorStyle = v11.colorStyle, 
        text = l_NumberLocalization_0.localize(v11.amount, l_LocalizationService_0.RobloxLocaleId), 
        textXAlignment = Enum.TextXAlignment.Right, 
        layoutOrder = 2
    }));
end;

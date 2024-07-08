local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_Parent_0.UIBlox);
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v8 = require(script.Parent.Box);
local v9 = require(script.Parent.PriceBoxLine);
local v10 = require(l_script_FirstAncestor_0.Enums.PriceBoxLineVariantEnum);
local v11 = {
    heading = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.TotalCost", 
    currentBalanceLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.CurrentBalance", 
    projectedBalanceLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.NewBalance", 
    missingRobuxLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.MissingRobux", 
    confirmCTA = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.ConfirmCTA", 
    buyRobuxCTA = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.BuyRobuxCTA"
};
local function v13(v12)
    return {
        background = v12.Semantic.Color.Background.Contrast.Color3, 
        padding = v12.Global.Space_300, 
        cornerRadius = v12.Semantic.Radius.Medium, 
        buttonMarginTop = v12.Global.Space_300, 
        headerMarginBottom = v12.Global.Space_200, 
        lineItemSpacing = v12.Global.Space_50, 
        buttonHeight = v12.Global.Size_450
    };
end;
return function(v14)
    local v15 = l_useDesignTokens_0(v13);
    local v16 = l_useLocalization_0(v11);
    return v2.createElement(v8, {
        padding = v15.padding, 
        cornerRadius = UDim.new(0, v15.cornerRadius), 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = v15.background, 
        BorderSizePixel = 0
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            Padding = UDim.new(0, v15.buttonMarginTop)
        }), 
        LineItems = v2.createElement("Frame", {
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                Padding = UDim.new(0, v15.headerMarginBottom)
            }), 
            PriceBoxHeader = v2.createElement(v9, {
                text = v16.heading, 
                amount = v14.totalCost, 
                highlight = true, 
                LayoutOrder = 1
            }), 
            Something = v2.createElement("Frame", {
                BorderSizePixel = 0, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                Layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, v15.lineItemSpacing)
                }), 
                PriceBoxCurrentBalance = v2.createElement(v9, {
                    text = v16.currentBalanceLine, 
                    amount = v14.currentBalance, 
                    LayoutOrder = 1
                }), 
                PriceBoxProjectedBalance = v2.createElement(v9, {
                    text = if not v14.missingRobux then v16.projectedBalanceLine else v16.missingRobuxLine, 
                    amount = math.abs(v14.totalCost - v14.currentBalance), 
                    variant = if not v14.missingRobux then nil else v10.Danger, 
                    LayoutOrder = 2
                })
            })
        }), 
        PriceBoxConfirmButton = v2.createElement(l_Button_0, {
            text = if not v14.missingRobux then v16.confirmCTA else v16.buyRobuxCTA, 
            onActivated = v14.onAccept, 
            buttonType = l_ButtonType_0.PrimarySystem, 
            size = UDim2.new(1, 0, 0, v15.buttonHeight), 
            buttonRef = v14.buttonRef
        })
    });
end;

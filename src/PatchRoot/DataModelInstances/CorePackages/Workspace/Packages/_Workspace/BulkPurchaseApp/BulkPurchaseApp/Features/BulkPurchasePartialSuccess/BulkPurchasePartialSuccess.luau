local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v5 = require(l_Parent_0.UIBlox);
local l_StyledTextLabel_0 = v5.App.Text.StyledTextLabel;
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v9 = require(l_script_FirstAncestor_0.Components.FullPagePrompt);
local v10 = require(l_script_FirstAncestor_0.Components.ItemList);
local v11 = require(l_script_FirstAncestor_0.Components.FullPagePromptTwoPanelLayout);
local v12 = require(l_script_FirstAncestor_0.Components.Divider);
local v13 = require(l_script_FirstAncestor_0.Components.ItemListHeader);
local v14 = require(l_script_FirstAncestor_0.Components.FullPagePromptScrollList);
local v15 = require(l_script_FirstAncestor_0.Components.Box);
local v16 = require(l_script_FirstAncestor_0.Components.PriceBoxLine);
local v17 = require(l_script_FirstAncestor_0.Components.ItemStatus);
local v18 = {
    heading = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.Heading", 
    unsuccessfulHeading = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorHeading", 
    notice = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.Notice", 
    itemListSuccessfulCount = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemListSuccessfulCount", 
    itemListUnsuccessfulCount = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemListUnsuccessfulCount", 
    itemListSuccessfulHeading = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemListSuccessfulHeading", 
    itemListUnsuccessfulHeading = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.ItemListUnsuccessfulHeading", 
    robuxSpent = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.PriceBox.RobuxSpent", 
    currentBalance = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.PriceBox.CurrentBalance", 
    dismissCTA = "CoreScripts.BulkPurchasePrompt.PartialPurchaseCompletedPrompt.PriceBox.DismissCTA"
};
local function v20(v19)
    return {
        boxBackground = v19.Semantic.Color.Background.Contrast.Color3, 
        boxPadding = v19.Global.Space_300, 
        boxCornerRadius = v19.Semantic.Radius.Medium, 
        buttonMarginTop = v19.Global.Space_200, 
        buttonHeight = v19.Global.Size_450, 
        lineItemSpacing = v19.Global.Space_50, 
        noticeFontStyle = v19.Semantic.Typography.Body, 
        noticeColorStyle = v19.Semantic.Color.Text.Muted, 
        noticeMarginBottom = v19.Global.Space_300
    };
end;
local function v25(v21)
    local v22 = {};
    for _, v24 in v21, nil, nil do
        table.insert(v22, {
            id = v24.id, 
            image = v24.image, 
            name = v24.name, 
            endSlot = v2.createElement(v17, {
                status = v24.status
            })
        });
    end;
    return v22;
end;
return function(v26)
    local v27 = l_useDesignTokens_0(v20);
    local v28 = l_useLocalization_0(v18);
    local v29, v30 = v2.useBinding(Vector2.new(0, 0));
    local v31 = #v26.successfulItems > 0;
    return v2.createElement(v9, {
        onClose = v26.onDismiss, 
        title = if not v31 then v28.unsuccessfulHeading else v28.heading
    }, v2.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = UDim.new(0, v27.noticeMarginBottom)
    }), v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        [v2.Change.AbsoluteSize] = function(v32)
            v30(v32.AbsoluteSize);
        end
    }, v2.createElement(l_StyledTextLabel_0, {
        fontStyle = v27.noticeFontStyle, 
        colorStyle = v27.noticeColorStyle, 
        text = v28.notice, 
        layoutOrder = 1, 
        automaticSize = Enum.AutomaticSize.XY
    })), v2.createElement(v11, {
        LayoutOrder = 2, 
        size = v29:map(function(v33)
            return UDim2.new(1, 0, 1, -(v33.Y + v27.noticeMarginBottom));
        end), 
        startSlot = v2.createElement(v14, {
            LayoutOrder = 1, 
            size = v2.createBinding(UDim2.fromScale(1, 1))
        }, v2.createElement(v13, {
            heading = v28.itemListUnsuccessfulHeading, 
            itemCount = v28.itemListUnsuccessfulCount:gsub("{.*}", (tostring(#v26.unsuccessfulItems))), 
            LayoutOrder = 1
        }), v2.createElement(v10, {
            items = v25(v26.unsuccessfulItems), 
            LayoutOrder = 2
        }), if not v31 then nil else v2.createElement(v12, {
            LayoutOrder = 3
        }), if not v31 then nil else v2.createElement(v13, {
            heading = v28.itemListSuccessfulHeading, 
            itemCount = v28.itemListSuccessfulCount:gsub("{.*}", (tostring(#v26.successfulItems))), 
            LayoutOrder = 4
        }), if not v31 then nil else v2.createElement(v10, {
            items = v25(v26.successfulItems), 
            LayoutOrder = 5
        })), 
        endSlot = v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, v27.buttonMarginTop)
        }), v2.createElement(v15, {
            padding = v27.boxPadding, 
            cornerRadius = UDim.new(0, v27.boxCornerRadius), 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundColor3 = v27.boxBackground, 
            BorderSizePixel = 0
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, v27.lineItemSpacing)
            }), 
            RobuxSpent = v2.createElement(v16, {
                text = v28.robuxSpent, 
                amount = v26.robuxSpent, 
                highlight = true, 
                LayoutOrder = 1
            }), 
            CurrentBalance = v2.createElement(v16, {
                text = v28.currentBalance, 
                amount = v26.currentBalance, 
                LayoutOrder = 2
            })
        }), v2.createElement(l_Button_0, {
            text = v28.dismissCTA, 
            onActivated = v26.onDismiss, 
            buttonType = l_ButtonType_0.PrimarySystem, 
            size = UDim2.new(1, 0, 0, v27.buttonHeight)
        }))
    }));
end;

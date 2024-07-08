local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_StyledTextLabel_0 = require(l_Parent_0.UIBlox).App.Text.StyledTextLabel;
local v6 = require(l_Parent_0.ReactFocusNavigation);
local v7 = require(l_script_FirstAncestor_0.Components.FullPagePrompt);
local v8 = require(l_script_FirstAncestor_0.Components.ItemList);
local v9 = require(l_script_FirstAncestor_0.Components.PriceBox);
local v10 = require(l_script_FirstAncestor_0.Components.Price);
local v11 = require(l_script_FirstAncestor_0.Components.LineItemLayout);
local v12 = require(l_script_FirstAncestor_0.Components.FullPagePromptTwoPanelLayout);
local v13 = require(l_script_FirstAncestor_0.Components.Divider);
local v14 = require(l_script_FirstAncestor_0.Components.FullPagePromptScrollList);
local v15 = require(l_script_FirstAncestor_0.Components.ItemStatus);
local v16 = {
    heading = "CoreScripts.BulkPurchasePrompt.RequestPrompt.Heading", 
    listHeading = "CoreScripts.BulkPurchasePrompt.RequestPrompt.ItemListPurchaseHeading", 
    itemCount = "CoreScripts.BulkPurchasePrompt.RequestPrompt.ItemListPurchaseCount", 
    itemOwned = "CoreScripts.BulkPurchasePrompt.RequestPrompt.ItemOwned"
};
local function v23(v17, v18, v19)
    local v20 = {};
    for _, v22 in v17, nil, nil do
        table.insert(v20, {
            id = v22.id, 
            name = v22.name, 
            image = v22.image, 
            endSlot = v2.createElement(v10, {
                amount = v22.cost, 
                fontStyle = v18, 
                colorStyle = v19
            })
        });
    end;
    return v20;
end;
local function v31(v24, v25, v26, v27)
    local v28 = {};
    for _, v30 in v24, nil, nil do
        table.insert(v28, {
            id = v30.id, 
            name = v30.name, 
            image = v30.image, 
            endSlot = v2.createElement(l_StyledTextLabel_0, {
                fontStyle = v25, 
                colorStyle = v26, 
                textXAlignment = Enum.TextXAlignment.Right, 
                textYAlignment = Enum.TextYAlignment.Top, 
                lineHeight = v25.LineHeight, 
                size = UDim2.fromScale(1, 1), 
                text = v27.itemOwned:gsub("{.*}", (tostring(v30.ownedCount)))
            })
        });
    end;
    return v28;
end;
local function v36(v32)
    local v33 = {};
    for _, v35 in v32, nil, nil do
        table.insert(v33, {
            id = v35.id, 
            name = v35.name, 
            image = v35.image, 
            endSlot = v2.createElement(v15, {
                status = v35.status
            })
        });
    end;
    return v33;
end;
return function(v37)
    local v38 = l_useLocalization_0(v16);
    local v39, v40 = v6.useDefaultFocusBehavior();
    local v41 = l_useDesignTokens_0();
    local l_Body_0 = v41.Semantic.Typography.Body;
    local v43 = {
        LineHeight = v41.Semantic.Typography.Body.LineHeight, 
        Font = v41.Semantic.Typography.Subheader.Font, 
        FontSize = v41.Semantic.Typography.Body.FontSize, 
        LetterSpacing = v41.Semantic.Typography.Body.LetterSpacing
    };
    local l_Emphasis_0 = v41.Semantic.Color.Text.Emphasis;
    local v45, v46 = v2.useBinding(Vector2.new(0, 0));
    local v47 = v23(v37.items, v43, l_Emphasis_0);
    local v48 = v31(v37.ownedItems, l_Body_0, l_Emphasis_0, v38);
    local v49 = v36(v37.unpurchasableItems);
    local v50 = {};
    table.move(v48, 1, #v48, #v50 + 1, v50);
    table.move(v49, 1, #v49, #v50 + 1, v50);
    local v51 = #v50 > 0;
    return v2.createElement(v7, {
        onClose = v37.onClose, 
        title = v38.heading, 
        ref = v40
    }, v2.createElement(v12, {
        size = v2.createBinding(UDim2.fromScale(1, 1)), 
        startSlot = v2.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, v41.Global.Space_300)
        }), v2.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1, 
            [v2.Change.AbsoluteSize] = function(v52)
                v46(v52.AbsoluteSize);
            end
        }, v2.createElement("UIPadding", {
            PaddingRight = UDim.new(0, v41.Global.Space_125)
        }), v2.createElement(v11, {
            startSlot = v2.createElement(l_StyledTextLabel_0, {
                fontStyle = v43, 
                colorStyle = l_Emphasis_0, 
                text = v38.listHeading
            }), 
            endSlot = v2.createElement(l_StyledTextLabel_0, {
                fontStyle = v43, 
                colorStyle = l_Emphasis_0, 
                text = v38.itemCount:gsub("{.*}", (tostring(#v37.items)))
            }), 
            LayoutOrder = 1
        })), v2.createElement(v14, {
            LayoutOrder = 2, 
            size = v45:map(function(v53)
                return UDim2.new(1, 0, 1, -(v53.Y + v41.Global.Space_300));
            end)
        }, v2.createElement(v8, {
            items = v47
        }), if not v51 then nil else v2.createElement(v13), if not v51 then nil else v2.createElement(v8, {
            items = v50
        }))), 
        endSlot = v2.createElement(v9, {
            currentBalance = v37.currentBalance, 
            totalCost = v37.totalCost, 
            missingRobux = v37.currentBalance - v37.totalCost < 0, 
            onAccept = v37.onAccept, 
            buttonRef = v39
        })
    }));
end;

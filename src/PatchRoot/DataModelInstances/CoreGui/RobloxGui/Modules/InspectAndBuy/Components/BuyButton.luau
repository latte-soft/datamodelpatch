local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_GuiService_0 = game:GetService("GuiService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Colors);
local v9 = require(l_Parent_0.Thunks.PromptPurchase);
local v10 = require(l_Parent_0.getSelectionImageObjectRounded);
local v11 = require(l_Parent_0.Flags.FFlagEnableFavoriteButtonForUgc);
local v12 = require(l_Parent_0.Flags.GetFFlagIBEnableLimitedItemBugFixAndAlignment);
local v13 = require(l_Parent_0.Flags.GetFFlagIBFixl20HasQuantityPurchase);
local v14 = require(l_Parent_0.UtilityFunctions);
local v15 = v4.PureComponent:extend("BuyButton");
v15.init = function(v16)
    v16.selectedImage = v10();
    v16.connections = {};
    v16.lastGamepadFocus = nil;
    v16.onPromptPurchaseFinished = function()
        if not (not v16.props.gamepadEnabled or not v16.props.visible) then
            l_GuiService_0.SelectedCoreObject = v16.lastGamepadFocus;
        end;
    end;
end;
v15.render = function(v17)
    local l_itemType_0 = v17.props.itemType;
    local l_itemId_0 = v17.props.itemId;
    local l_showRobuxIcon_0 = v17.props.showRobuxIcon;
    local l_forSale_0 = v17.props.forSale;
    local l_promptPurchase_0 = v17.props.promptPurchase;
    local l_buyText_0 = v17.props.buyText;
    local l_buyButtonRef_0 = v17.props.buyButtonRef;
    local l_collectibleItemId_0 = v17.props.collectibleItemId;
    local l_collectibleLowestAvailableResaleProductId_0 = v17.props.collectibleLowestAvailableResaleProductId;
    local l_collectibleLowestAvailableResaleItemInstanceId_0 = v17.props.collectibleLowestAvailableResaleItemInstanceId;
    local l_collectibleLowestResalePrice_0 = v17.props.collectibleLowestResalePrice;
    local v29 = nil;
    if v13() then
        v29 = v14.isLimited2Point0_Or_LimitedCollectible(v17.props.assetInfo);
    end;
    local v30 = UDim2.new(0, v17:getBuyButtonTextSize(l_buyText_0), 1, 0);
    local l_assetInfo_0 = v17.props.assetInfo;
    local v32 = if not v11 then (not not l_assetInfo_0 and l_assetInfo_0.creatorId or 0) == "1" and -32 or -5 else -32;
    local v33 = 0;
    if not l_forSale_0 then
        v33 = 0.5;
    end;
    return v4.createElement("ImageButton", {
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.5, v32, 0, 44), 
        Image = "rbxasset://textures/ui/InspectMenu/Button_white.png", 
        ImageColor3 = v8.Green, 
        SelectionImageObject = v17.selectedImage, 
        LayoutOrder = 3, 
        ImageTransparency = v33, 
        [v4.Ref] = l_buyButtonRef_0, 
        [v4.Event.Activated] = function()
            if l_forSale_0 then
                if not (not v17.props.gamepadEnabled or not v17.props.visible) then
                    v17.lastGamepadFocus = l_GuiService_0.SelectedCoreObject;
                    l_GuiService_0.SelectedCoreObject = nil;
                end;
                l_promptPurchase_0(l_itemId_0, l_itemType_0, l_collectibleItemId_0, l_collectibleLowestAvailableResaleProductId_0, l_collectibleLowestAvailableResaleItemInstanceId_0, l_collectibleLowestResalePrice_0, if not v13() then nil else v29);
            end;
        end
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        RobuxIcon = v4.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 16, 0, 16), 
            Image = "rbxasset://textures/ui/common/robux_small.png", 
            ImageTransparency = v33, 
            ImageColor3 = v8.White, 
            LayoutOrder = 1, 
            Visible = l_showRobuxIcon_0
        }), 
        BuyText = v4.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Size = v30, 
            Text = if not v12() then l_buyText_0 else tostring(l_buyText_0), 
            Font = l_AppFonts_0.default:getDefault(), 
            TextSize = 16, 
            TextColor3 = v8.White, 
            TextTransparency = v33, 
            LayoutOrder = 2, 
            TextXAlignment = Enum.TextXAlignment.Center
        })
    });
end;
v15.didMount = function(v34)
    local v35 = l_MarketplaceService_0.PromptPurchaseFinished:Connect(v34.onPromptPurchaseFinished);
    local v36 = l_MarketplaceService_0.PromptBundlePurchaseFinished:Connect(v34.onPromptPurchaseFinished);
    table.insert(v34.connections, v35);
    table.insert(v34.connections, v36);
end;
v15.willUnmount = function(v37)
    for _, v39 in pairs(v37.connections) do
        v39:Disconnect();
    end;
end;
v15.getBuyButtonTextSize = function(v40, v41)
    if not v40.props.buyButtonRef.current then
        return 0;
    else
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(if not v12() then v41 else tostring(v41), 16, l_AppFonts_0.default:getDefault(), Vector2.new(v40.props.buyButtonRef.current.AbsoluteSize.X, 5000));
        v40.props.buyButtonRef.Size = UDim2.new(0, 1, 0, l_l_TextService_0_TextSize_0.Y);
        return l_l_TextService_0_TextSize_0.X > 32 and l_l_TextService_0_TextSize_0.X or 32;
    end;
end;
return v5.UNSTABLE_connect2(function(v43, _)
    return {
        locale = v43.locale, 
        view = v43.view, 
        assetInfo = v43.assets[v43.detailsInformation.assetId], 
        gamepadEnabled = v43.gamepadEnabled, 
        visible = v43.visible
    };
end, function(v45)
    return {
        promptPurchase = function(v46, v47, v48, v49, v50, v51, v52)
            v45(v9(v46, v47, v48, v49, v50, v51, if not v13() then nil else v52));
        end
    };
end)(v15);

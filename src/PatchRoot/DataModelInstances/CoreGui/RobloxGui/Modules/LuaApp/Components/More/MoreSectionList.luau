local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_AnimatedFlatList_0 = require(l_CorePackages_0.Packages.VirtualizedList).AnimatedFlatList;
local v7 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreSection);
local v8 = require(l_Modules_0.LuaApp.Components.More.MoreItemsMap);
local function v17(v9)
    local l_items_0 = v9.items;
    local v11 = l_useLocalization_0({
        title = v9.titleKey
    });
    local v12 = {};
    if l_items_0 ~= nil then
        v12 = v2.reduce(l_items_0, function(v13, v14, v15)
            local v16 = v8.getItemComponent(v14.itemType);
            if v16 then
                table.insert(v13, v3.createElement(v16, {
                    layoutOrder = v15, 
                    itemData = v14
                }));
            end;
            return v13;
        end, {});
    end;
    return v3.createElement(v7, {
        layoutOrder = v9.layoutOrder, 
        withDivider = v9.withDivider, 
        title = v11.title
    }, v12);
end;
local function v19(v18)
    return v18.item;
end;
return v3.memo(function(v20)
    local l_itemList_0 = v20.itemList;
    local v22 = v20.topbarHeight or 0;
    local v23 = l_useDesignTokens_0();
    local l_PageTopMargin_0 = v23.LuaApps.More.PageTopMargin;
    local l_BackgroundGradientOffset_0 = v23.LuaApps.More.BackgroundGradientOffset;
    local l_SafeAreaMargin_0 = v23.LuaApps.More.SafeAreaMargin;
    local v27 = {};
    if l_itemList_0 ~= nil then
        v27 = v2.reduce(l_itemList_0, function(v28, v29)
            return v2.append(v28, v29);
        end, {});
    end;
    local v33 = v2.map(v27, function(v30, v31)
        local l_itemInfo_0 = v30.itemInfo;
        return v3.createElement(v8.getSectionComponent(l_itemInfo_0.itemType) or v17, {
            layoutOrder = v31, 
            withDivider = v31 < #v27, 
            titleKey = l_itemInfo_0.textKey, 
            items = v30.subItems
        });
    end);
    return v3.createElement("Frame", {
        Position = UDim2.new(0, l_SafeAreaMargin_0.X, 0, l_PageTopMargin_0 + v22), 
        Size = UDim2.new(1, -2 * l_SafeAreaMargin_0.X, 1, (-l_SafeAreaMargin_0.Y - l_PageTopMargin_0) - v22), 
        BackgroundTransparency = 1
    }, {
        BackgroundFrame = v3.createElement("Frame", {
            Position = UDim2.new(0, -l_SafeAreaMargin_0.X, 0, -l_BackgroundGradientOffset_0), 
            Size = UDim2.new(1, l_SafeAreaMargin_0.X + l_SafeAreaMargin_0.X, 1, l_BackgroundGradientOffset_0 + l_SafeAreaMargin_0.Y), 
            ZIndex = -1
        }, {
            UIGradient = v3.createElement("UIGradient", {
                Color = ColorSequence.new(Color3.new(0, 0, 0)), 
                Transparency = NumberSequence.new(1, 0.4), 
                Rotation = 90
            })
        }), 
        ContentList = v3.createElement(l_AnimatedFlatList_0, {
            animated = true, 
            animationConfig = v23.LuaApps.App.Page.ScrollAnimationConfig, 
            initialNumToRender = #v33, 
            data = v33, 
            renderItem = v19, 
            contentContainerStyle = {
                BackgroundTransparency = 1
            }, 
            style = {
                Selectable = false, 
                ClipsDescendants = false, 
                BackgroundTransparency = 1, 
                ScrollBarThickness = 0, 
                VerticalScrollBarInset = Enum.ScrollBarInset.None, 
                ScrollingEnabled = false
            }, 
            ItemSeparatorComponent = v3.useCallback(function()
                return v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v23.Global.Space_300), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 10000000
                });
            end, {
                v23.Global.Space_300
            }), 
            ListHeaderComponent = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v23.Global.Space_200), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }), 
            ListFooterComponent = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v23.Global.Space_400), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            })
        })
    });
end);

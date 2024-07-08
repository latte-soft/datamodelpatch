local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_CorePackages_0.UIBlox);
local l_GridMetrics_0 = v5.App.Grid.GridMetrics;
local l_DefaultMetricsGridView_0 = v5.App.Grid.DefaultMetricsGridView;
local v8 = require(l_Modules_0.LuaApp.Components.Subscriptions.SubscriptionTile);
local function v18(v9, v10, v11, v12)
    local v13 = {};
    if v9 then
        for _, v15 in v9, nil, nil do
            local v16 = "";
            local v17 = false;
            if not (not v10 or not v10[tostring(v15.iconImageAssetId)]) then
                v16 = v10[tostring(v15.iconImageAssetId)].url;
            end;
            if not (not v11 or not v11[v15.subscriptionTargetKey]) then
                v17 = v11[v15.subscriptionTargetKey].isSubscribed;
            end;
            table.insert(v13, {
                subscriptionProduct = v15, 
                thumbnailString = v16, 
                screenSize = v12, 
                isSubscribed = v17
            });
        end;
    end;
    return v13;
end;
return function(v19)
    local v21 = l_useSelector_0((v2.useCallback(function(v20)
        return (v18(v19.subscriptionProducts, v20.SubscriptionProductsThumbnails, v20.SubscriptionStatuses, v20.ScreenSize));
    end, {
        v19.subscriptionProducts
    })));
    local l_Space_300_0 = l_useDesignTokens_0().Global.Space_300;
    return v2.createElement(l_DefaultMetricsGridView_0, {
        renderItem = function(v23)
            return v2.createElement(v8, v23);
        end, 
        getItemHeight = function()
            return 224;
        end, 
        getItemMetrics = l_GridMetrics_0.getLargeMetrics, 
        itemPadding = Vector2.new(l_Space_300_0, l_Space_300_0), 
        items = v21, 
        LayoutOrder = v19.layoutOrder
    });
end;

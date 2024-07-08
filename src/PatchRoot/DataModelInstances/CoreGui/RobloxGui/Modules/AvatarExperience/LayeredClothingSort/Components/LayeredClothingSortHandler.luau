local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.tutils);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v7 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.ClearCurrentSort);
local v8 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.ClearRemovedItems);
local v9 = v2.PureComponent:extend("LayeredClothingSortHandler");
v9.validateProps = v4.strictInterface({
    avatarRoute = v4.table, 
    tryOnItems = v4.table, 
    currentSort = v4.optional(v4.table), 
    clearCurrentSort = v4.callback, 
    clearRemovedItems = v4.callback
});
v9.render = function(_)
    return nil;
end;
local function _(v11, v12)
    local v13 = 0;
    for v14 in v11, nil, nil do
        v13 = v13 + 1;
        if v12[v14] == nil then
            return false;
        end;
    end;
    return v13 == v5.fieldCount(v12);
end;
v9.didSwitchTryOn = function(v16, v17)
    local l_tryOnItems_0 = v17.tryOnItems;
    local l_tryOnItems_1 = v16.props.tryOnItems;
    local v20 = 0;
    local v21;
    for v22 in l_tryOnItems_0, nil, nil do
        v20 = v20 + 1;
        if l_tryOnItems_1[v22] == nil then
            v21 = false;
            goto label0 --[[  true, false  ]];
        end;
    end;
    v21 = v20 == v5.fieldCount(l_tryOnItems_1);
    ::label0::;
    return not v21;
end;
v9.didUpdate = function(v23, v24)
    local l_name_0 = v23.props.avatarRoute.opaque.name;
    local l_name_1 = v24.avatarRoute.opaque.name;
    local v27 = v23:didSwitchTryOn(v24);
    if not (not (l_name_0 ~= v6.LayeredClothingSort) or not v27) and #v23.props.currentSort > 0 then
        v23.props.clearCurrentSort();
    end;
    if l_name_0 ~= l_name_1 and l_name_1 == v6.LayeredClothingSort then
        v23.props.clearRemovedItems();
    end;
end;
return (v3.connect(function(v28, _)
    return {
        tryOnItems = v28.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        currentSort = v28.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList
    };
end, function(v30)
    return {
        clearCurrentSort = function()
            v30(v7());
        end, 
        clearRemovedItems = function()
            v30(v8());
        end
    };
end)(v9));

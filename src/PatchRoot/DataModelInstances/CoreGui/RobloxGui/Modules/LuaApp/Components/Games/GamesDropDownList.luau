local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Common.RoactRodux);
local v3 = require(l_Modules_0.Common.memoize);
local v4 = require(l_Modules_0.LuaApp.Components.DropDownList);
local v5 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedTypes);
local v6 = v1.PureComponent:extend("GamesDropDownList");
v6.init = function(v7)
    v7.state = {};
    v7.dropDownSelectedCallback = function(v8, v9)
        if v7.props.onSelected then
            local l_items_0 = v7.props.items;
            local l_dropdownPositionToStoreIndex_0 = v7.props.dropdownPositionToStoreIndex;
            assert(l_dropdownPositionToStoreIndex_0);
            if v9 <= #l_items_0 then
                local v12 = l_dropdownPositionToStoreIndex_0[v9];
                if v12 then
                    return v7.props.onSelected(v8, v12, v9);
                end;
            end;
        end;
    end;
end;
v6.render = function(v13)
    return v1.createElement(v4, {
        position = v13.props.position, 
        size = v13.props.size, 
        items = v13.props.items, 
        itemSelected = v13.props.itemSelected, 
        onSelected = v13.dropDownSelectedCallback
    });
end;
local v29 = v3(function(v14, v15, v16, v17)
    local v18 = {};
    local v19 = {};
    local function _(v20, v21)
        table.insert(v18, v20);
        v19[#v18] = v21;
    end;
    for _, v24 in pairs(v17) do
        if not v24.isOmni then
            for v25, v26 in ipairs(v15[v24.sortType].sorts) do
                table.insert(v18, v14[v26]);
                v19[#v18] = v25;
            end;
        elseif v16[v24.sortType] then
            for v27, v28 in ipairs(v16[v24.sortType]) do
                if v28.treatmentType == v5.Carousel then
                    table.insert(v18, v28);
                    v19[#v18] = v27;
                end;
            end;
        end;
    end;
    return v18, v19;
end);
return v2.connect(function(v30, v31)
    local v32 = nil;
    if not v31.isOmni then
        v32 = v30.GameSorts[v31.selectedSortName];
    else
        local l_sortType_0 = v31.sortCategories.OMNI_HOME.sortType;
        if v30.OmniRecommendationsSorts[l_sortType_0] then
            v32 = v30.OmniRecommendationsSorts[l_sortType_0][v31.selectedSortIndex];
        end;
    end;
    local v34, v35 = v29(v30.GameSorts, v30.GameSortGroups, v30.OmniRecommendationsSorts, v31.sortCategories);
    return {
        items = v34 or {}, 
        itemSelected = v32 or {}, 
        dropdownPositionToStoreIndex = v35
    };
end)(v6);

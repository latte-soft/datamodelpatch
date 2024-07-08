local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedTypes);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_IconTabGroup_0 = require(l_CorePackages_0.UIBlox).App.Navigation.PrimaryNavBar.IconTabGroup;
local l_GetFFlagTenFootUiCategoryTabSafeArea_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiCategoryTabSafeArea;
return function(v9)
    local l_size_0 = v9.size;
    local l_onSelected_0 = v9.onSelected;
    local l_selectedSortIndex_0 = v9.selectedSortIndex;
    local l_selectedSortName_0 = v9.selectedSortName;
    local l_sortCategories_0 = v9.sortCategories;
    local v15 = l_useDesignTokens_0();
    local v17 = l_useSelector_0(function(v16)
        return v16.GameSorts;
    end);
    local v19 = l_useSelector_0(function(v18)
        return v18.GameSortGroups;
    end);
    local v21 = l_useSelector_0(function(v20)
        return v20.OmniRecommendationsSorts;
    end);
    local v32 = v2.useMemo(function()
        local v22 = {};
        local function _(v23, v24)
            table.insert(v22, {
                sort = v23, 
                storeIndex = v24
            });
        end;
        for _, v27 in l_sortCategories_0, nil, nil do
            if not v27.isOmni then
                for v28, v29 in v19[v27.sortType].sorts, nil, nil do
                    table.insert(v22, {
                        sort = v17[v29], 
                        storeIndex = v28
                    });
                end;
            elseif v21[v27.sortType] then
                for v30, v31 in v21[v27.sortType], nil, nil do
                    if v31.treatmentType == v4.Carousel then
                        table.insert(v22, {
                            sort = v31, 
                            storeIndex = v30
                        });
                    end;
                end;
            end;
        end;
        return v22;
    end, {
        v17, 
        v19, 
        v21, 
        l_sortCategories_0
    });
    local v36 = v2.useCallback(function(v33, v34)
        if l_onSelected_0 and v34 <= #v32 then
            local l_storeIndex_0 = v33.storeIndex;
            if l_storeIndex_0 then
                return l_onSelected_0(v33.sort, l_storeIndex_0, v34);
            end;
        end;
        return nil;
    end, {
        l_onSelected_0
    });
    return v2.createElement("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Selectable = false, 
        ClipsDescendants = true, 
        AutomaticCanvasSize = Enum.AutomaticSize.X, 
        CanvasSize = UDim2.new(0, 0, 1, 0), 
        CanvasPosition = Vector2.new(0, 0), 
        ScrollBarThickness = 0, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        BackgroundTransparency = 1
    }, {
        Padding = if l_GetFFlagTenFootUiCategoryTabSafeArea_0() then nil else v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v15.Global.Space_250), 
            PaddingRight = UDim.new(0, v15.Global.Space_250)
        }), 
        TabGroup = v2.createElement(l_IconTabGroup_0, {
            size = l_size_0, 
            fillDirection = Enum.FillDirection.Horizontal, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            sortOrder = Enum.SortOrder.LayoutOrder, 
            items = v2.useMemo(function()
                return v3.List.map(v32, function(v37, v38)
                    local v39 = {
                        title = v37.sort.displayName, 
                        onActivated = function()
                            v36(v37, v38);
                        end
                    };
                    local v40 = true;
                    if v37.sort.topicId ~= l_selectedSortName_0 then
                        v40 = v37.sort.name == l_selectedSortName_0;
                    end;
                    v39.showRoundedBackground = v40;
                    return v39;
                end);
            end, {
                v32, 
                l_selectedSortName_0
            }), 
            selection = {
                l_selectedSortIndex_0
            }, 
            padding = {
                left = 0, 
                right = 0, 
                top = 0, 
                bottom = 0
            }
        })
    });
end;

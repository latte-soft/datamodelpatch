local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local l_dependencyArray_0 = require(l_script_FirstAncestor_0.Parent.RoactUtils).Hooks.dependencyArray;
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v8 = require(script.Parent.EventsGridLayout);
local v9 = {
    initialItemsShown = 3, 
    extraItemsShownOnLoad = 5, 
    itemPadding = UDim.new(0, 12), 
    isDesktopGrid = false
};
return function(v10)
    local v11 = v1.Dictionary.join(v9, v10);
    local v12, v13 = v2.useState(0);
    local v14 = v2.useMemo(function()
        return v11.initialItemsShown + v11.extraItemsShownOnLoad * v12;
    end, l_dependencyArray_0(v11.initialItemsShown, v11.extraItemsShownOnLoad, v12));
    local v15 = l_useLocalization_0({
        seeMore = "Feature.VirtualEvents.SeeMore"
    });
    v2.useEffect(function()
        v13(0);
    end, l_dependencyArray_0(v11.initialItemsShown, v11.extraItemsShownOnLoad));
    return v2.createElement("Frame", {
        LayoutOrder = v11.layoutOrder, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        Layout = v2.createElement("UIListLayout", {
            Padding = v11.itemPadding, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        MobileListItems = not v11.isDesktopGrid and v2.createElement(v2.Fragment, nil, (v2.useMemo(function()
            local v16 = {};
            for v17 = 1, v14 do
                v16["Item" .. v17] = v2.createElement("Frame", {
                    LayoutOrder = v17, 
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    Content = v11.items[v17]
                });
            end;
            return v16;
        end, {
            v11.items, 
            v14
        }))), 
        DesktopGridItems = v11.isDesktopGrid and v2.createElement(v8, {
            items = v11.items, 
            numItemsShown = v14
        }), 
        SeeMore = if v14 < #v11.items then v2.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            layoutOrder = #v11.items + 1, 
            size = UDim2.fromScale(1, 0), 
            automaticSize = Enum.AutomaticSize.Y, 
            text = v15.seeMore, 
            onActivated = v2.useCallback(function()
                v13(function(v18)
                    return v18 + 1;
                end);
                if v11.onSeeMore then
                    v11.onSeeMore();
                end;
            end, l_dependencyArray_0(v11.onSeeMore))
        }) else nil
    });
end;

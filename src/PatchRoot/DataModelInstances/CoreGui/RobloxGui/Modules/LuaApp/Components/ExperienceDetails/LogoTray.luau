local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractableList_0 = v4.Core.Control.InteractableList;
local l_SelectionMode_0 = v4.Core.Control.Enum.SelectionMode;
local l_validateImage_0 = v4.Core.ImageSet.Validator.validateImage;
local l_IconSize_0 = v4.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v4.App.ImageSet.getIconSize;
local l_IconButton_0 = v4.App.Button.IconButton;
local l_Colors_0 = v4.App.Style.Colors;
local l_Large_0 = l_IconSize_0.Large;
local function v13()
end;
local v14 = v1.Component:extend("LogoTray");
v14.validateProps = v2.strictInterface({
    itemList = v2.array(v2.strictInterface({
        key = v2.string, 
        logo = l_validateImage_0
    })), 
    layoutOrder = v2.integer, 
    padding = v2.optional(v2.UDim), 
    handleItemClick = v2.optional(v2.callback)
});
v14.defaultProps = {
    padding = UDim.new(0, 12), 
    handleItemClick = v13
};
v14.init = function(v15)
    v15.getInteractableItemTable = function()
        local v16 = {};
        v3.List.map(v15.props.itemList, function(v17)
            assert(v16[v17.key] == nil, "Duplicate logo key is not allowed.");
            v16[v17.key] = v17;
        end);
        return v16;
    end;
    v15.getMeasuredItemSize = function()
        local v18 = l_getIconSize_0(l_Large_0);
        return UDim2.fromOffset(v18, v18);
    end;
    v15.renderItem = function(v19)
        assert(v19.logo ~= nil, "Invalid icon: " .. v19.key);
        return v1.createElement(l_IconButton_0, {
            icon = v19.logo, 
            size = v15.getMeasuredItemSize(), 
            iconColor3 = l_Colors_0.White, 
            iconSize = l_Large_0, 
            onActivated = function()
                v15.props.handleItemClick(v19.key);
            end
        }), {
            LayoutOrder = v3.List.find(v15.props.itemList, v19)
        };
    end;
end;
v14.render = function(v20)
    local v21 = v20.getMeasuredItemSize();
    return v1.createElement(l_InteractableList_0, {
        fillDirection = Enum.FillDirection.Horizontal, 
        horizontalAlignment = Enum.HorizontalAlignment.Left, 
        sortOrder = Enum.SortOrder.LayoutOrder, 
        padding = v20.props.padding, 
        size = UDim2.new(1, 0, 0, v21.Y.Offset), 
        itemList = v20.getInteractableItemTable(), 
        itemSize = v21, 
        layoutOrder = v20.props.layoutOrder, 
        renderItem = v20.renderItem, 
        selectionMode = l_SelectionMode_0.None
    });
end;
return v14;

local v0 = require(script:FindFirstAncestor("SocialTab").dependencies);
local l_t_0 = v0.t;
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v5 = l_Roact_0.PureComponent:extend("GroupsTile");
v5.defaultProps = {
    LayoutOrder = 0, 
    onActivated = function()
    end, 
    title = ""
};
v5.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.optional(l_t_0.number), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    title = l_t_0.optional(l_t_0.string)
});
v5.render = function(v6)
    return l_UIBlox_0.Style.withStyle(function()
        return l_Roact_0.createElement(l_UIBlox_0.App.Tile.MenuTile, {
            size = UDim2.fromScale(1, 1), 
            layoutOrder = v6.props.LayoutOrder, 
            icon = l_Images_0["icons/menu/groups_large"], 
            title = v6.props.title, 
            onActivated = v6.props.onActivated
        });
    end);
end;
return v5;

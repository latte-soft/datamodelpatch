local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_t_0 = v0.t;
local l_Roact_0 = v0.Roact;
local l_Cryo_0 = v0.Cryo;
local l_UIBlox_0 = v0.UIBlox;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local v7 = require(script.Parent.Parent.Parent.Components.GameIcon);
local v8 = UDim.new(0, 8);
local v9 = l_Roact_0.PureComponent:extend("GameIconButton");
v9.validateProps = l_t_0.strictInterface({
    anchorPoint = l_t_0.optional(l_t_0.Vector2), 
    position = l_t_0.optional(l_t_0.UDim2), 
    layoutOrder = l_t_0.optional(l_t_0.integer), 
    onActivated = l_t_0.callback, 
    onSelectionGained = l_t_0.optional(l_t_0.callback), 
    onSelectionLost = l_t_0.optional(l_t_0.callback), 
    forwardRef = l_t_0.optional(l_t_0.table)
});
v9.renderWithSelectionCursor = function(v10, v11)
    return l_Roact_0.createElement("TextButton", {
        Text = "", 
        AnchorPoint = v10.props.anchorPoint, 
        BackgroundTransparency = 1, 
        Position = v10.props.position, 
        Size = UDim2.fromOffset(32, 32), 
        LayoutOrder = v10.props.layoutOrder, 
        SelectionImageObject = v11(l_CursorKind_0.RoundedRect), 
        [l_Roact_0.Event.Activated] = v10.props.onActivated, 
        [l_Roact_0.Event.SelectionGained] = v10.props.onSelectionGained, 
        [l_Roact_0.Event.SelectionLost] = v10.props.onSelectionLost, 
        [l_Roact_0.Ref] = v10.props.forwardRef
    }, {
        GameIconButton = l_Roact_0.createElement(v7, {
            gameId = game.GameId, 
            iconSize = 32, 
            cornerRadius = v8
        })
    });
end;
v9.render = function(v12)
    return l_withSelectionCursorProvider_0(function(v13)
        return v12:renderWithSelectionCursor(v13);
    end);
end;
return l_Roact_0.forwardRef(function(v14, v15)
    return l_Roact_0.createElement(v9, l_Cryo_0.Dictionary.join(v14, {
        forwardRef = v15
    }));
end);

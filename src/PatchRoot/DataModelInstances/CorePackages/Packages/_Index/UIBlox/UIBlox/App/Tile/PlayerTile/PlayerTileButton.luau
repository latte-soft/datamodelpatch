local l_script_FirstAncestor_0 = script:FindFirstAncestor("App");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Roact);
local v6 = require(l_script_FirstAncestor_0.Button.Button);
local v7 = require(l_script_FirstAncestor_0.Button.Enum.ButtonType);
local v8 = require(l_Core_0.Control.Enum.ControlState);
local v9 = v5.PureComponent:extend("PlayerTileButton");
v9.validateProps = v4.strictInterface({
    buttonHeight = v4.optional(v4.number), 
    buttonWidth = v4.optional(v4.number), 
    outerButtonPadding = v4.optional(v4.number), 
    icon = v4.union(v4.string, v4.table), 
    onActivated = v4.optional(v4.callback), 
    isSecondary = v4.optional(v4.boolean), 
    isDisabled = v4.optional(v4.boolean), 
    tileSize = v4.optional(v4.UDim2), 
    mouseEnter = v4.optional(v4.callback), 
    mouseLeave = v4.optional(v4.callback)
});
v9.defaultProps = {
    isSecondary = false, 
    isDisabled = false, 
    buttonHeight = 36, 
    outerButtonPadding = 10, 
    tileSize = UDim2.new(0, 150, 0, 150)
};
v9.render = function(v10)
    return v5.createElement(v6, {
        buttonType = not not v10.props.isSecondary and v7.Secondary or v7.PrimarySystem, 
        automaticSize = Enum.AutomaticSize.XY, 
        position = UDim2.new(1, 0, 1, 0), 
        size = UDim2.new(0, v10.props.tileSize.X.Offset / 2 - v10.props.outerButtonPadding * 1.5, 0, v10.props.buttonHeight), 
        anchorPoint = Vector2.new(1, 1), 
        onActivated = v10.props.onActivated or function()
        end, 
        isDisabled = v10.props.isDisabled, 
        icon = v10.props.icon, 
        onStateChanged = function(v11, v12)
            if v11 == v8.Hover then
                v10.props.mouseEnter();
                return ;
            else
                if v12 == v8.Hover then
                    v10.props.mouseLeave();
                end;
                return ;
            end;
        end
    });
end;
return v9;

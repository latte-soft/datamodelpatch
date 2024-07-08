local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(script.Parent.Button);
local v4 = v1.PureComponent:extend("ViewDetailsButton");
v4.defaultProps = {
    text = nil, 
    LayoutOrder = nil, 
    onActivated = function()
        print("View details button pressed");
    end
};
v4.render = function(v5)
    return v2.Style.withStyle(function(v6)
        return v1.createElement(v3, {
            text = v5.props.text, 
            textColor = v6.Theme.SystemPrimaryContent.Color, 
            textSize = v6.Font.Body.RelativeSize * v6.Font.BaseSize, 
            font = v6.Font.Body.Font, 
            transparency = v6.Theme.SystemPrimaryDefault.Transparency, 
            color = v6.Theme.SystemPrimaryDefault.Color, 
            LayoutOrder = v5.props.LayoutOrder or 0, 
            onActivated = v5.props.onActivated
        });
    end);
end;
return v4;

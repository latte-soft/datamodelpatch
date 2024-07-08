local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.UIBlox);
local v2 = require(l_Parent_0.Roact);
local v3 = require(script.Parent.Button);
local v4 = v2.PureComponent:extend("PlayButton");
v4.defaultProps = {
    text = "Play", 
    LayoutOrder = 0, 
    onActivated = function()
        print("Play button activated");
    end
};
v4.render = function(v5)
    return v1.Style.withStyle(function(v6)
        return v2.createElement(v3, {
            text = v5.props.text, 
            textColor = Color3.fromRGB(255, 255, 255), 
            textSize = 23, 
            font = v6.Font.Body.Font, 
            transparency = v6.Theme.ContextualPrimaryDefault.Transparency, 
            color = v6.Theme.ContextualPrimaryDefault.Color, 
            LayoutOrder = v5.props.LayoutOrder or 0, 
            onActivated = v5.props.onActivated
        });
    end);
end;
return v4;

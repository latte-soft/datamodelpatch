local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Parent.Roact);
local v2 = require(l_script_FirstAncestor_0.ChatWindow.UI.BottomLockedScrollView);
local v3 = v1.Component:extend("ScrollingView");
v3.defaultProps = {};
v3.render = function(v4)
    return v1.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        Size = v4.props.size
    }, {
        bottomLockedScrollView = v1.createElement(v2, {
            Size = UDim2.fromScale(1, 1), 
            messages = v4.props.messages
        }, v4.props[v1.Children])
    });
end;
return v3;

local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_0.Core.ImageSet.ImageSetComponent);
local v6 = require(l_Parent_0.Core.Control.Controllable);
local v7 = v3.PureComponent:extend("Interactable");
v7.validateProps = v4.interface({
    isDisabled = v4.optional(v4.boolean), 
    onStateChanged = v4.callback
});
v7.render = function(v8)
    return v3.createElement(v6, {
        onStateChanged = v8.props.onStateChanged, 
        isDisabled = v8.props.isDisabled, 
        userInteractionEnabled = v8.props.userInteractionEnabled, 
        controlComponent = {
            component = v5.Button, 
            props = v8.props, 
            children = v8.props[v3.Children] or {}
        }
    });
end;
return v3.forwardRef(function(v9, v10)
    return v3.createElement(v7, v2.Dictionary.join(v9, {
        forwardedRef = v10
    }));
end);

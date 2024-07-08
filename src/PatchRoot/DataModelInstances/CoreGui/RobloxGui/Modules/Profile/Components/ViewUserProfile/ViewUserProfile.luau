local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_withLocalization_0 = v1.withLocalization;
local l_t_0 = v1.t;
local l_UIBlox_0 = v1.UIBlox;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local v8 = l_Roact_0.PureComponent:extend("ViewUserProfile");
local v9 = require(l_Parent_0.Common.TextKeys);
v8.validateProps = l_t_0.strictInterface({
    layoutOrder = l_t_0.optional(l_t_0.integer), 
    onActivated = l_t_0.callback
});
v8.render = function(v10)
    local l_props_0 = v10.props;
    return l_withLocalization_0({
        viewProfile = v9.ViewProfile
    })(function(v12)
        return l_Roact_0.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            layoutOrder = l_props_0.layoutOrder, 
            size = UDim2.new(1, 0, 0, 48), 
            onActivated = l_props_0.onActivated, 
            text = v12.viewProfile
        });
    end);
end;
return v8;

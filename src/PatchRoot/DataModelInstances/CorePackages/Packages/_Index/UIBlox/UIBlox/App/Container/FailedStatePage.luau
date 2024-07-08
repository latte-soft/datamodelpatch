local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.App.ImageSet.Images);
local v5 = require(l_Parent_0.App.Indicator.EmptyState);
local v6 = require(l_Parent_0.App.Button.Button);
local v7 = require(l_Parent_0.App.Button.Enum.ButtonType);
local v8 = require(l_Parent_0.App.Loading.Enum.RenderOnFailedStyle);
local v9 = v2.PureComponent:extend("FailedStatePage");
v9.validateProps = v3.strictInterface({
    onRetry = v3.optional(v3.callback), 
    renderOnFailed = v3.optional(v8.isEnumValue), 
    text = v3.optional(v3.string)
});
v9.defaultProps = {
    renderOnFailed = v8.RetryButton
};
v9.render = function(v10)
    if v10.props.renderOnFailed == v8.EmptyStatePage then
        return v2.createElement(v5, {
            position = UDim2.fromScale(0.5, 0.5), 
            anchorPoint = Vector2.new(0.5, 0.5), 
            onActivated = v10.props.onRetry, 
            icon = v4["icons/status/noconnection_large"], 
            text = v10.props.text
        });
    elseif v10.props.renderOnFailed == v8.RetryButton then
        if not v10.props.onRetry then
            error("OnRetry callback empty. OnRetry needs to be a function to render the RetryButton");
            return ;
        else
            return v2.createElement(v6, {
                buttonType = v7.Secondary, 
                size = UDim2.fromOffset(44, 44), 
                position = UDim2.fromScale(0.5, 0.5), 
                anchorPoint = Vector2.new(0.5, 0.5), 
                onActivated = v10.props.onRetry, 
                icon = v4["icons/common/refresh"]
            });
        end;
    else
        error("Failed to provide proper RenderOnFailedStyle");
        return ;
    end;
end;
return v9;

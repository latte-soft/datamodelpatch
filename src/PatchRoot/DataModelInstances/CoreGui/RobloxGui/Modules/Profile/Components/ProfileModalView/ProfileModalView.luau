local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local v6 = require(l_Parent_0.Common.ContextPropsTypes);
local v7 = l_Roact_0.PureComponent:extend("ProfileModalView");
v7.validateProps = l_t_0.strictInterface({
    renderBottomBar = l_t_0.callback, 
    renderContent = l_t_0.callback, 
    renderTopBar = l_t_0.callback, 
    viewWidth = l_t_0.number, 
    peekViewProps = v6.validatePeekViewProps, 
    bottomOffset = l_t_0.number, 
    topBarHeight = l_t_0.number
});
v7.render = function(v8)
    local l_props_0 = v8.props;
    return l_withStyle_0(function(v10)
        return l_Roact_0.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v10.Theme.Overlay.Transparency, 
            BackgroundColor3 = v10.Theme.Overlay.Color, 
            Active = true, 
            AutoButtonColor = false
        }, {
            ProfileWindow = l_Roact_0.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                Size = UDim2.new(0, l_props_0.viewWidth, 1, 0), 
                BackgroundTransparency = v10.Theme.BackgroundDefault.Transparency, 
                BackgroundColor3 = v10.Theme.BackgroundDefault.Color, 
                BorderSizePixel = 0
            }, {
                ProfileTopBar = l_props_0.renderTopBar(), 
                PeekViewContainer = l_Roact_0.createElement("ScrollingFrame", {
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 1, 1, -l_props_0.topBarHeight - 40), 
                    Position = UDim2.new(0, 0, 0, l_props_0.topBarHeight), 
                    ScrollBarThickness = 0, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y
                }, {
                    Content = l_props_0.renderContent()
                }), 
                ProfileBottomBar = l_props_0.renderBottomBar()
            })
        });
    end);
end;
return v7;

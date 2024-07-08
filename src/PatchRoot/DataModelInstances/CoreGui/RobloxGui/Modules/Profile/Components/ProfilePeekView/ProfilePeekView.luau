local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_PeekView_0 = v1.PeekView;
local l_PeekViewState_0 = v1.PeekViewState;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local v8 = require(l_Parent_0.Common.ContextPropsTypes);
local _ = require(script.Parent.profilePeekViewMapStateToProps);
local v10 = l_Roact_0.PureComponent:extend("ProfilePeekView");
v10.validateProps = l_t_0.strictInterface({
    bottomOffset = l_t_0.number, 
    viewWidth = l_t_0.number, 
    peekViewProps = v8.validatePeekViewProps, 
    renderBottomBar = l_t_0.callback, 
    renderContent = l_t_0.callback, 
    renderTopBar = l_t_0.callback, 
    topBarHeight = l_t_0.number
});
v10.defaultProps = {
    peekViewProps = {}
};
v10.init = function(v11)
    v11.state = {
        topBarOpacity = 0
    };
    v11.briefToFullTransitionPercent = function(v12)
        v11:setState({
            topBarOpacity = v12
        });
    end;
    v11.viewStateChanged = function(v13, _)
        local l_onPeekViewClosed_0 = v11.props.peekViewProps.onPeekViewClosed;
        if not (not (v13 == l_PeekViewState_0.Closed) or not l_onPeekViewClosed_0) then
            l_onPeekViewClosed_0();
        end;
    end;
end;
v10.render = function(v16)
    return l_withStyle_0(function(v17)
        return v16:renderWithProviders(v17);
    end);
end;
v10.renderWithProviders = function(v18, v19)
    local l_props_0 = v18.props;
    local l_viewWidth_0 = l_props_0.viewWidth;
    local v22 = UDim2.new(0, l_props_0.viewWidth, 1, 0);
    local l_peekViewProps_0 = l_props_0.peekViewProps;
    local l_topBarHeight_0 = l_props_0.topBarHeight;
    local l_topBarOpacity_0 = v18.state.topBarOpacity;
    local v26 = l_topBarOpacity_0 > 0.95;
    local v27 = false;
    if l_topBarOpacity_0 > 0 then
        v27 = not v26;
    end;
    return l_Roact_0.createElement("Frame", {
        Position = UDim2.fromOffset(0, 0), 
        Size = v22, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        PeekViewTopBar = v26 and l_props_0.renderTopBar(), 
        PeekViewTopBarEffectHolder = v27 and l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_topBarHeight_0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundColor3 = v19.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1 - l_topBarOpacity_0
        }), 
        PeekViewContainer = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -l_topBarHeight_0 + 6), 
            Position = UDim2.new(0, 0, 0, l_topBarHeight_0 - 6), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true
        }, {
            PeekView = l_Roact_0.createElement(l_PeekView_0, {
                briefViewContentHeight = UDim.new(0, l_viewWidth_0 + 48), 
                bottomDockedContainerHeight = 58, 
                bottomDockedContainerContent = {
                    PeekViewBottomBar = l_props_0.renderBottomBar()
                }, 
                mountAsFullView = l_peekViewProps_0.mountAsFullView, 
                mountAnimation = l_peekViewProps_0.mountAnimation, 
                viewStateChanged = v18.viewStateChanged, 
                briefToFullTransitionPercent = v18.briefToFullTransitionPercent
            }, {
                UIListLayout = l_Roact_0.createElement("UIListLayout", {
                    Padding = UDim.new(0, 0), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                Content = l_props_0.renderContent()
            })
        })
    });
end;
return v10;

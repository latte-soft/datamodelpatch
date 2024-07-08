local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.ArrowNav);
local v7 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_Images_0 = v5.App.ImageSet.Images;
local v9 = l_Images_0["icons/actions/cycleLeft"];
local v10 = l_Images_0["icons/actions/cycleRight"];
local v11 = v3.PureComponent:extend("ArrowFrame");
v11.validateProps = v4.strictInterface({
    ZIndex = v4.optional(v4.number), 
    isVisibleLeft = v4.optional(v4.union(v4.boolean, v4.table)), 
    isVisibleRight = v4.optional(v4.union(v4.boolean, v4.table)), 
    onPressHoldInputBegan = v4.optional(v4.callback), 
    onPressHoldInputEnded = v4.optional(v4.callback), 
    defaultUseProps = v4.optional(v4.strictInterface({
        scrollingFrameRef = v4.table, 
        buttonRefs = v4.optional(v4.table), 
        buttonWidth = v4.optional(v4.number), 
        padOutsideEdges = v4.optional(v4.boolean), 
        numButtons = v4.optional(v4.number), 
        buttonPadding = v4.number, 
        updateCanvasPosition = v4.callback
    }))
});
v11.defaultProps = {
    ZIndex = 1, 
    isVisibleRight = true, 
    isVisibleLeft = true
};
v11.init = function(v12)
    v12.state = {
        isHovered = false
    };
    v12.onMouseEnter = function()
        v12:setState({
            isHovered = true
        });
    end;
    v12.onMouseLeave = function()
        v12:setState({
            isHovered = false
        });
    end;
end;
v11.render = function(v13)
    local l_isVisibleLeft_0 = v13.props.isVisibleLeft;
    local l_isVisibleRight_0 = v13.props.isVisibleRight;
    local l_defaultUseProps_0 = v13.props.defaultUseProps;
    local l_onPressHoldInputBegan_0 = v13.props.onPressHoldInputBegan;
    local l_onPressHoldInputEnded_0 = v13.props.onPressHoldInputEnded;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = v13.props.ZIndex, 
        [v3.Event.MouseEnter] = v13.onMouseEnter, 
        [v3.Event.MouseLeave] = v13.onMouseLeave
    }, {
        ArrowLeft = v3.createElement(v6, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, -6, 0.5, 0), 
            Image = v9, 
            Visible = v13.state.isHovered and l_isVisibleLeft_0, 
            navDirection = v7.NavigationDirection.IS_LEFT, 
            defaultUseProps = l_defaultUseProps_0, 
            onPressHoldInputBegan = l_onPressHoldInputBegan_0, 
            onPressHoldInputEnded = l_onPressHoldInputEnded_0
        }), 
        ArrowRight = v3.createElement(v6, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(1, -30, 0.5, 0), 
            Image = v10, 
            Visible = v13.state.isHovered and l_isVisibleRight_0, 
            navDirection = v7.NavigationDirection.IS_RIGHT, 
            defaultUseProps = l_defaultUseProps_0, 
            onPressHoldInputBegan = l_onPressHoldInputBegan_0, 
            onPressHoldInputEnded = l_onPressHoldInputEnded_0
        })
    });
end;
return v11;

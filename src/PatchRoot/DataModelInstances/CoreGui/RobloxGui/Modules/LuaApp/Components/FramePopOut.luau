local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.LuaApp.FitChildren);
local v4 = require(l_Modules_0.LuaApp.RoactMotion);
local v5 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local function _(v7, v8, v9)
    return (1 - v7) * v8 + v7 * v9;
end;
local function v19(v11, v12, v13)
    local v14 = {};
    local v15 = v11.x + v11.width * 0.5;
    local v16 = v11.y + v11.height * 0.5;
    local v17 = 0.1 * v13;
    v14.pointerHeight = 6;
    v14.pointerWidth = 12;
    v14.x = (v11.x + v11.width * 0.5) - v12 * 0.5;
    v14.pointerX = v15 - v14.pointerWidth * 0.5;
    if v16 < v11.parentHeight * 0.5 then
        v14.y = (v11.y + v11.height) + v14.pointerHeight;
        v14.height = math.min((v11.parentHeight - v14.y) - 10, v13);
        v14.pointerIcon = "LuaApp/dropdown/gr-tip-up";
        v14.pointerY = v11.y + v11.height;
        v14.menuStartY = v14.y;
    else
        local v18 = v11.y - v14.pointerHeight;
        v14.height = math.min(v18 - 10, v13);
        v14.y = v18 - v14.height;
        v14.pointerIcon = "LuaApp/dropdown/gr-tip-down";
        v14.pointerY = v18;
        v14.menuStartY = v14.pointerY - v17;
    end;
    if v14.height < v13 then
        v14.pointerHeight = 12;
        v14.pointerWidth = 6;
        v14.height = math.min(v11.parentHeight - 20, v13);
        v14.y = v16 - v14.height * 0.5;
        if v14.y < 10 then
            v14.y = 10;
        elseif v11.parentHeight - 10 < v14.y + v14.height then
            v14.y = (v11.parentHeight - 10) - v14.height;
        end;
        v14.pointerY = v16 - v14.pointerHeight * 0.5;
        v14.menuStartY = (v14.pointerY + v14.pointerHeight / 2) - v17 / 2;
        if v15 <= v11.parentWidth * 0.5 then
            v14.x = (v11.x + v11.width) + v14.pointerWidth;
            if v11.parentWidth - 10 < v14.x + v12 then
                v14.x = (v11.parentWidth - v12) - 10;
            end;
            v14.pointerIcon = "LuaApp/dropdown/gr-tip-left";
            v14.pointerX = v14.x - v14.pointerWidth;
        else
            v14.x = (v11.x - v12) - v14.pointerWidth;
            if v14.x < 10 then
                v14.x = 10;
            end;
            v14.pointerIcon = "LuaApp/dropdown/gr-tip-right";
            v14.pointerX = v14.x + v12;
        end;
    elseif v14.x < 10 then
        v14.x = 10;
    elseif v11.parentWidth - 10 < v14.x + v12 then
        v14.x = (v11.parentWidth - v12) - 10;
    end;
    v14.pointerX = v14.pointerX + -1;
    v14.pointerY = v14.pointerY + -1;
    v14.pointerWidth = v14.pointerWidth + 2;
    v14.pointerHeight = v14.pointerHeight + 2;
    return v14;
end;
local v20 = v2.PureComponent:extend("FramePopOut");
v20.defaultProps = {
    isAnimated = false
};
v20.init = function(v21)
    v21.state = {
        hidden = v21.props.isAnimated, 
        frameHeight = 0
    };
    v21.isMounted = false;
    v21.animationPercentage = not v21.state.hidden and 1 or 0;
    v21.stiffness = nil;
    v21.damping = nil;
    v21.onRested = nil;
    v21.onActivated = function()
        v21:close();
    end;
    v21.onSizeChanged = function(v22)
        spawn(function()
            if v21.isMounted then
                v21:setState({
                    frameHeight = v22.AbsoluteSize.Y
                });
            end;
        end);
    end;
end;
v20.open = function(v23)
    if not (not v23.state.hidden or not v23.props.isAnimated) then
        v23.animationPercentage = 1;
        v23.stiffness = nil;
        v23.damping = nil;
        v23.onRested = nil;
        v23:setState({
            hidden = false
        });
    end;
    v23.animationPercentage = 1;
    v23.stiffness = nil;
    v23.damping = nil;
    v23.onRested = nil;
    v23:setState({
        hidden = false
    });
end;
v20.close = function(v24)
    local l_onCancel_0 = v24.props.onCancel;
    if v24.state.hidden or not v24.props.isAnimated then
        if not v24.props.isAnimated then
            l_onCancel_0();
        end;
        return ;
    else
        v24.animationPercentage = 0;
        v24.stiffness = 270;
        v24.damping = nil;
        v24.onRested = l_onCancel_0;
        v24:setState({
            hidden = true
        });
        return ;
    end;
end;
v20.didMount = function(v26)
    v26.isMounted = true;
    v26:open();
end;
v20.willUnmount = function(v27)
    v27.isMounted = false;
end;
v20.render = function(v28)
    local v29 = v28.props[v2.Children];
    local l_itemWidth_0 = v28.props.itemWidth;
    local l_parentShape_0 = v28.props.parentShape;
    if v28.state.frameHeight == 0 then
        l_itemWidth_0 = 0;
    end;
    local v32 = v19(l_parentShape_0, l_itemWidth_0, v28.state.frameHeight);
    return l_withStyle_0(function(v33)
        return v2.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            Text = "", 
            Selectable = false, 
            [v2.Event.Activated] = v28.onActivated
        }, {
            Pointer = v2.createElement(v5, {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ClipsDescendants = false, 
                Image = v32.pointerIcon, 
                ImageColor3 = v33.Theme.BackgroundUIDefault.Color, 
                ImageTransparency = v33.Theme.BackgroundUIDefault.Transparency, 
                Position = UDim2.new(0, v32.pointerX, 0, v32.pointerY), 
                Size = UDim2.new(0, v32.pointerWidth, 0, v32.pointerHeight)
            }), 
            AnimatedPopout = v2.createElement(v4.SimpleMotion, {
                style = {
                    animationPercentage = v4.spring(v28.animationPercentage, v28.stiffness, v28.damping)
                }, 
                onRested = function()
                    if v28.onRested then
                        v28.onRested();
                    end;
                end, 
                render = function(v34)
                    local l_createElement_0 = v2.createElement;
                    local v36 = "Frame";
                    local v37 = {
                        BorderSizePixel = 0, 
                        BackgroundColor3 = v33.Theme.BackgroundUIDefault.Color, 
                        BackgroundTransparency = v33.Theme.BackgroundUIDefault.Transparency
                    };
                    local l_new_0 = UDim2.new;
                    local v39 = 0;
                    local l_x_0 = v32.x;
                    local v41 = 0;
                    local l_animationPercentage_0 = v34.animationPercentage;
                    v37.Position = l_new_0(v39, l_x_0, v41, (1 - l_animationPercentage_0) * v32.menuStartY + l_animationPercentage_0 * v32.y);
                    l_new_0 = UDim2.new;
                    v39 = 0;
                    l_x_0 = l_itemWidth_0;
                    v41 = 0;
                    local l_animationPercentage_1 = v34.animationPercentage;
                    v37.Size = l_new_0(v39, l_x_0, v41, ((1 - l_animationPercentage_1) * 0.1 + l_animationPercentage_1 * 1) * v28.state.frameHeight);
                    v37.ClipsDescendants = true;
                    return l_createElement_0(v36, v37, {
                        Frame = v2.createElement(v3.FitFrame, {
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Position = UDim2.new(0, 0, 0, 0), 
                            Size = UDim2.new(1, 0, 1, 0), 
                            fitAxis = v3.FitAxis.Height, 
                            ClipsDescendants = false, 
                            [v2.Change.AbsoluteSize] = v28.onSizeChanged
                        }, v29)
                    });
                end
            })
        });
    end);
end;
return v20;

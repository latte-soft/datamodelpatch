local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v3 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v4 = v1.PureComponent:extend("CheckBox");
v4.init = function(v5)
    v5.state = {
        hovering = false
    };
    v5.onActivated = function()
        if not (not v5.props.Enabled or not v5.props.OnActivated) then
            v5.props.OnActivated();
        end;
    end;
    v5.onMouseEnter = function(_)
        spawn(function()
            v5:setState({
                hovering = true
            });
        end);
    end;
    v5.onMouseLeave = function(_)
        spawn(function()
            v5:setState({
                hovering = false
            });
        end);
    end;
end;
v4.render = function(v8)
    local l_Enabled_0 = v8.props.Enabled;
    local l_LayoutOrder_0 = v8.props.LayoutOrder;
    local l_Selected_0 = v8.props.Selected;
    local l_Height_0 = v8.props.Height;
    local v13 = nil;
    local _ = nil;
    if not v8.state.hovering then
        if l_Enabled_0 or v8.state.hovering then
            if l_Enabled_0 then
                v13 = "LuaApp/graphic/checkbox_unchecked";
            end;
        else
            v13 = "LuaApp/graphic/checkbox_unchecked_disabled";
        end;
    else
        v13 = "LuaApp/graphic/checkbox_unchecked_hover";
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(0, l_Height_0, 0, l_Height_0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Background = v1.createElement(v2, {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ImageTransparency = not l_Enabled_0 and 0.4 or 0, 
            Image = v13, 
            LayoutOrder = l_LayoutOrder_0 or 1, 
            AutoButtonColor = false, 
            [v1.Event.Activated] = v8.onActivated, 
            [v1.Event.MouseEnter] = v8.onMouseEnter, 
            [v1.Event.MouseLeave] = v8.onMouseLeave
        }, {
            Selection = v1.createElement(v3, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Visible = l_Selected_0, 
                Image = not l_Enabled_0 and "LuaApp/graphic/checkbox_checked_disabled" or "LuaApp/graphic/checkbox_checked"
            })
        })
    });
end;
return v4;

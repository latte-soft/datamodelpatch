local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Common.Immutable);
local v3 = require(l_Modules_0.Common.Text);
local v4 = require(l_Modules_0.LuaApp.FitChildren);
local v5 = v1.PureComponent:extend("FitTextLabel");
v5.defaultProps = {
    fitAxis = v4.FitAxis.Height, 
    maxWidth = nil
};
v5.init = function(v6)
    v6.onRef = function(v7)
        v6.ref = v7;
    end;
    v6.resize = function(v8)
        local l_fitAxis_0 = v6.props.fitAxis;
        local l_maxWidth_0 = v6.props.maxWidth;
        if not (l_fitAxis_0 ~= v4.FitAxis.Width) or l_fitAxis_0 == v4.FitAxis.Both then
            local v11 = UDim.new(0, v3.GetTextWidth(v8.Text, v8.Font, v8.TextSize));
            local v12 = nil;
            if l_maxWidth_0 ~= nil and l_maxWidth_0 < v11.Offset then
                v11 = UDim.new(0, l_maxWidth_0);
                v12 = UDim.new(0, v3.GetTextHeight(v8.Text, v8.Font, v8.TextSize, v11.Offset));
            else
                v12 = l_fitAxis_0 == v4.FitAxis.Both and UDim.new(0, v8.TextSize) or v8.Size.Height;
            end;
            v6:setState({
                width = v11, 
                height = v12
            });
            return ;
        else
            v6:setState({
                width = v8.Size.Width, 
                height = UDim.new(0, v3.GetTextHeight(v8.Text, v8.Font, v8.TextSize, v8.AbsoluteSize.X))
            });
            return ;
        end;
    end;
    v6:setState({
        width = nil, 
        height = nil
    });
end;
v5.render = function(v13)
    local v14 = v13.props.fitAxis or v4.FitAxis.Height;
    local v15 = v2.RemoveFromDictionary(v13.props, "fitAxis", "maxWidth");
    local l_width_0 = v13.state.width;
    local l_height_0 = v13.state.height;
    if not (not l_width_0 or not l_height_0) then
        v15 = v2.JoinDictionaries(v15, {
            Size = UDim2.new(l_width_0, l_height_0)
        });
    end;
    return v1.createElement("TextLabel", v2.JoinDictionaries(v15, {
        [v1.Ref] = v13.onRef, 
        [v1.Change.Text] = v13.resize, 
        [v1.Change.TextSize] = v13.resize, 
        [v1.Change.AbsoluteSize] = v14 == v4.FitAxis.Height and v13.resize or nil
    }));
end;
v5.didMount = function(v18)
    v18.resize(v18.ref);
end;
return v5;

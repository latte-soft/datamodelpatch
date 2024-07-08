local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Cryo);
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.Immutable);
local v4 = require(l_Modules_0.Common.Text);
local v5 = require(l_Modules_0.LuaApp.FitChildren);
local v6 = v2.PureComponent:extend("FitTextButton");
v6.defaultProps = {
    fitAxis = v5.FitAxis.Height
};
v6.init = function(v7)
    v7.ref = v7.props.forwardRef or v2.createRef();
    v7.resize = function(v8)
        local l_fitAxis_0 = v7.props.fitAxis;
        if not (l_fitAxis_0 ~= v5.FitAxis.Width) or l_fitAxis_0 == v5.FitAxis.Both then
            v8.Size = UDim2.new(UDim.new(0, v4.GetTextWidth(v8.Text, v8.Font, v8.TextSize)), l_fitAxis_0 == v5.FitAxis.Both and UDim.new(0, v8.TextSize) or v8.Size.Height);
            return ;
        else
            v8.Size = UDim2.new(v8.Size.Width, (UDim.new(0, v4.GetTextHeight(v8.Text, v8.Font, v8.TextSize, v8.AbsoluteSize.X))));
            return ;
        end;
    end;
end;
v6.render = function(v10)
    return v2.createElement("TextButton", v3.JoinDictionaries(v3.RemoveFromDictionary(v10.props, "fitAxis", "forwardRef"), {
        [v2.Ref] = v10.ref, 
        [v2.Change.Text] = v10.resize, 
        [v2.Change.TextSize] = v10.resize, 
        [v2.Change.AbsoluteSize] = (v10.props.fitAxis or v5.FitAxis.Height) == v5.FitAxis.Height and v10.resize or nil
    }));
end;
v6.didMount = function(v11)
    v11.resize(v11.ref.current);
end;
return v2.forwardRef(function(v12, v13)
    return v2.createElement(v6, v1.Dictionary.join(v12, {
        forwardRef = v13
    }));
end);

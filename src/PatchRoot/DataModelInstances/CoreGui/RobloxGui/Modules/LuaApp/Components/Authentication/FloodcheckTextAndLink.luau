local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Cryo);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.Components.AdjacentTextAndLink);
local v6 = require(l_Modules_0.LuaApp.FitChildren);
local v7 = v2.PureComponent:extend("FloodcheckTextAndLink");
game:DefineFastInt("LuaSignupCooldownTimerSeconds", 15);
v7.defaultProps = {
    fontStyle = "CaptionBody", 
    textLabelText = "", 
    textButtonText = "", 
    textButtonEnabled = true
};
v7.init = function(v8)
    v8.state = {
        timer = 0
    };
    v8.mounted = false;
    local v9 = false;
    v8.onActivated = function(v10)
        local l_textButtonEnabled_0 = v8.props.textButtonEnabled;
        if not ((not (not v9 and v8.state.timer == 0) or not v8.mounted) or not l_textButtonEnabled_0) then
            v9 = true;
            spawn(function()
                local v12 = v8.props.cooldownTime or game:GetFastInt("LuaSignupCooldownTimerSeconds");
                v9 = false;
                for v13 = v12, 0, -1 do
                    if v8.mounted then
                        v8:setState({
                            timer = v13
                        });
                        wait(1);
                    else
                        break;
                    end;
                end;
            end);
            if v8.props.onActivated then
                v8.props.onActivated(v10);
            end;
        end;
    end;
end;
v7.didMount = function(v14)
    v14.mounted = true;
end;
v7.willUnmount = function(v15)
    v15.mounted = false;
end;
v7.render = function(v16)
    return l_withStyle_0(function(v17)
        local v18 = v17.Font[v16.props.fontStyle];
        local v19 = v18.RelativeSize * v17.Font.BaseSize;
        return v2.createElement(v6.FitFrame, {
            Size = UDim2.fromOffset(0, v19), 
            LayoutOrder = v16.props.LayoutOrder, 
            BackgroundTransparency = 1, 
            fitAxis = v6.FitAxis.Width
        }, {
            TextAndLink = v2.createElement(v5, v3.Dictionary.join(v16.props, {
                textButtonEnabled = v16.state.timer == 0, 
                onActivated = v16.onActivated
            })), 
            Timer = v2.createElement("TextLabel", {
                Font = v18.Font, 
                TextSize = v19, 
                Size = UDim2.fromOffset(0, v19), 
                Position = UDim2.fromScale(1, 0), 
                TextColor3 = v17.Theme.TextEmphasis.Color, 
                Text = v16.state.timer > 0 and " " .. v16.state.timer or "", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTransparency = v16.props.TextTransparency, 
                BackgroundTransparency = 1
            })
        });
    end);
end;
return v7;

local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_t_0 = v0.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Flags.FFlagLuaMenuPerfImprovements);
local v7 = require(l_Parent_0.Resources.Assets);
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local v9 = l_Roact_0.PureComponent:extend("MoreButton");
v9.validateProps = l_t_0.strictInterface({
    onActivated = l_t_0.callback, 
    LayoutOrder = l_t_0.integer, 
    userId = not not v6 and l_t_0.number or nil
});
v9.init = function(v10)
    if v6 then
        v10.onActivated = function()
            v10.props.onActivated(v10.props.userId);
        end;
    end;
end;
v9.render = function(v11)
    return l_withStyle_0(function(v12)
        local l_onActivated_0 = v11.props.onActivated;
        if v6 then
            l_onActivated_0 = not not v11.props.onActivated and v11.onActivated or nil;
        end;
        return l_Roact_0.createElement(l_ImageSetButton_0, {
            Size = UDim2.new(0, 36, 0, 36), 
            BackgroundTransparency = 1, 
            Image = v7.Images.MoreActions, 
            ImageColor3 = v12.Theme.IconEmphasis.Color, 
            LayoutOrder = v11.props.LayoutOrder, 
            [l_Roact_0.Event.Activated] = l_onActivated_0
        });
    end);
end;
return v9;

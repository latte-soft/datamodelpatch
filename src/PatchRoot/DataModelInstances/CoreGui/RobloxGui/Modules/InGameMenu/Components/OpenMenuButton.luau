local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local l_UIBlox_0 = v0.UIBlox;
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Resources.Assets);
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local v7 = require(l_Parent_0.GlobalConfig);
local v8 = l_t_0.strictInterface({
    onClick = l_t_0.callback
});
return function(v9)
    if v7.propValidation then
        assert(v8(v9));
    end;
    return l_Roact_0.createElement(l_ImageSetButton_0, {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = v5.Images.RobloxLogo, 
        Position = UDim2.new(0, 50, 0.5, 0), 
        Size = UDim2.new(0, 32, 0, 32), 
        [l_Roact_0.Event.Activated] = v9.onClick
    });
end;

local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_Cryo_0 = v0.Cryo;
local l_UIBlox_0 = v0.UIBlox;
local l_Parent_0 = script.Parent.Parent;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local v7 = require(l_Parent_0.Resources.Assets);
local _ = function(v8)
    return l_Roact_0.forwardRef(function(v9, v10)
        local v11 = v7.Images[v9.imageKey];
        local _ = nil;
        return l_Roact_0.createElement(v8, l_Cryo_0.Dictionary.join(l_Cryo_0.Dictionary.join(v9, {
            imageKey = l_Cryo_0.None
        }, if typeof(v11) == "string" then {
            Image = v11
        } else v11, {
            BackgroundTransparency = 1
        }), {
            [l_Roact_0.Ref] = v10
        }));
    end);
end;
return {
    Label = l_Roact_0.forwardRef(function(v14, v15)
        local v16 = v7.Images[v14.imageKey];
        local _ = nil;
        return l_Roact_0.createElement(l_ImageSetLabel_0, l_Cryo_0.Dictionary.join(l_Cryo_0.Dictionary.join(v14, {
            imageKey = l_Cryo_0.None
        }, if typeof(v16) == "string" then {
            Image = v16
        } else v16, {
            BackgroundTransparency = 1
        }), {
            [l_Roact_0.Ref] = v15
        }));
    end), 
    Button = l_Roact_0.forwardRef(function(v18, v19)
        local v20 = v7.Images[v18.imageKey];
        local _ = nil;
        return l_Roact_0.createElement(l_ImageSetButton_0, l_Cryo_0.Dictionary.join(l_Cryo_0.Dictionary.join(v18, {
            imageKey = l_Cryo_0.None
        }, if typeof(v20) == "string" then {
            Image = v20
        } else v20, {
            BackgroundTransparency = 1
        }), {
            [l_Roact_0.Ref] = v19
        }));
    end)
};

local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameMenu");
local l_Array_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Array;
local v6 = require(script.Parent.Parent.ControlLayoutContainer);
local v7 = require(l_script_FirstAncestor_0.Components.ThemedTextLabel);
local v8 = require(l_script_FirstAncestor_0.Resources.Assets);
local v9 = require(l_script_FirstAncestor_0.Resources.Controls);
local v10 = require(l_CorePackages_0.Workspace.Packages.React);
local v11 = require(l_script_FirstAncestor_0.Localization.withLocalization);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
return function(_)
    return l_Roact_0.createElement(v6, {
        titleText = "CoreScripts.InGameMenu.Controls.GamepadTitle"
    }, {
        GamepadImage = l_Roact_0.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v8.Images.GamepadQuest, 
            Size = UDim2.new(1, 0, 0.6, 0), 
            Position = UDim2.new(0.5, 16.5, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            SizeConstraint = Enum.SizeConstraint.RelativeXX, 
            [v10.Tag] = "data-testid=VRGamepadInstructions"
        }, {
            l_Array_0.map(v9.questGamepadLabels, function(v14, v15)
                return v11({
                    "CoreScripts.InGameMenu.Controls." .. v14.labelKey
                })(function(v16)
                    return l_Roact_0.createElement(v7, {
                        key = v14.labelKey, 
                        fontKey = "Header2", 
                        themeKey = "TextEmphasis", 
                        TextXAlignment = v14.xAlignment or Enum.TextXAlignment.Right, 
                        Size = UDim2.new(v14.width, 0, 0.026, 0), 
                        Text = v16[1], 
                        LayoutOrder = v15, 
                        Position = UDim2.new(v14.xPosition, 0, v14.yPosition, 0), 
                        TextScaled = true
                    });
                end);
            end)
        })
    });
end;

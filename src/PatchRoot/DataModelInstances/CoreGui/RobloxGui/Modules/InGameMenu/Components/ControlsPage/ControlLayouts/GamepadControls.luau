local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_UIBlox_0 = v2.UIBlox;
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v6 = require(script.Parent.Parent.ControlLayoutContainer);
local v7 = require(l_Parent_0.Components.ThemedTextLabel);
local v8 = require(l_Parent_0.Resources.Assets);
local v9 = require(l_Parent_0.Resources.Controls);
local v10 = require(l_CorePackages_0.Workspace.Packages.React);
local v11 = require(l_Parent_0.Localization.withLocalization);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v13 = #v9.gamepadLabels.right * 43 + 62;
local function v19(v14)
    return v11(v14.controls)(function(v15)
        local v16 = {
            ListLayout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 21)
            })
        };
        for v17, v18 in ipairs(v15) do
            v16["controlLabel_" .. v17] = l_Roact_0.createElement(v7, {
                fontKey = "Header2", 
                themeKey = "TextEmphasis", 
                TextXAlignment = v14.TextXAlignment, 
                Size = UDim2.new(0, 1, 0, 22), 
                Text = v18, 
                LayoutOrder = v17
            });
        end;
        return l_Roact_0.createElement("Frame", {
            Position = v14.Position, 
            Size = UDim2.new(0, 0, 1, 0), 
            BackgroundTransparency = 1
        }, v16);
    end);
end;
return function(v20)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v22 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.XBox360 then
        v22 = l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne;
    end;
    return l_Roact_0.createElement(v6, {
        titleText = "CoreScripts.InGameMenu.Controls.GamepadTitle", 
        closeButtonRef = v20.closeButtonRef
    }, {
        GamepadImage = l_Roact_0.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = not not v22 and v8.Images.GamepadXbox or v8.Images.Gamepad, 
            Size = UDim2.new(0, 473, 0, 465), 
            Position = UDim2.new(0.5, 16.5, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            [v10.Tag] = "data-testid=GamepadInstructions"
        }, {
            LeftControlsList = l_Roact_0.createElement(v19, {
                TextXAlignment = Enum.TextXAlignment.Right, 
                Position = UDim2.new(0, -26, 0, 62), 
                controls = v9.gamepadLabels.left
            }), 
            RightControlsList = l_Roact_0.createElement(v19, {
                TextXAlignment = Enum.TextXAlignment.Left, 
                Position = UDim2.new(1, -7, 0, 62), 
                controls = v9.gamepadLabels.right
            }), 
            RightIconsControlslIst = l_Roact_0.createElement(v19, {
                TextXAlignment = Enum.TextXAlignment.Left, 
                Position = UDim2.new(1, 26, 0, v13), 
                controls = v9.gamepadLabels.camera
            })
        })
    });
end;

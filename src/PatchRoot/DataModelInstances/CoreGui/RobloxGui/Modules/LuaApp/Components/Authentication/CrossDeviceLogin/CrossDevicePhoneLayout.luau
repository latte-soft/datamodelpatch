local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Roact);
local v2 = require(l_Modules_0.LuaApp.FitChildren);
return function(v3)
    local l_BaseSize_0 = v3.Style.Font.BaseSize;
    return v1.createFragment({
        Align = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 14), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Icon = not v3.HighKeyboardMode and v3.Icon, 
        WarningText = v3.WarningText, 
        InputArea = v3.InputBox and v1.createElement(v2.FitFrame, {
            Size = UDim2.new(1, 0, 1, 0), 
            fitAxis = v2.FitAxis.Height, 
            LayoutOrder = 3, 
            BackgroundTransparency = 1
        }, {
            Align = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 3), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            InputBox = v3.InputBox, 
            InputWarning = v3.InputWarning
        }), 
        NextButtonWrapper = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_BaseSize_0 * 2), 
            LayoutOrder = 4, 
            BackgroundTransparency = 1
        }, {
            NextButton = v3.ConfirmCodeButton or v3.LoginButton
        }), 
        CancelButton = v3.CancelButton and v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_BaseSize_0 * 2), 
            LayoutOrder = 5, 
            BackgroundTransparency = 1
        }, {
            CancelButton = v3.CancelButton
        })
    });
end;

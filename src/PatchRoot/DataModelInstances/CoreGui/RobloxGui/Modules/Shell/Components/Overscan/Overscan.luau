local l_TextService_0 = game:GetService("TextService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Shell.GlobalSettings);
local v4 = require(l_Modules_0.Shell.LocalizedStrings);
local v5 = require(l_Modules_0.Shell.Utility);
local v6 = require(script.Parent.ControllerHint);
local v7 = require(script.Parent.Edges);
local v8 = require(script.Parent.ButtonHint);
local v9 = v2.Component:extend("Overscan");
v9.render = function(v10)
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 1, 
        BackgroundTransparency = v10.props.BackgroundTransparency, 
        BackgroundColor3 = Color3.new(0.011764705882352941, 0.011764705882352941, 0.011764705882352941)
    }, {
        v2.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BackgroundColor3 = Color3.new(0.011764705882352941, 0.011764705882352941, 0.011764705882352941), 
            BorderSizePixel = 1, 
            Visible = v10.props.ImageVisible, 
            Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/Background.png"
        }); 
        Title = v2.createElement("TextLabel", {
            Position = UDim2.new(0, 230, 0, 205), 
            BackgroundTransparency = 1, 
            Font = v3.LightFont, 
            FontSize = v3.HeaderSize, 
            TextColor3 = v3.WhiteTextColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Text = v4:LocalizedString("ScreenSizeWord")
        }), 
        Prompt = v2.createElement("TextLabel", {
            Position = UDim2.new(0, 230, 0, 243), 
            BackgroundTransparency = 1, 
            Font = v3.RegularFont, 
            FontSize = v3.ButtonSize, 
            TextColor3 = v3.WhiteTextColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Text = v4:LocalizedString("ResizeScreenPrompt")
        }), 
        Controller = v2.createElement(v6), 
        AcceptHint = v2.createElement(v8, {
            Position = UDim2.new(0.5, 25, 0.75, 0), 
            Image = "rbxasset://textures/ui/Shell/ButtonIcons/AButton.png", 
            Text = v4:LocalizedString("AcceptWord")
        }), 
        ResetHint = v2.createElement(v8, {
            Position = UDim2.new(0.5, -90 - l_TextService_0:GetTextSize(v4:LocalizedString("ResetWord"), v5.ConvertFontSizeEnumToInt(v3.ButtonSize), v3.RegularFont, Vector2.new(0, 0)).X, 0.75, 0), 
            Image = "rbxasset://textures/ui/Shell/ButtonIcons/XButton.png", 
            Text = v4:LocalizedString("ResetWord")
        }), 
        EdgeSelector = v2.createElement(v7, {
            onSetEdges = v10.props.onUnmount
        })
    });
end;
return v9;

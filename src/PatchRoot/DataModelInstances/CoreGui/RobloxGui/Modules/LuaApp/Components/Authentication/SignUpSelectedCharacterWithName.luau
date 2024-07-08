local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.Components.Authentication.SignUpCharacter);
local v6 = v2.PureComponent:extend("SignUpSelectedCharacterWithName");
v6.render = function(v7)
    local l_signUpUsername_0 = v7.props.signUpUsername;
    local l_selectedBundleId_0 = v7.props.selectedBundleId;
    return l_withStyle_0(function(v10)
        local l_Font_0 = v10.Font.CaptionHeader.Font;
        local v12 = v10.Font.CaptionHeader.RelativeSize * v10.Font.BaseSize;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1
        }, {
            Username = v2.createElement("TextLabel", {
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Size = UDim2.new(1, 0, 0, v12), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                Text = l_signUpUsername_0, 
                Font = l_Font_0, 
                TextSize = v12, 
                TextColor3 = v10.Theme.TextDefault.Color, 
                TextTransparency = v10.Theme.TextDefault.Transparency, 
                ZIndex = 2
            }), 
            CharacterWrapper = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1
            }, {
                Character = v2.createElement(v5, {
                    bundleId = l_selectedBundleId_0
                })
            })
        });
    end);
end;
return (v3.connect(function(v13, _)
    return {
        signUpUsername = v13.SignUpInfo.SignUpUsername, 
        selectedBundleId = v13.SignUpInfo.SignUpSelectedBundleId
    };
end)(v6));

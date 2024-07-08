local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.UIBlox);
local l_InputBoxWithCharacterCounter_0 = v2.Components.InputBoxWithCharacterCounter;
local v6 = v3.PureComponent:extend("ChatNameInputBox");
v6.defaultProps = {
    initialInputText = "", 
    placeholderText = "(PLACEHOLDER) Name your chat group"
};
v6.render = function(v7)
    return v4.Style.withStyle(function(v8)
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 64), 
            BackgroundTransparency = 1
        }, {
            InputBox = v3.createElement(l_InputBoxWithCharacterCounter_0, {
                initialInputText = v7.props.initialInputText, 
                validInputTextColor3 = Color3.fromRGB(117, 117, 117), 
                validInputTextTransparency = 0, 
                invalidInputTextColor3 = Color3.fromRGB(226, 35, 26), 
                invalidInputTextTransparency = 0, 
                inputTextFont = Enum.Font.Gotham, 
                inputTextColor3 = Color3.fromRGB(25, 25, 25), 
                inputTextSize = 23, 
                inputTextTransparency = 0, 
                placeholderTextTransparency = 0, 
                placeholderTextColor3 = Color3.fromRGB(184, 184, 184), 
                placeholderText = v7.props.placeholderText, 
                clearIconColor3 = Color3.fromRGB(255, 255, 255), 
                clearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-clear-solid.png", 
                characterLimit = 150, 
                style = v8
            })
        });
    end);
end;
return v6;

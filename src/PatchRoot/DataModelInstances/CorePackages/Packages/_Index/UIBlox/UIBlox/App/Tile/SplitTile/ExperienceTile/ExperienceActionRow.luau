local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Parent.React);
local v2 = require(l_Parent_0.Button.Button);
local v3 = require(l_Parent_0.Button.Enum.ButtonType);
local v4 = require(l_Parent_0.ImageSet.Images);
local function v5()
end;
return function(v6)
    local l_isActionable_0 = v6.isActionable;
    local v8 = v6.horizontalPadding or 6;
    local v9 = v6.verticalPadding or 6;
    return v1.createElement(v2, {
        buttonType = v3.PrimaryContextual, 
        text = v6.text, 
        icon = v6.icon or if l_isActionable_0 then v4["icons/common/play"] else v4["icons/status/unavailable"], 
        size = UDim2.new(1, -2 * v8, 0, (v6.height or 48) - 2 * v9), 
        position = UDim2.new(0, v8, 1, -v9 - 36), 
        userInteractionEnabled = l_isActionable_0, 
        onActivated = v6.onPlayPressed or v5, 
        isDisabled = not l_isActionable_0, 
        feedbackType = v6.feedbackType
    });
end;

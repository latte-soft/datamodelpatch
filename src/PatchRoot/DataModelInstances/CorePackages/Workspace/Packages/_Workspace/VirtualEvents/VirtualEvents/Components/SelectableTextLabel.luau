local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local l_useStyle_0 = require(l_script_FirstAncestor_0.Parent.UIBlox).Core.Style.useStyle;
return function(v4)
    local l_BaseSize_0 = l_useStyle_0().Font.BaseSize;
    return v2.createElement("TextBox", v1.Dictionary.join({
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        ClearTextOnFocus = false, 
        Font = v4.fontStyle.Font, 
        TextColor3 = v4.colorStyle.Color, 
        TextEditable = false, 
        TextTransparency = v4.colorStyle.Transparency, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        ClipsDescendants = true
    }, v4, {
        fontStyle = v1.None, 
        colorStyle = v1.None
    }), {
        TextSizeConstraint = v2.createElement("UITextSizeConstraint", {
            MaxTextSize = v4.fontStyle.RelativeSize * l_BaseSize_0, 
            MinTextSize = v4.fontStyle.RelativeMinSize * l_BaseSize_0
        })
    });
end;

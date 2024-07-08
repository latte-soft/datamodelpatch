local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Translations.Translator);
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_0.Core.Style.useStyle);
local function _(v5, v6)
    if not (v6 ~= nil) or v6 == v3.None then
        return v5;
    elseif not v6 then
        return (v2:FormatByKey("CommonUI.Controls.Input.Optional", {
            inputLabel = v5
        }));
    else
        return v5 .. "*";
    end;
end;
return function(v8)
    local l_InputLabel_0 = v4().Tokens.Component.InputLabel;
    local l_Typography_0 = l_InputLabel_0.Base.Typography;
    local l_ContentColor_0 = l_InputLabel_0.Base.ContentColor;
    local l_createElement_0 = v3.createElement;
    local v13 = "TextLabel";
    local v14 = {};
    local l_text_0 = v8.text;
    local l_required_0 = v8.required;
    v14.Text = if not (l_required_0 ~= nil) or l_required_0 == v3.None then l_text_0 else if l_required_0 then l_text_0 .. "*" else v2:FormatByKey("CommonUI.Controls.Input.Optional", {
        inputLabel = l_text_0
    });
    v14.TextTransparency = l_ContentColor_0.Transparency;
    v14.TextXAlignment = Enum.TextXAlignment.Left;
    v14.TextYAlignment = Enum.TextYAlignment.Top;
    v14.TextWrapped = true;
    v14.BackgroundTransparency = 1;
    v14.TextColor3 = l_ContentColor_0.Color3;
    v14.Font = l_Typography_0.Font;
    v14.TextSize = l_Typography_0.FontSize;
    v14.LineHeight = l_Typography_0.LineHeight;
    v14.Size = UDim2.new(1, 0, 0, 0);
    v14.AutomaticSize = Enum.AutomaticSize.Y;
    v14.LayoutOrder = v8.LayoutOrder;
    return l_createElement_0(v13, v14);
end;

local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Parent.Parent.React);
local v2 = require(l_Parent_0.Enum.Emoji);
local v3 = require(l_Parent_0.constants);
local function _(v4)
    if not v2.isEnumValue(v4) then
        return "";
    else
        return v3[v4.rawValue()];
    end;
end;
return function(v6)
    local l_createElement_0 = v1.createElement;
    local v8 = not v6.onActivated and "TextLabel" or "TextButton";
    local v9 = {
        Size = UDim2.fromScale(0, 1)
    };
    local l_emoji_0 = v6.emoji;
    v9.Text = not v2.isEnumValue(l_emoji_0) and "" or v3[l_emoji_0.rawValue()];
    v9.TextColor3 = Color3.fromHex("#fff");
    v9.AutomaticSize = Enum.AutomaticSize.X;
    v9.Font = v6.textFont;
    v9.TextSize = v6.textSize;
    v9.Position = v6.Position;
    v9.BackgroundTransparency = 1;
    v9[v1.Event.Activated] = v6.onActivated;
    return l_createElement_0(v8, v9);
end;

local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_TextService_0 = game:GetService("TextService");
local v4 = require(l_script_FirstAncestor_0.BubbleChat.Helpers.getAbsolutePaddingbyDimension);
local v5 = require(l_script_FirstAncestor_0.Flags.getFFlagReplicateUIPaddingChildProperties);
local function v13(v6, v7)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Enabled = false;
    l_ScreenGui_0.Name = "RichTextSizingLabel";
    l_ScreenGui_0.Parent = l_CoreGui_0;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.RichText = true;
    l_TextLabel_0.Parent = l_ScreenGui_0;
    l_TextLabel_0.Text = v6;
    l_TextLabel_0.TextSize = v7.TextSize;
    if not v7.FontFace then
        l_TextLabel_0.Font = v7.Font;
    else
        l_TextLabel_0.FontFace = v7.FontFace;
    end;
    l_TextLabel_0.Size = UDim2.fromOffset(v7.MaxWidth, 10000);
    local l_TextBounds_0 = l_TextLabel_0.TextBounds;
    l_ScreenGui_0:Destroy();
    local v11 = nil;
    if not v5() or not v7.UIPadding then
        local l_Padding_0 = v7.Padding;
        v11 = Vector2.new(l_Padding_0 * 4, l_Padding_0 * 2);
    else
        v11 = Vector2.new((v4(v7.UIPadding.PaddingLeft, l_TextBounds_0.X) + v4(v7.UIPadding.PaddingRight, l_TextBounds_0.X)) * 2, v4(v7.UIPadding.PaddingTop, l_TextBounds_0.Y) + v4(v7.UIPadding.PaddingBottom, l_TextBounds_0.Y));
    end;
    return v11 + l_TextBounds_0;
end;
return function(v14, v15, v16)
    if v16 == nil then
        v16 = l_TextChatService_0;
    end;
    if v16.ChatVersion == Enum.ChatVersion.TextChatService then
        return (v13(v14, v15));
    else
        return l_TextService_0:GetTextSize(v14, v15.TextSize, v15.Font, Vector2.new(v15.MaxWidth, 10000)) + Vector2.new(v15.Padding * 4, v15.Padding * 2);
    end;
end;

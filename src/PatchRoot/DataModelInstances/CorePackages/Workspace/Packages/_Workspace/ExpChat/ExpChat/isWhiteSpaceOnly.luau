local l_TextLabel_0 = Instance.new("TextLabel");
l_TextLabel_0.RichText = true;
local function _(v1)
    l_TextLabel_0.Text = v1;
    return l_TextLabel_0.ContentText;
end;
return function(v3)
    l_TextLabel_0.Text = v3;
    return string.find(l_TextLabel_0.ContentText, "%S") == nil;
end;

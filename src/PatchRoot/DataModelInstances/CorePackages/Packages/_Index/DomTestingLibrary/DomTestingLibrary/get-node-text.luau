local v0 = {};
local function v2(v1)
    return v1.Text;
end;
local function _(v3)
    if not pcall(v2, v3) or v3:IsA("TextBox") then
        return "";
    else
        return v3.Text;
    end;
end;
v0.getNodeText = function(v5)
    if not pcall(v2, v5) or v5:IsA("TextBox") then
        return "";
    else
        return v5.Text;
    end;
end;
return v0;

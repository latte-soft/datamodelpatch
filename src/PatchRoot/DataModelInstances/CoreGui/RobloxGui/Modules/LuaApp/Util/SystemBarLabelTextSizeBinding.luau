local l_TextService_0 = game:GetService("TextService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_GetUIBloxEnableFontNameMapping_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetUIBloxEnableFontNameMapping;
local v4 = game:DefineFastFlag("BuilderSansNavbarLabelsFix2", false);
local v5 = game:DefineFastFlag("BuilderSansNavbarFlagSize", false);
local v6 = game:DefineFastInt("BuilderSansNavBarMinSize", 10.08);
local v7 = game:DefineFastInt("BuilderSansNavBarMaxSize", 13.86);
local v8 = if (not not v4 and v5) and l_GetUIBloxEnableFontNameMapping_0() then v6 else 10.08;
local v9 = if not not v4 and l_GetUIBloxEnableFontNameMapping_0() then if (not not v4 and v5) and l_GetUIBloxEnableFontNameMapping_0() then v7 else 12.6 else 10;
local v10 = if not not v4 and l_GetUIBloxEnableFontNameMapping_0() then v8 else 8;
local v11 = {};
v11.__index = v11;
v11.new = function()
    local v12, v13 = v2.createBinding(v9);
    return (setmetatable({
        _textSize = v12, 
        _setTextSize = v13
    }, v11));
end;
v11.getBinding = function(v14)
    return v14._textSize;
end;
v11.getMinTextSize = function(v15, v16, v17, v18)
    local v19 = v15._textSize:getValue();
    local v20 = Vector2.new(2147483647, v18.Y);
    local v21 = Vector2.new(2147483647, v18.Y);
    while v10 < v19 and v18.X < v21.X do
        v21 = l_TextService_0:GetTextSize(v16, v19, v17, v20);
        if v18.X < v21.X then
            v19 = v19 - 1;
        end;
    end;
    if v19 < v15._textSize:getValue() then
        v15._setTextSize(v19);
    end;
    return v19;
end;
v11.default = v11.new();
return v11;

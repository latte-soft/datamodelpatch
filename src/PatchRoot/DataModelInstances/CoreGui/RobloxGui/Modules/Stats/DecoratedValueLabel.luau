local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(l_CoreGui_0.RobloxGui.Modules.Stats.StatsUtils);
local v2 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
LocalizedGetKey = function(v3)
    local l_v3_0 = v3;
    pcall(function()
        l_v3_0 = v2:FormatByKey(v3);
    end);
    return l_v3_0;
end;
local l_status_0, l_result_0 = pcall(function()
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v7 = l_status_0 and l_result_0;
local v8 = {};
v8.__index = v8;
v8.new = function(v9, v10)
    local v11 = {};
    setmetatable(v11, v8);
    v11._frame = Instance.new("Frame");
    v11._frame.Name = "PS_DecoratedValueLabel";
    v11._frame.BackgroundTransparency = 1;
    if v7 == true then
        v11._valueName = LocalizedGetKey(v10);
    else
        v11._valueName = v10;
    end;
    v11._statType = v9;
    v11._decorationFrame = Instance.new("Frame");
    v11._decorationFrame.Name = "PS_Decoration";
    v11._decorationFrame.Parent = v11._frame;
    v11._decorationFrame.Position = UDim2.new(0, 0, 0.5, -v1.DecorationSize / 2);
    v11._decorationFrame.Size = UDim2.new(0, v1.DecorationSize, 0, v1.DecorationSize);
    v11._decorationFrame.BackgroundTransparency = 1;
    v11._label = Instance.new("TextLabel");
    v11._label.Name = "Label";
    v11._label.Parent = v11._frame;
    v11._label.Position = UDim2.new(0, v1.DecorationSize + v1.DecorationMargin, 0, 0);
    v11._label.Size = UDim2.new(1, -(v1.DecorationSize + v1.DecorationMargin), 1, 0);
    v11._label.FontSize = v1.PanelValueFontSize;
    v11._label.TextXAlignment = Enum.TextXAlignment.Left;
    v11._label.TextYAlignment = Enum.TextYAlignment.Center;
    v1.StyleTextWidget(v11._label);
    return v11;
end;
v8.SetZIndex = function(v12, v13)
    v12._frame.ZIndex = v13;
    v12._decorationFrame.ZIndex = v13;
    v12._label.ZIndex = v13;
end;
v8.PlaceInParent = function(v14, v15, v16, v17)
    v14._frame.Parent = v15;
    v14._frame.Size = v16;
    v14._frame.Position = v17;
end;
v8.GetDecorationFrame = function(v18)
    return v18._decorationFrame;
end;
v8.SetValue = function(v19, v20)
    v19._label.Text = string.format("%s: %s", v19._valueName, (v1.FormatTypedValue(v20, v19._statType)));
end;
return v8;

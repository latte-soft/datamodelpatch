local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(script.Parent.Parent.Constants);
local l_MainWindowHeader_0 = v3.Font.MainWindowHeader;
local l_MainWindowHeader_1 = v3.DefaultFontSize.MainWindowHeader;
local l_Text_0 = v3.Color.Text;
local l_UnselectedGray_0 = v3.Color.UnselectedGray;
return function(v8)
    local l_text_0 = v8.text;
    local l_size_0 = v8.size;
    local l_pos_0 = v8.pos;
    local _ = v8.onClicked;
    return v2.createElement("TextButton", {
        Text = l_text_0, 
        TextSize = l_MainWindowHeader_1, 
        TextColor3 = l_Text_0, 
        Font = l_MainWindowHeader_0, 
        Size = l_size_0, 
        Position = l_pos_0, 
        AutoButtonColor = true, 
        BackgroundColor3 = l_UnselectedGray_0, 
        BackgroundTransparency = 0, 
        [v2.Event.Activated] = v1.useCallback(function()
            v8.onClicked(v8.text);
        end, {
            v8.onClicked, 
            v8.text
        })
    });
end;

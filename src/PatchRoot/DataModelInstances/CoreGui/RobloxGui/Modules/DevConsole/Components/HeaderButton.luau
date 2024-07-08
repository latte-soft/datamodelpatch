local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.Parent.Constants);
local l_MainWindowHeader_0 = v1.Font.MainWindowHeader;
local l_MainWindowHeader_1 = v1.DefaultFontSize.MainWindowHeader;
local l_Text_0 = v1.Color.Text;
return function(v5)
    local l_text_0 = v5.text;
    local l_size_0 = v5.size;
    local l_pos_0 = v5.pos;
    local l_sortfunction_0 = v5.sortfunction;
    return v0.createElement("TextButton", {
        Text = l_text_0, 
        TextSize = l_MainWindowHeader_1, 
        TextColor3 = l_Text_0, 
        Font = l_MainWindowHeader_0, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Size = l_size_0, 
        Position = l_pos_0, 
        BackgroundTransparency = 1, 
        [v0.Event.Activated] = function()
            if l_sortfunction_0 then
                l_sortfunction_0(l_text_0);
            end;
        end
    });
end;

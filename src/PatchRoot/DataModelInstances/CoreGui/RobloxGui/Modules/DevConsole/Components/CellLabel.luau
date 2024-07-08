local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.Parent.Constants);
local l_MainWindow_0 = v1.DefaultFontSize.MainWindow;
local l_Text_0 = v1.Color.Text;
local l_MainWindow_1 = v1.Font.MainWindow;
local l_MainWindowBold_0 = v1.Font.MainWindowBold;
return function(v6)
    return v0.createElement("TextLabel", {
        Text = v6.text, 
        TextSize = l_MainWindow_0, 
        TextColor3 = l_Text_0, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextWrapped = true, 
        Font = not not v6.bold and l_MainWindowBold_0 or l_MainWindow_1, 
        Size = v6.size, 
        Position = v6.pos, 
        BackgroundTransparency = 1, 
        LayoutOrder = v6.layoutOrder, 
        RichText = v6.richText
    });
end;

local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(script.Parent.Parent.Constants);
local l_MainWindowHeader_0 = v4.Font.MainWindowHeader;
local l_MainWindowHeader_1 = v4.DefaultFontSize.MainWindowHeader;
local l_Text_0 = v4.Color.Text;
local l_UnselectedGray_0 = v4.Color.UnselectedGray;
local l_Padding_0 = v4.Tooltip.Padding;
local l_Offset_0 = v4.Tooltip.Offset;
local l_MaxWidth_0 = v4.Tooltip.MaxWidth;
local l_Delay_0 = v4.Tooltip.Delay;
return function(v13)
    local v14, v15 = v2.useState(false);
    local l_text_0 = v13.text;
    local l_pos_0 = v13.pos;
    v2.useEffect(function()
        v15(false);
        local v18 = false;
        task.delay(l_Delay_0, function()
            if not v18 then
                v15(true);
                return ;
            else
                return ;
            end;
        end);
        return function()
            v18 = true;
        end;
    end, {
        l_text_0, 
        l_pos_0
    });
    return v3.createElement(v3.Portal, {
        target = l_CoreGui_0
    }, {
        TooltipContainer = v3.createElement("ScreenGui", {
            DisplayOrder = 20, 
            IgnoreGuiInset = true, 
            OnTopOfCoreBlur = true, 
            Enabled = v14
        }, {
            Tooltip = v3.createElement("TextLabel", {
                Text = l_text_0, 
                TextSize = l_MainWindowHeader_1, 
                TextColor3 = l_Text_0, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Font = l_MainWindowHeader_0, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Position = l_pos_0 + l_Offset_0, 
                BackgroundColor3 = l_UnselectedGray_0, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0
            }, {
                Padding = v3.createElement("UIPadding", {
                    PaddingTop = l_Padding_0, 
                    PaddingBottom = l_Padding_0, 
                    PaddingLeft = l_Padding_0, 
                    PaddingRight = l_Padding_0
                }), 
                SizeConstraint = v3.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(l_MaxWidth_0, math.huge)
                })
            })
        })
    });
end;

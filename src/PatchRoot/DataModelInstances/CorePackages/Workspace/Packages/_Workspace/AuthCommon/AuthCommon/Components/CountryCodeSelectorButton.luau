local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.Roact);
local l_AppFonts_0 = require(l_Parent_0.Style).AppFonts;
local l_Colors_0 = require(l_Parent_0.Style).Colors;
local l_White_0 = l_Colors_0.White;
local l_Gray2_0 = l_Colors_0.Gray2;
local v6 = v1.PureComponent:extend("CountryCodeSelectorButton");
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
v6.init = function(v8)
    v8.selectionCallback = function()
        if v8.props.ListButtonProps.SelectionCallback then
            v8.props.ListButtonProps.SelectionCallback(v8.props.Data);
        end;
    end;
end;
v6.render = function(v9)
    local v10 = v9.props.Data.localizedName or "";
    local v11 = "+" .. (v9.props.Data.prefix or "");
    local l_TextSize_0 = v9.props.ListButtonProps.TextSize;
    return v1.createElement("TextButton", {
        Size = v9.props.Size, 
        BackgroundTransparency = 1, 
        LayoutOrder = v9.props.LayoutOrder, 
        Text = "", 
        [v1.Event.Activated] = v9.selectionCallback
    }, {
        CountryName = v1.createElement("TextLabel", {
            Size = UDim2.new(1, -l_Text_0.GetTextWidth(v11, l_AppFonts_0.default:getDefault(), l_TextSize_0), 1, 0), 
            Text = v10, 
            BackgroundTransparency = 1, 
            Font = l_AppFonts_0.default:getDefault(), 
            TextColor3 = l_White_0, 
            TextSize = l_TextSize_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), 
        CountryPrefix = v1.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            Text = v11, 
            BackgroundTransparency = 1, 
            Font = l_AppFonts_0.default:getDefault(), 
            TextColor3 = l_Gray2_0, 
            TextSize = l_TextSize_0, 
            TextXAlignment = Enum.TextXAlignment.Right
        })
    });
end;
return v6;

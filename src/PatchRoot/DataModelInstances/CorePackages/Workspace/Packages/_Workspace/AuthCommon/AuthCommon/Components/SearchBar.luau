local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_AppFonts_0 = require(l_Parent_0.Style).AppFonts;
local v2 = require(l_Parent_0.Roact);
local l_ImageSetLabel_0 = require(l_Parent_0.UIBlox).Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_Parent_0.RobloxAppAssets).GetImageData;
local v5 = v2.PureComponent:extend("LoginSearchBar");
v5.init = function(v6)
    v6.state = {
        longText = false
    };
    v6.lastInput = 0;
    v6.searchTextChanged = function(v7)
        local v8 = v7.AbsoluteSize.X < v7.TextBounds.X;
        if v8 ~= v6.state.longText then
            v7.TextXAlignment = not not v8 and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left;
            spawn(function()
                v6:setState({
                    longText = v8
                });
            end);
        end;
        if v6.props.TextChanged then
            v6.lastInput = v6.lastInput + 1;
            local l_lastInput_0 = v6.lastInput;
            wait(0.3);
            if l_lastInput_0 == v6.lastInput then
                v6.props.TextChanged(v7);
            end;
        end;
    end;
end;
v5.render = function(v10)
    local l_Offset_0 = v10.props.Size.Y.Offset;
    local l_IconSize_0 = v10.props.IconSize;
    local l_TextSize_0 = v10.props.TextSize;
    local l_PlaceholderText_0 = v10.props.PlaceholderText;
    local l_PlaceholderColor3_0 = v10.props.PlaceholderColor3;
    local l_Text_0 = v10.props.Text;
    local l_TextColor3_0 = v10.props.TextColor3;
    return v2.createElement(l_ImageSetLabel_0, {
        Size = v10.props.Size, 
        Position = v10.props.Position, 
        BackgroundTransparency = 1, 
        Image = l_GetImageData_0("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill", 
        ImageColor3 = v10.props.ImageColor3, 
        BorderSizePixel = 0, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 9, 9)
    }, {
        SearchIcon = v2.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, l_IconSize_0, 0, l_IconSize_0), 
            Position = UDim2.new(0, l_Offset_0 * 0.5, 0, l_Offset_0 * 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Image = l_GetImageData_0("LuaApp/icons/ic-search-new") or "LuaApp/icons/ic-search-new", 
            BackgroundTransparency = 1, 
            ImageColor3 = l_TextColor3_0
        }), 
        SearchInput = v2.createElement("TextBox", {
            Size = UDim2.new(1, -l_Offset_0 - 10, 1, 0), 
            Position = UDim2.new(0, l_Offset_0, 0, 0), 
            TextSize = l_TextSize_0, 
            TextColor3 = l_TextColor3_0, 
            PlaceholderText = l_PlaceholderText_0, 
            PlaceholderColor3 = l_PlaceholderColor3_0, 
            Font = l_AppFonts_0.default:getDefault(), 
            TextXAlignment = not not v10.state.longText and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1, 
            Text = l_Text_0, 
            ClearTextOnFocus = false, 
            ClipsDescendants = true, 
            [v2.Change.Text] = v10.searchTextChanged
        })
    });
end;
return v5;

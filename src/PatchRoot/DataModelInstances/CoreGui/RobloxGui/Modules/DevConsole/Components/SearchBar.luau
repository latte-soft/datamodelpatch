local v0 = require(game:GetService("CorePackages").Roact);
local v1 = require(script.Parent.ScrollingTextBox);
local v2 = require(script.Parent.Parent.Constants);
local v3 = v0.Component:extend("SearchBar");
v3.render = function(v4)
    local l_size_0 = v4.props.size;
    local l_pos_0 = v4.props.pos;
    local l_frameHeight_0 = v4.props.frameHeight;
    local l_textSize_0 = v4.props.textSize;
    local l_font_0 = v4.props.font;
    local l_searchTerm_0 = v4.props.searchTerm;
    local l_layoutOrder_0 = v4.props.layoutOrder;
    local l_visible_0 = v4.props.visible;
    local l_showClear_0 = v4.props.showClear;
    local v14 = l_frameHeight_0 * 0.6;
    return v0.createElement("Frame", {
        Size = l_size_0, 
        Position = l_pos_0, 
        BackgroundColor3 = v2.Color.UnselectedGray, 
        BorderColor3 = v2.Color.BorderGray, 
        Visible = l_visible_0, 
        LayoutOrder = l_layoutOrder_0
    }, {
        SearchImage = v0.createElement("ImageLabel", {
            Name = "SearchIcon", 
            Size = UDim2.new(0, v14, 0, v14), 
            Position = UDim2.new(0, 10, 0.5, -v14 / 2), 
            BackgroundTransparency = 1, 
            Image = v2.Image.Search
        }), 
        ClearButton = l_showClear_0 and v0.createElement("ImageButton", {
            Size = UDim2.new(0, -v14, 0, v14), 
            Position = UDim2.new(1, -10, 0.5, -v14 / 2), 
            BackgroundTransparency = 1, 
            Image = v2.Image.Clear, 
            [v0.Event.InputEnded] = v4.props.cancelInput
        }), 
        InputField = v0.createElement(v1, {
            Text = not not l_searchTerm_0 and l_searchTerm_0 or "", 
            TextSize = l_textSize_0, 
            Font = l_font_0, 
            Size = UDim2.new(1, -(2 * l_frameHeight_0), 1, 0), 
            Position = UDim2.new(0, 20 + v14, 0, 0), 
            ShowNativeInput = true, 
            TextColor3 = v2.Color.Text, 
            BackgroundTransparency = 1, 
            TextXAlignment = 0, 
            ClearTextOnFocus = false, 
            PlaceholderText = "Search", 
            [v0.Ref] = v4.props.refForParent, 
            TextBoxFocusLost = v4.props.focusLost
        })
    });
end;
return v3;

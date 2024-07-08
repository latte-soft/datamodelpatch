local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.EmojiList);
local v3 = require(l_script_FirstAncestor_0.Config);
return function(v4)
    local l_createElement_0 = v1.createElement;
    local v6 = "Frame";
    local v7 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, v3.AutocompleteEntryDefaultSizeY), 
        BackgroundTransparency = 1, 
        LayoutOrder = v4.layoutOrder, 
        ZIndex = 2, 
        [v1.Event.MouseEnter] = v4.onAutocompleteDropdownHover
    };
    local v8 = {};
    local l_createElement_1 = v1.createElement;
    local v10 = "TextButton";
    local v11 = {
        Size = UDim2.new(1, 0, 1, not v4.isDividerVisible and 0 or -1), 
        BackgroundTransparency = v4.setTransparency(v4.layoutOrder == v4.selectedIndex and v3.AutocompleteSelectedTransparency or 1, v4.transparencyValue), 
        BackgroundColor3 = v4.layoutOrder == v4.selectedIndex and v3.AutocompleteSelectedColor or nil, 
        Text = "", 
        ZIndex = 3, 
        [v1.Event.Activated] = v4.onAutocompleteSelected
    };
    local v12 = {
        UIPadding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 15), 
            PaddingRight = UDim.new(0, 30), 
            PaddingTop = UDim.new(0, 8), 
            PaddingBottom = UDim.new(0, 8)
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    local v13 = false;
    if v4.autocompleteType == "emojis" then
        v13 = v1.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            FontFace = v4.chatInputBarSettings.FontFace, 
            RichText = true, 
            Size = UDim2.new(0, 0, 0, 0), 
            Text = string.format("%s", v2[v4.result].base), 
            TextColor3 = v4.chatInputBarSettings.TextColor3, 
            TextSize = v4.chatInputBarSettings.TextSize, 
            TextStrokeColor3 = v4.chatInputBarSettings.TextStrokeColor3, 
            TextStrokeTransparency = v4.setTransparency(v4.chatInputBarSettings.TextStrokeTransparency, v4.transparencyValue), 
            TextTransparency = v4.setTransparency(0, v4.transparencyValue), 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 1, 
            ZIndex = 2
        });
    end;
    v12.EmojiLabel = v13;
    v13 = false;
    if v4.autocompleteType == "emojis" then
        v13 = v1.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            FontFace = v4.chatInputBarSettings.FontFace, 
            RichText = true, 
            Size = UDim2.new(0, 0, 0, 0), 
            Text = "  ", 
            TextColor3 = v4.chatInputBarSettings.TextColor3, 
            TextSize = 14, 
            TextStrokeColor3 = v4.chatInputBarSettings.TextStrokeColor3, 
            TextStrokeTransparency = v4.setTransparency(v4.chatInputBarSettings.TextStrokeTransparency, v4.transparencyValue), 
            TextTransparency = v4.setTransparency(0, v4.transparencyValue), 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 2, 
            ZIndex = 2
        });
    end;
    v12.SpaceLabel = v13;
    v12.TextLabel = v1.createElement("TextLabel", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        FontFace = v4.chatInputBarSettings.FontFace, 
        RichText = true, 
        Size = UDim2.new(0, 0, 0, 0), 
        Text = string.format("%s", v4.result), 
        TextColor3 = v4.chatInputBarSettings.TextColor3, 
        TextSize = v4.chatInputBarSettings.TextSize, 
        TextStrokeColor3 = v4.chatInputBarSettings.TextStrokeColor3, 
        TextStrokeTransparency = v4.setTransparency(v4.chatInputBarSettings.TextStrokeTransparency, v4.transparencyValue), 
        TextTransparency = v4.setTransparency(0, v4.transparencyValue), 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        LayoutOrder = 3, 
        ZIndex = 2
    });
    v8.TextLabelButton = l_createElement_1(v10, v11, v12);
    v8.Divider = not not v4.isDividerVisible and v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 1), 
        Position = UDim2.new(0, 0, 1, 0), 
        AnchorPoint = Vector2.new(0, 1), 
        BackgroundTransparency = v4.setTransparency(v3.ChatInputBarBorderTransparency, v4.transparencyValue), 
        BackgroundColor3 = v3.ChatInputBarBorderColor3, 
        BorderSizePixel = 0, 
        ZIndex = 2
    }) or nil;
    return l_createElement_0(v6, v7, v8);
end;

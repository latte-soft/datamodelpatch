local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local l_UIBlox_0 = v0.UIBlox;
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.GlobalConfig);
local v6 = require(l_Parent_0.Components.ThemedTextLabel);
local l_KeyLabel_0 = l_UIBlox_0.App.Menu.KeyLabel;
local v8 = require(l_Parent_0.Components.PointerLabel);
local v9 = require(l_Parent_0.Components.Divider);
local v10 = require(l_Parent_0.Localization.withLocalization);
local v11 = l_t_0.strictInterface({
    actionDescription = l_t_0.string, 
    inputs = l_t_0.table, 
    isList = l_t_0.optional(l_t_0.boolean), 
    hasDivider = l_t_0.boolean, 
    LayoutOrder = l_t_0.integer
});
local function v15(v12, v13, v14)
    return l_Roact_0.createElement(v6, {
        themeKey = "TextEmphasis", 
        fontKey = "Header1", 
        Text = v12, 
        Size = not not v14 and UDim2.new(0, 19, 0, 24) or UDim2.new(0, 19, 0, 16), 
        TextYAlignment = v14 and Enum.TextYAlignment.Bottom, 
        LayoutOrder = v13
    });
end;
local function v18(v16, v17)
    if v16.EnumType == Enum.KeyCode then
        return l_Roact_0.createElement(l_KeyLabel_0, {
            keyCode = v16, 
            textThemeKey = "TextEmphasis", 
            LayoutOrder = v17
        });
    else
        return l_Roact_0.createElement(v8, {
            input = v16, 
            LayoutOrder = v17
        });
    end;
end;
local function v28(v19, v20)
    local v21 = {
        ListLayout = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v20 and 0 or 7)
        })
    };
    local v22 = 1;
    for v23, v24 in ipairs(v19) do
        if typeof(v24) ~= "table" then
            v21["input" .. v23] = v18(v24, v22);
            v22 = v22 + 1;
            if v20 and v23 == #v19 then
                v21.Elipses = v15("...", v22, true);
            end;
        else
            for v25, v26 in ipairs(v24) do
                local v27 = string.format("%d_%d", v23, v25);
                v21["groupedInput" .. v27] = v18(v26, v22);
                v22 = v22 + 1;
                if v25 < #v24 then
                    v21["groupedDivider" .. v27] = v15("+", v22);
                    v22 = v22 + 1;
                end;
            end;
        end;
        if not v20 and v23 < #v19 then
            v21["divider" .. v23] = v15("/", v22);
            v22 = v22 + 1;
        end;
    end;
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 0, 1, 0), 
        Position = UDim2.new(1, 0, 0, 0)
    }, v21);
end;
return function(v29)
    if v5.propValidation then
        assert(v11(v29));
    end;
    return v10({
        actionDescription = v29.actionDescription
    })(function(v30)
        return l_Roact_0.createElement("Frame", {
            LayoutOrder = v29.LayoutOrder, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 50)
        }, {
            ActionLabel = l_Roact_0.createElement(v6, {
                fontKey = "Header2", 
                themeKey = "TextEmphasis", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Size = UDim2.new(0, 200, 0, 22), 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                Text = v30.actionDescription
            }), 
            Divider = v29.hasDivider and l_Roact_0.createElement(v9, {
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.new(0, 0, 1, -1)
            }), 
            Inputs = v28(v29.inputs, v29.isList)
        });
    end);
end;

local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_useStyle_0 = v1.UIBlox.Core.Style.useStyle;
local _ = require(l_Parent_0.type);
local l_React_0 = v1.React;
local v6 = {
    highlight = function(v5)
        return "<b>" .. v5 .. "</b>";
    end
};
local function v25(v7)
    local l_text_0 = v7.text;
    local l_styledElements_0 = v7.styledElements;
    local v10 = {
        {
            Position = 0, 
            ReferenceCount = 0, 
            Format = "highlight"
        }, 
        {
            Position = #v7.text, 
            ReferenceCount = 0, 
            Format = "highlight"
        }
    };
    if l_styledElements_0 then
        for _, v12 in pairs(l_styledElements_0) do
            table.insert(v10, {
                Position = v12.offset, 
                ReferenceCount = 1, 
                Format = v12.styledElementType
            });
            table.insert(v10, {
                Position = v12.offset + v12.length, 
                ReferenceCount = -1, 
                Format = v12.styledElementType
            });
        end;
    end;
    table.sort(v10, function(v13, v14)
        return v13.Position < v14.Position;
    end);
    local v15 = {};
    for v16 in pairs(v6) do
        v15[v16] = 0;
    end;
    local v17 = "";
    for v18 = 1, #v10 - 1 do
        local v19 = v10[v18];
        local v20 = v10[v18 + 1];
        if v19.Format then
            local l_Format_0 = v19.Format;
            v15[l_Format_0] = v15[l_Format_0] + v19.ReferenceCount;
        end;
        if v19.Position ~= v20.Position then
            local v22 = l_text_0:sub(v19.Position + 1, v20.Position);
            for v23, v24 in pairs(v6) do
                if v15[v23] > 0 then
                    v22 = v24(v22);
                end;
            end;
            v17 = v17 .. v22;
        end;
    end;
    return v17;
end;
return function(v26)
    local v27 = l_useStyle_0();
    return l_React_0.createElement("TextLabel", {
        RichText = true, 
        Text = not v26.Text and "" or v25(v26.Text), 
        BackgroundTransparency = 1, 
        TextColor3 = v26.TextColor3 or v27.Theme.TextDefault.Color, 
        TextTransparency = v26.TextTransparency or v27.Theme.TextDefault.Transparency, 
        Font = v26.Font or v27.Font.Body.Font, 
        AutomaticSize = v26.AutomaticSize, 
        Size = v26.Size, 
        TextSize = v26.TextSize, 
        Position = v26.Position, 
        AnchorPoint = v26.AnchorPoint, 
        TextXAlignment = v26.TextXAlignment, 
        TextWrapped = true
    });
end;

local l_Parent_0 = script:FindFirstAncestor("NotificationsCommon").Parent;
local l_Parent_1 = script.Parent.Parent;
local v2 = require(l_Parent_1.dependencies);
local l_useStyle_0 = v2.UIBlox.Core.Style.useStyle;
local _ = require(l_Parent_1.type);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_React_0 = v2.React;
local v9 = {
    highlight = function(v7)
        return "<b>" .. v7 .. "</b>";
    end, 
    warning = function(v8)
        return "<b>" .. v8 .. "</b>";
    end
};
utf8Sub = function(v10, v11, v12)
    local v13 = utf8.offset(v10, v11);
    local v14 = utf8.offset(v10, v12 + 1);
    if not (v13 ~= nil) or v14 == nil then
        return (string.sub(v10, v11, v12));
    else
        return (string.sub(v10, v13, v14 - 1));
    end;
end;
local function v33(v15)
    local v16 = v15.text .. " ";
    local l_styledElements_0 = v15.styledElements;
    local v18 = {
        {
            Position = 0, 
            ReferenceCount = 0, 
            Format = "highlight"
        }, 
        {
            Position = utf8.len(v15.text), 
            ReferenceCount = 0, 
            Format = "highlight"
        }
    };
    if l_styledElements_0 then
        for _, v20 in pairs(l_styledElements_0) do
            table.insert(v18, {
                Position = v20.offset, 
                ReferenceCount = 1, 
                Format = v20.styledElementType
            });
            table.insert(v18, {
                Position = v20.offset + v20.length, 
                ReferenceCount = -1, 
                Format = v20.styledElementType
            });
        end;
    end;
    table.sort(v18, function(v21, v22)
        return v21.Position < v22.Position;
    end);
    local v23 = {};
    for v24 in pairs(v9) do
        v23[v24] = 0;
    end;
    local v25 = "";
    for v26 = 1, #v18 - 1 do
        local v27 = v18[v26];
        local v28 = v18[v26 + 1];
        if v27.Format then
            local l_Format_0 = v27.Format;
            v23[l_Format_0] = v23[l_Format_0] + v27.ReferenceCount;
        end;
        if v27.Position ~= v28.Position then
            local v30 = utf8Sub(v16, v27.Position + 1, v28.Position);
            for v31, v32 in pairs(v9) do
                if v23[v31] > 0 then
                    v30 = v32(v30);
                end;
            end;
            v25 = v25 .. v30;
        end;
    end;
    return l_Text_0.Trim(v25);
end;
return function(v34)
    local v35 = l_useStyle_0();
    return l_React_0.createElement("TextLabel", {
        RichText = true, 
        Text = not v34.Text and "" or v33(v34.Text), 
        BackgroundTransparency = 1, 
        TextColor3 = v34.TextColor3 or v35.Theme.TextDefault.Color, 
        TextTransparency = v34.TextTransparency or v35.Theme.TextDefault.Transparency, 
        Font = v34.Font or v35.Font.Body.Font, 
        AutomaticSize = v34.AutomaticSize, 
        Size = v34.Size, 
        TextSize = v34.TextSize, 
        Position = v34.Position, 
        AnchorPoint = v34.AnchorPoint, 
        TextXAlignment = v34.TextXAlignment, 
        TextWrapped = true, 
        LayoutOrder = v34.LayoutOrder
    });
end;

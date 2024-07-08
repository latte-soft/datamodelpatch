local l_TextService_0 = game:GetService("TextService");
local v1 = require(script.Parent.CleanRichTextTags);
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.UIBloxConfig);
local v4 = require(l_Parent_0.Logger);
local v5 = Vector2.new(2, 2);
return function(v6, v7, v8, v9, v10)
    if not v3.useGetTextBoundsAsync then
        if not (not v3.ignoreRichTextTagsForTextSizeCalculation or not v10) then
            v6 = v1(v6);
        end;
        return l_TextService_0:GetTextSize(v6, v7, v8, v9) + v5;
    else
        if not (not v3.ignoreRichTextTagsForTextSizeCalculation or not v10) then
            v6 = v1(v6);
        end;
        local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
        l_GetTextBoundsParams_0.Font = Font.fromEnum(v8);
        l_GetTextBoundsParams_0.Size = v7;
        l_GetTextBoundsParams_0.Text = v6;
        l_GetTextBoundsParams_0.Width = v9.X;
        local l_status_0, l_result_0 = pcall(function()
            return l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
        end);
        if not l_status_0 then
            v4:warning("GetTextBoundsAsync call failed, falling back to frame size. Error: ", l_result_0);
            return v9;
        else
            return Vector2.new(l_result_0.X, (math.min(l_result_0.Y, v9.Y))) + v5;
        end;
    end;
end;

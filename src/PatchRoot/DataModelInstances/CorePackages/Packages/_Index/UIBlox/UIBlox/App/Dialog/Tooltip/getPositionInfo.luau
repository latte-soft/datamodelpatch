local v0 = require(script.Parent.Enum.TooltipOrientation);
return function(v1, v2, v3, v4, v5, v6, v7)
    local v8 = {};
    local v9 = v4 + v5 * 0.5;
    local v10 = v4 + v5;
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = 0;
    local v16 = 0;
    if not (v3 ~= v0.Bottom) or v3 == v0.Top then
        if not v7 and v6.Y - v10.Y < (v2 + 8) + 12 then
            v3 = v0.Top;
        end;
        v11 = math.clamp(v9.X - v1 * 0.5, 12, (v6.X - 12) - v1);
        v13 = v11 - v4.X;
        local _ = nil;
        local v18 = (v1 - 12) - 16;
        if v1 < 40 then
            v8.caretPosition = UDim2.fromScale(0.5, 0);
        elseif not v7 then
            if v9.X - v1 * 0.5 >= 12 and v9.X + v1 * 0.5 <= v6.X - 12 then
                v8.caretPosition = UDim2.fromScale(0.5, 0);
            else
                v8.caretPosition = UDim2.fromOffset(math.clamp(v9.X - v11, 12, v18), 0);
            end;
        else
            v8.caretPosition = UDim2.fromOffset(math.clamp(v5.X * 0.5 + math.abs(v5.X * v7.X.Scale + v7.X.Offset), 12, v18), 0);
        end;
        v8.caretFrameSize = UDim2.fromOffset(v1, 8);
        v8.caretImageSize = UDim2.fromOffset(16, 8);
        v8.caretAnchorPoint = Vector2.new(0.5, 0);
        v8.fillDirection = Enum.FillDirection.Vertical;
        if v3 == v0.Bottom then
            v12 = v4.Y + v5.Y;
            v14 = v5.Y;
            v8.caretLayoutOrder = 1;
            v8.contentLayoutOrder = 2;
            v16 = 4;
        else
            v12 = (v4.Y - v2) - 8;
            v14 = -(v2 + 8);
            v8.caretLayoutOrder = 2;
            v8.contentLayoutOrder = 1;
            v16 = -4;
        end;
    else
        v12 = math.clamp(v9.Y - v2 * 0.5, 12, (v6.Y - 12) - v2);
        v14 = v12 - v4.Y;
        local _ = nil;
        local v20 = (v2 - 12) - 16;
        if not v7 then
            if not (not (v9.Y - v2 * 0.5 >= 12) or v9.Y + v2 * 0.5 > v6.Y - 12) or v2 <= 40 then
                v8.caretPosition = UDim2.fromScale(0, 0.5);
            else
                v8.caretPosition = UDim2.fromOffset(0, (math.clamp(v9.Y - v12, 12, (v2 - 12) - 16)));
            end;
        else
            v8.caretPosition = UDim2.fromOffset(0, (math.clamp(v5.Y * 0.5 + math.abs(v5.Y * v7.Y.Scale + v7.Y.Offset), 12, v20)));
        end;
        v8.caretFrameSize = UDim2.fromOffset(8, v2);
        v8.caretImageSize = UDim2.fromOffset(8, 16);
        v8.caretAnchorPoint = Vector2.new(0, 0.5);
        v8.fillDirection = Enum.FillDirection.Horizontal;
        if v3 == v0.Right then
            v11 = v10.X;
            v13 = v5.X;
            v8.caretLayoutOrder = 1;
            v8.contentLayoutOrder = 2;
            v15 = 4;
        else
            v11 = (v4.X - v1) - 8;
            v13 = -(v1 - 8);
            v8.caretLayoutOrder = 2;
            v8.contentLayoutOrder = 1;
            v15 = -4;
        end;
    end;
    v8.absolutePosition = UDim2.fromOffset(v11, v12);
    v8.position = UDim2.fromOffset(v13, v14);
    v8.animatedDistance = UDim2.fromOffset(v15, v16);
    v8.updatedOrientation = v3;
    return v8;
end;

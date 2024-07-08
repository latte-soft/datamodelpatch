local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Parent.React);
local v3 = require(l_Parent_0.Core.Style.useStyle);
return function()
    local v4 = v3();
    local l_SelectionCursor_0 = v4.Tokens.Component.SelectionCursor;
    local l_ReducedMotion_0 = v4.Settings.ReducedMotion;
    local v7 = ColorSequence.new({
        ColorSequenceKeypoint.new(0, l_SelectionCursor_0.Gradient.Start.Color3), 
        ColorSequenceKeypoint.new(1, l_SelectionCursor_0.Gradient.End.Color3)
    });
    local v8 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, l_SelectionCursor_0.Gradient.Start.Transparency), 
        NumberSequenceKeypoint.new(1, l_SelectionCursor_0.Gradient.End.Transparency)
    });
    local v9, v10 = v2.useBinding(0);
    local v11, v12 = v2.useBinding(v7);
    local v13, v14 = v2.useBinding(v8);
    v2.useEffect(function()
        local v20 = l_RunService_0.Heartbeat:Connect(function()
            local v15 = v9:getValue() + 2;
            local l_v7_0 = v7;
            local l_v8_0 = v8;
            if l_ReducedMotion_0 then
                local v18 = (math.sin((math.rad(v15))) + 1) / 2;
                l_v7_0 = ColorSequence.new(l_v7_0.Keypoints[1].Value:Lerp(l_v7_0.Keypoints[#l_v7_0.Keypoints].Value, v18));
                local l_Value_0 = l_v8_0.Keypoints[1].Value;
                l_v8_0 = NumberSequence.new(l_Value_0 + (l_v8_0.Keypoints[#l_v8_0.Keypoints].Value - l_Value_0) * v18);
            end;
            v10(v15);
            v12(l_v7_0);
            v14(l_v8_0);
        end);
        return function()
            v20:Disconnect();
        end;
    end, {
        v7, 
        v8
    });
    return v2.createElement("UIGradient", {
        Rotation = v9, 
        Color = v11, 
        Transparency = v13
    });
end;

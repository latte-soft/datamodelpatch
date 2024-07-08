local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local l_EventConnection_0 = require(l_Parent_1.ReactUtils).EventConnection;
local v5 = require(l_Parent_0.Core.Style.useStyle);
return v3.memo((v3.forwardRef(function(v6, v7)
    local v8 = v5();
    local l_SelectionCursor_0 = v8.Tokens.Component.SelectionCursor;
    local l_ReducedMotion_0 = v8.Settings.ReducedMotion;
    local v11 = ColorSequence.new({
        ColorSequenceKeypoint.new(0, l_SelectionCursor_0.Gradient.Start.Color3), 
        ColorSequenceKeypoint.new(1, l_SelectionCursor_0.Gradient.End.Color3)
    });
    local v12 = NumberSequence.new({
        NumberSequenceKeypoint.new(0, l_SelectionCursor_0.Gradient.Start.Transparency), 
        NumberSequenceKeypoint.new(1, l_SelectionCursor_0.Gradient.End.Transparency)
    });
    local v13, v14 = v3.useBinding(0);
    local v15, v16 = v3.useBinding(v11);
    local v17, v18 = v3.useBinding(v12);
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.fromOffset(-v6.offset, -v6.offset), 
        Size = UDim2.new(1, v6.offset * 2, 1, v6.offset * 2), 
        ref = v7
    }, {
        UICorner = v3.createElement("UICorner", {
            CornerRadius = v6.cornerRadius
        }), 
        UIStroke = v3.createElement("UIStroke", {
            Color = Color3.new(1, 1, 1), 
            Transparency = 0, 
            Thickness = v6.borderWidth
        }, {
            UIGradient = v3.createElement("UIGradient", {
                Rotation = v13, 
                Color = v15, 
                Transparency = v17
            })
        }), 
        HeartbeatConnection = v6.isVisible and v3.createElement(l_EventConnection_0, {
            event = l_RunService_0.Heartbeat, 
            callback = function(_)
                local v20 = v13:getValue() + 2;
                local l_v11_0 = v11;
                local l_v12_0 = v12;
                if l_ReducedMotion_0 then
                    local v23 = (math.sin((math.rad(v20))) + 1) / 2;
                    l_v11_0 = ColorSequence.new(l_v11_0.Keypoints[1].Value:Lerp(l_v11_0.Keypoints[#l_v11_0.Keypoints].Value, v23));
                    local l_Value_0 = l_v12_0.Keypoints[1].Value;
                    l_v12_0 = NumberSequence.new(l_Value_0 + (l_v12_0.Keypoints[#l_v12_0.Keypoints].Value - l_Value_0) * v23);
                end;
                v14(v20);
                v16(l_v11_0);
                v18(l_v12_0);
            end
        })
    });
end)));

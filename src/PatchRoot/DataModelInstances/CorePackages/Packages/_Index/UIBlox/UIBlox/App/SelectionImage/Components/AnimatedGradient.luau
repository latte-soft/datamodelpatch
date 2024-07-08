local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local l_EventConnection_0 = require(l_Parent_1.ReactUtils).EventConnection;
local v4 = require(l_Parent_0.Core.Style.useStyle);
local l_RunService_0 = game:GetService("RunService");
return function()
    local v6 = v4();
    local l_SelectionCursor_0 = v6.Theme.SelectionCursor;
    local l_Settings_0 = v6.Settings;
    local v9, v10 = v2.useBinding(0);
    local v11, v12 = v2.useBinding(l_SelectionCursor_0.GradientColorSequence);
    local v13, v14 = v2.useBinding(l_SelectionCursor_0.GradientTransparencySequence);
    return v2.createElement(v2.Fragment, {}, {
        GradientChild = v2.createElement("UIGradient", {
            Rotation = v9, 
            Color = v11, 
            Transparency = v13
        }), 
        RenderSteppedConnection = v2.createElement(l_EventConnection_0, {
            event = l_RunService_0.RenderStepped, 
            callback = function()
                local v15 = v9:getValue() + l_SelectionCursor_0.GradientRotationSpeed;
                local l_GradientColorSequence_0 = l_SelectionCursor_0.GradientColorSequence;
                local l_GradientTransparencySequence_0 = l_SelectionCursor_0.GradientTransparencySequence;
                if l_Settings_0.ReducedMotion then
                    local v18 = (math.sin((math.rad(v15))) + 1) / 2;
                    l_GradientColorSequence_0 = ColorSequence.new(l_GradientColorSequence_0.Keypoints[1].Value:lerp(l_GradientColorSequence_0.Keypoints[#l_GradientColorSequence_0.Keypoints].Value, v18));
                    local l_Value_0 = l_GradientTransparencySequence_0.Keypoints[1].Value;
                    l_GradientTransparencySequence_0 = NumberSequence.new(l_Value_0 + (l_GradientTransparencySequence_0.Keypoints[#l_GradientTransparencySequence_0.Keypoints].Value - l_Value_0) * v18);
                end;
                v10(v15);
                v12(l_GradientColorSequence_0);
                v14(l_GradientTransparencySequence_0);
            end
        })
    });
end;

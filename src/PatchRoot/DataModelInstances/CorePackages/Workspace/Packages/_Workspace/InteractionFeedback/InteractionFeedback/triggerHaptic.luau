local l_Parent_0 = script:FindFirstAncestor("InteractionFeedback").Parent;
local l_HapticService_0 = game:GetService("HapticService");
local _ = require(script.Parent.InteractionFeedbackContext);
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local v4 = {};
local v5 = {};
local function v10(v6, v7)
    for _, v9 in ipairs(v6) do
        l_HapticService_0:SetMotor(Enum.UserInputType.Gamepad1, v9, v7.intensity);
        v4[v9] = os.clock();
        v5[v9] = game:GetService("RunService").Heartbeat:Connect(function()
            if v4[v9] then
                if v7.duration < os.clock() - v4[v9] then
                    l_HapticService_0:SetMotor(Enum.UserInputType.Gamepad1, v9, 0);
                    v5[v9]:Disconnect();
                    v5[v9] = nil;
                    v4[v9] = nil;
                end;
                return ;
            else
                return ;
            end;
        end);
    end;
end;
local function v12(v11)
    if not l_IsVRAppBuild_0() then
        if v11 == "Touch" then
            return {
                Enum.VibrationMotor.Large
            };
        elseif v11 == "Gamepad" then
            return {
                Enum.VibrationMotor.Large, 
                Enum.VibrationMotor.Small
            };
        else
            return {};
        end;
    else
        return {
            Enum.VibrationMotor.LeftHand, 
            Enum.VibrationMotor.RightHand
        };
    end;
end;
return function(v13, v14)
    v10(v12(v14), v13);
end;

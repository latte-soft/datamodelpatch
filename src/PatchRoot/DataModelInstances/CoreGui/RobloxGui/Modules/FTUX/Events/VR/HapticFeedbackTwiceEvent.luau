local l_HapticService_0 = game:GetService("HapticService");
local _ = require(script.Parent.Parent.EventType);
return {
    Name = "HapticFeedbackTwiceEvent", 
    StartEvent = function()
        local l_Gamepad1_0 = Enum.UserInputType.Gamepad1;
        local l_Gamepad2_0 = Enum.UserInputType.Gamepad2;
        for _ = 1, 2 do
            l_HapticService_0:SetMotor(l_Gamepad1_0, Enum.VibrationMotor.Large, 5);
            l_HapticService_0:SetMotor(l_Gamepad2_0, Enum.VibrationMotor.Large, 5);
            task.wait(0.5);
            l_HapticService_0:SetMotor(l_Gamepad1_0, Enum.VibrationMotor.Large, 0);
            l_HapticService_0:SetMotor(l_Gamepad2_0, Enum.VibrationMotor.Large, 0);
            task.wait(0.125);
        end;
    end
};

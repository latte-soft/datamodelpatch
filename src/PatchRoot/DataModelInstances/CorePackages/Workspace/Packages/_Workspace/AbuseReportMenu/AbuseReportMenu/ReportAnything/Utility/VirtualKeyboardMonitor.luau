local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = {
    _initialized = false, 
    _isKeyboardJustOff = false, 
    getInstance = function(v1)
        if not v1._initialized then
            v1:initialize();
            v1._initialized = true;
        end;
        return v1;
    end, 
    initialize = function(v2)
        v2._isKeyboardJustOff = false;
        l_UserInputService_0:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
            if not l_UserInputService_0.OnScreenKeyboardVisible then
                v2._isKeyboardJustOff = true;
            end;
        end);
        l_UserInputService_0.InputEnded:Connect(function(_)
            if v2._isKeyboardJustOff then
                v2._isKeyboardJustOff = false;
            end;
        end);
    end, 
    isKeyboardJustOff = function(v4)
        return v4._isKeyboardJustOff;
    end
};
return {
    getInstance = function()
        return v5:getInstance();
    end
};

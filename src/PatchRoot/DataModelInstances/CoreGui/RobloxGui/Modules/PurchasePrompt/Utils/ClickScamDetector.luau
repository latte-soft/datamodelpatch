local _ = script.Parent.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Cryo_0 = require(game:GetService("CorePackages").PurchasePromptDeps).Cryo;
local v3 = {};
v3.__index = v3;
v3.new = function(v4)
    local v5 = {
        _inputConnection = nil, 
        _clickCount = 0, 
        _startTime = tick(), 
        _options = l_Cryo_0.Dictionary.join({
            clickSpeedThreshold = 3, 
            clickTimeWindow = 1, 
            initialDelay = 1, 
            buttonInput = nil
        }, v4 or {})
    };
    setmetatable(v5, v3);
    v5._inputConnection = l_UserInputService_0.InputBegan:Connect(function(v6)
        v5:_onInput(v6);
    end);
    return v5;
end;
v3._onInput = function(v7, v8)
    local l_UserInputType_0 = v8.UserInputType;
    local v10 = false;
    if v7._options.buttonInput ~= nil then
        v10 = v8.KeyCode == v7._options.buttonInput;
    end;
    local v11 = true;
    if l_UserInputType_0 ~= Enum.UserInputType.MouseButton1 then
        v11 = l_UserInputType_0 == Enum.UserInputType.Touch;
    end;
    if not (not v10 and not v11) then
        v7._clickCount = v7._clickCount + 1;
        delay(v7._options.clickTimeWindow, function()
            v7._clickCount = v7._clickCount - 1;
        end);
    end;
end;
v3.isClickValid = function(v12)
    if l_UserInputService_0.MouseBehavior == Enum.MouseBehavior.LockCurrentPosition then
        return false;
    elseif tick() - v12._startTime < v12._options.initialDelay then
        return false;
    else
        return v12._clickCount / v12._options.clickTimeWindow < v12._options.clickSpeedThreshold;
    end;
end;
v3.destroy = function(v13)
    v13._inputConnection:Disconnect();
end;
return v3;

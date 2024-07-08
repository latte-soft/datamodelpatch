return {
    isActivationInput = function(v0)
        local v1 = true;
        if v0.UserInputType ~= Enum.UserInputType.MouseButton1 then
            v1 = v0.UserInputType == Enum.UserInputType.Touch;
        end;
        return v1;
    end, 
    isPointerInput = function(v2)
        local v3 = true;
        if v2.UserInputType ~= Enum.UserInputType.MouseMovement then
            v3 = v2.UserInputType == Enum.UserInputType.Touch;
        end;
        return v3;
    end, 
    isTouchInput = function(v4)
        return v4.UserInputType == Enum.UserInputType.Touch;
    end
};

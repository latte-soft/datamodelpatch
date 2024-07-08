local l_UserInputService_0 = game:GetService("UserInputService");
local v1 = {
    DESKTOP = "Desktop", 
    MOBILE_PORTRAIT = "Portrait", 
    MOBILE_LANDSCAPE = "Landscape", 
    LARGE = "Large", 
    SMALL = "Small"
};
local v2 = {
    [v1.MOBILE_PORTRAIT] = {
        [v1.SMALL] = {
            ratio = 0.24, 
            max = 185
        }, 
        [v1.LARGE] = {
            ratio = 0.35, 
            max = 324
        }
    }, 
    [v1.MOBILE_LANDSCAPE] = {
        [v1.SMALL] = {
            ratio = 0.43, 
            max = 185
        }, 
        [v1.LARGE] = {
            ratio = 0.56, 
            max = 240
        }
    }, 
    [v1.DESKTOP] = {
        [v1.SMALL] = {
            ratio = 0.33, 
            max = 600
        }, 
        [v1.LARGE] = {
            ratio = 0.44, 
            max = 760
        }
    }
};
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local function _(v4)
    return v4 * 0.4648648648648649;
end;
local function _(v6)
    if not (l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Android) or l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
        return v6.Y < v6.X and v1.MOBILE_LANDSCAPE or v1.MOBILE_PORTRAIT;
    else
        return v1.DESKTOP;
    end;
end;
return {
    getSize = function(v8, v9)
        local v10 = v2[if not (l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Android) or l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then v8.Y < v8.X and v1.MOBILE_LANDSCAPE or v1.MOBILE_PORTRAIT else v1.DESKTOP][not not v9 and v1.LARGE or v1.SMALL];
        local v11 = math.min(math.round(v8.Y * v10.ratio), v10.max);
        return Vector2.new(v11 * 0.4648648648648649, v11);
    end
};

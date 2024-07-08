local l_Signal_0 = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Signal;
local v1 = require(script.Parent.ViewportUtil);
local v2 = require(script.Parent.Parent.Unibar.Constants);
local function v10(v3, v4)
    local v5 = v1.mobileDevice:get();
    local v6 = v1.screenSize:get();
    local v7 = v6.X < v6.Y;
    local l_v3_0 = v3;
    local l_v4_0 = v4;
    if v5 then
        if not v7 then
            if not v7 then
                l_v4_0 = math.min(v4, v2.MAX_HEIGHT_LANDSCAPE);
                l_v3_0 = math.min(v3, v2.MAX_WIDTH_LANDSCAPE);
            end;
        else
            l_v4_0 = math.min(v4, v2.MAX_HEIGHT_PORTRAIT);
            l_v3_0 = math.min(v3, v2.MAX_WIDTH_PORTRAIT);
        end;
    end;
    return UDim2.new(0, l_v3_0, 0, l_v4_0);
end;
local v11 = {};
v11.__index = v11;
v11.new = function(v12, v13, v14)
    return (setmetatable({
        _state = v10(v12 or v2.DEFAULT_WIDTH, v13 or v2.DEFAULT_HEIGHT), 
        _isLarge = v14 or false, 
        _changeSignal = l_Signal_0.new()
    }, v11));
end;
v11.connect = function(v15, v16)
    return v15._changeSignal:connect(v16);
end;
v11.requestSize = function(v17, v18, v19)
    local v20 = v10(v18, v19);
    if v17._state ~= v20 then
        v17._state = v20;
        v17._changeSignal:fire(v20);
    end;
end;
v11.toggleIsLarge = function(v21)
    local v22 = not v21._isLarge;
    v21._isLarge = v22;
    v21._changeSignal:fire(v22);
end;
v11.get = function(v23)
    return v23._state;
end;
v11.getIsLarge = function(v24)
    return v24._isLarge;
end;
v11.updateConstraints = function(v25)
    v25:requestSize(v25._state.Width.Offset, v25._state.Height.Offset);
end;
return v11;

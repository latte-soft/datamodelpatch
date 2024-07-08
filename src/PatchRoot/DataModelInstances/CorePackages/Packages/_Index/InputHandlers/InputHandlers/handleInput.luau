local _ = require(script.Parent.Parent.FocusNavigation);
local v1 = require(script.Parent.Heartbeat);
local function v5(v2, v3)
    local v4 = false;
    task.delay(v2, function()
        if not v4 then
            v3();
        end;
    end);
    return {
        cancel = function()
            v4 = true;
        end
    };
end;
return function(v6)
    local l_hold_0 = v6.hold;
    local v8 = nil;
    local v9 = nil;
    local v10 = false;
    local function _()
        if v8 then
            v8.cancel();
            v8 = nil;
        end;
        if v9 then
            v9:Disconnect();
            v9 = nil;
        end;
        v10 = false;
    end;
    return function(v12)
        local v13 = if not v12.eventData then nil else v12.eventData.UserInputState;
        if v13 == Enum.UserInputState.Begin then
            if v6.onPress then
                v6.onPress(v12);
            end;
            if v8 then
                v8.cancel();
                v8 = nil;
            end;
            if v9 then
                v9:Disconnect();
                v9 = nil;
            end;
            v10 = false;
            if l_hold_0 then
                v8 = v5(l_hold_0.durationSeconds, function()
                    if not l_hold_0.allowReleaseAfterHold then
                        v10 = false;
                    end;
                    l_hold_0.onComplete();
                    if v9 then
                        v9:Disconnect();
                        v9 = nil;
                    end;
                end);
                v9 = if not l_hold_0.onStep then nil else v1:Connect(l_hold_0.onStep);
            end;
            v10 = true;
        end;
        if v13 == Enum.UserInputState.End then
            if not (not v6.onRelease or not v10) then
                v6.onRelease(v12);
            end;
            if v8 then
                v8.cancel();
                v8 = nil;
            end;
            if v9 then
                v9:Disconnect();
                v9 = nil;
            end;
            v10 = false;
        end;
        if v13 == Enum.UserInputState.Cancel then
            if v8 then
                v8.cancel();
                v8 = nil;
            end;
            if v9 then
                v9:Disconnect();
                v9 = nil;
            end;
            v10 = false;
        end;
    end;
end;

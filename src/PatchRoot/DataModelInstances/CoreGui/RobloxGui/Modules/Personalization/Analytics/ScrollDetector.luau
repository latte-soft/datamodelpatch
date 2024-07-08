local v0 = require(game:GetService("CorePackages").Packages.React);
local l_RunService_0 = game:GetService("RunService");
game:DefineFastInt("ScrollDetectorTimeThresholdMillis", 300000);
game:DefineFastInt("ScrollDetectorDelayMillis", 250);
local function _()
    return game:GetFastInt("ScrollDetectorDelayMillis") / 1000;
end;
local function _()
    return game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000;
end;
return function(v4)
    local v5 = v0.useRef(0);
    local v6 = v0.useRef(0);
    local v7 = v0.useRef(nil);
    local v8 = v0.useRef(nil);
    local v9 = v0.useRef(0);
    local v10 = v0.useRef(0);
    local v11 = v0.useRef(nil);
    local function _(v12)
        local v13 = v5.current - v6.current;
        if v13 == 0 then
            return ;
        else
            v4.sendScrollEvent(v13, v12 - v9.current, v6.current);
            return ;
        end;
    end;
    local function v27()
        if v4.scrollingFrameRef and v4.scrollingFrameRef.current then
            local v15 = nil;
            local v16 = time();
            local v17 = v16 - v9.current;
            if not (not v4.scrollingFrameRef or not v4.scrollingFrameRef.current) then
                v15 = if v4.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then v4.scrollingFrameRef.current.CanvasPosition.Y else v4.scrollingFrameRef.current.CanvasPosition.X;
            end;
            local v18 = v5.current - v6.current;
            local v19 = v15 - v5.current;
            if not v11.current and v19 == 0 then
                v11.current = v10.current;
            elseif v11.current and v19 ~= 0 then
                v11.current = nil;
            end;
            if v11.current and v11.current + game:GetFastInt("ScrollDetectorDelayMillis") / 1000 < v16 then
                v5.current = v15;
                local l_current_0 = v11.current;
                local v21 = v5.current - v6.current;
                if not (v21 == 0) then
                    v4.sendScrollEvent(v21, l_current_0 - v9.current, v6.current);
                end;
                v6.current = v15;
                l_current_0 = v7.current;
                if l_current_0 then
                    l_current_0:Disconnect();
                end;
                v7.current = nil;
                return ;
            else
                if (v18 ~= 0 and v19 ~= 0) and math.sign(v18) ~= math.sign(v19) then
                    local l_current_1 = v10.current;
                    local v23 = v5.current - v6.current;
                    if not (v23 == 0) then
                        v4.sendScrollEvent(v23, l_current_1 - v9.current, v6.current);
                    end;
                    v6.current = v5.current;
                    v9.current = v10.current;
                elseif not v11.current and game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000 <= v17 then
                    v5.current = v15;
                    local v24 = v5.current - v6.current;
                    if not (v24 == 0) then
                        v4.sendScrollEvent(v24, v16 - v9.current, v6.current);
                    end;
                    v6.current = v15;
                    v9.current = v16;
                end;
                v5.current = v15;
                v10.current = v16;
                return ;
            end;
        else
            local l_current_2 = v10.current;
            local v26 = v5.current - v6.current;
            if not (v26 == 0) then
                v4.sendScrollEvent(v26, l_current_2 - v9.current, v6.current);
            end;
            if v7.current then
                v7.current:Disconnect();
            end;
            v7.current = nil;
            return ;
        end;
    end;
    local function v28()
        if not v7.current then
            v9.current = time();
            v10.current = v9.current;
            v6.current = v5.current;
            v7.current = l_RunService_0.Stepped:Connect(function()
                v27();
            end);
        end;
    end;
    v0.useEffect(function()
        local v29 = nil;
        if not (not v4.scrollingFrameRef or not v4.scrollingFrameRef.current) and v8.current ~= v4.scrollingFrameRef.current then
            v5.current = if v4.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then v4.scrollingFrameRef.current.CanvasPosition.Y else v4.scrollingFrameRef.current.CanvasPosition.X;
            v29 = v4.scrollingFrameRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
                v28();
            end);
            v8.current = v4.scrollingFrameRef.current;
        end;
        return function()
            if v7.current then
                local l_current_3 = v10.current;
                local v31 = v5.current - v6.current;
                if not (v31 == 0) then
                    v4.sendScrollEvent(v31, l_current_3 - v9.current, v6.current);
                end;
                v7.current:Disconnect();
            end;
            v7.current = nil;
            if v29 then
                v29:Disconnect();
            end;
            v29 = nil;
            if not (v4.scrollingFrameRef and v4.scrollingFrameRef.current) then
                v8.current = nil;
            end;
        end;
    end, {
        v4.scrollingFrameRef
    });
    return nil;
end;

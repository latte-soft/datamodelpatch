local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local v1 = require(script:FindFirstAncestor("Rhodium").VirtualInputUtils);
local v8 = {
    SendTouchEvent = function(v2, v3, v4, v5)
        local v6, v7 = v1.__handleGuiInset(v4, v5);
        l_VirtualInputManager_0:SendTouchEvent(v2, v3, v6, v7);
    end
};
v8.touchStart = function(v9, v10)
    v8.SendTouchEvent(123456 + (v10 or 0), 0, v9.X, v9.Y);
end;
v8.touchMove = function(v11, v12)
    v8.SendTouchEvent(123456 + (v12 or 0), 1, v11.X, v11.Y);
end;
v8.touchStop = function(v13, v14)
    v8.SendTouchEvent(123456 + (v14 or 0), 2, v13.X, v13.Y);
end;
local function _(v15, v16, v17, v18)
    local v19 = 0;
    local v20 = false;
    local v21 = 123456 + (v18 or 0);
    return function(v22)
        if v20 then
            v19 = v19 + v22;
            if v17 and v19 < v17 then
                v8.touchMove((v16 - v15) * (v19 / v17) + v15, v21);
            else
                v8.touchMove(v16, v21);
                v8.touchStop(v16, v21);
                return true;
            end;
        else
            v8.touchStart(v15, v21);
            v20 = true;
        end;
        return false;
    end;
end;
v8.swipe = function(v24, v25, v26, v27, v28)
    local v29 = 123456 + (v28 or 0);
    if v27 == true then
        local l___asyncRun_0 = v1.__asyncRun;
        local v31 = 0;
        local v32 = false;
        local v33 = 123456 + (v29 or 0);
        local v34;
        do
            local l_v31_0, l_v32_0 = v31, v32;
            v34 = function(v37)
                if l_v32_0 then
                    l_v31_0 = l_v31_0 + v37;
                    if v26 and l_v31_0 < v26 then
                        v8.touchMove((v25 - v24) * (l_v31_0 / v26) + v24, v33);
                    else
                        v8.touchMove(v25, v33);
                        v8.touchStop(v25, v33);
                        return true;
                    end;
                else
                    v8.touchStart(v24, v33);
                    l_v32_0 = true;
                end;
                return false;
            end;
        end;
        l___asyncRun_0(v34);
        return ;
    else
        local l___syncRun_0 = v1.__syncRun;
        local v39 = 0;
        local v40 = false;
        local v41 = 123456 + (v29 or 0);
        local v42;
        do
            local l_v39_0, l_v40_0 = v39, v40;
            v42 = function(v45)
                if l_v40_0 then
                    l_v39_0 = l_v39_0 + v45;
                    if v26 and l_v39_0 < v26 then
                        v8.touchMove((v25 - v24) * (l_v39_0 / v26) + v24, v41);
                    else
                        v8.touchMove(v25, v41);
                        v8.touchStop(v25, v41);
                        return true;
                    end;
                else
                    v8.touchStart(v24, v41);
                    l_v40_0 = true;
                end;
                return false;
            end;
        end;
        l___syncRun_0(v42);
        return ;
    end;
end;
v8.touchScroll = function(v46, v47, v48, v49, v50, v51)
    v8.swipe(v46, v46 + Vector2.new(v47, v48), v49, v50, v51);
end;
v8.tap = function(v52)
    v8.touchStart(v52);
    v8.touchStop(v52);
    v1.waitForInputEventsProcessed();
end;
return v8;

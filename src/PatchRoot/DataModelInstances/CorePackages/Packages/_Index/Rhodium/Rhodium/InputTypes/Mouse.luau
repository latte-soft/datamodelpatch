local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Rhodium");
local v2 = require(l_script_FirstAncestor_0.VirtualInputUtils);
local v3 = require(l_script_FirstAncestor_0.InputVisualizer).new();
local v20 = {
    sendMouseButtonEvent = function(v4, v5, v6, v7, v8)
        local v9, v10 = v2.__handleGuiInset(v4, v5);
        l_VirtualInputManager_0:SendMouseButtonEvent(v9, v10, v6, v7, v2.getCurrentWindow(), v8 or 0);
    end, 
    SendMouseMoveEvent = function(v11, v12)
        local v13, v14 = v2.__handleGuiInset(v11, v12);
        l_VirtualInputManager_0:SendMouseMoveEvent(v13, v14, (v2.getCurrentWindow()));
    end, 
    SendMouseWheelEvent = function(v15, v16, v17)
        local v18, v19 = v2.__handleGuiInset(v15, v16);
        l_VirtualInputManager_0:SendMouseWheelEvent(v18, v19, v17, (v2.getCurrentWindow()));
    end
};
v20.mouseWheel = function(v21, v22)
    local v23 = false;
    if v22 < 0 then
        v23 = true;
        v22 = -v22;
    end;
    for _ = 1, v22 do
        v20.SendMouseWheelEvent(v21.X, v21.Y, v23);
    end;
end;
local function v28(v25, v26, v27)
    v3:click(v25, v2.getCurrentWindow());
    v20.sendMouseButtonEvent(v25.X, v25.Y, v27, true, v26);
    v20.sendMouseButtonEvent(v25.X, v25.Y, v27, false, v26);
    v2.waitForInputEventsProcessed();
end;
local function _(v29, v30, v31)
    local v32 = true;
    local v33 = 0;
    return function()
        if not v32 then
            if v30 >= 1 then
                v28(v29, v33, v31);
                v30 = v30 - 1;
                v33 = v33 + 1;
                v32 = true;
                return false;
            elseif v30 == 0 then
                return true;
            else
                return false;
            end;
        else
            v32 = false;
            return false;
        end;
    end;
end;
v20.click = function(v35)
    local l___syncRun_0 = v2.__syncRun;
    local v37 = 1;
    local v38 = true;
    local v39 = 0;
    local v40 = 0;
    local v41;
    do
        local l_v37_0, l_v38_0, l_v39_0 = v37, v38, v39;
        v41 = function()
            if not l_v38_0 then
                if l_v37_0 >= 1 then
                    v28(v35, l_v39_0, v40);
                    l_v37_0 = l_v37_0 - 1;
                    l_v39_0 = l_v39_0 + 1;
                    l_v38_0 = true;
                    return false;
                elseif l_v37_0 == 0 then
                    return true;
                else
                    return false;
                end;
            else
                l_v38_0 = false;
                return false;
            end;
        end;
    end;
    l___syncRun_0(v41);
end;
v20.multiClick = function(v45, v46)
    local l___syncRun_1 = v2.__syncRun;
    local l_v46_0 = v46;
    local v49 = true;
    local v50 = 0;
    local v51 = 0;
    local v52;
    do
        local l_l_v46_0_0, l_v49_0, l_v50_0 = l_v46_0, v49, v50;
        v52 = function()
            if not l_v49_0 then
                if l_l_v46_0_0 >= 1 then
                    v28(v45, l_v50_0, v51);
                    l_l_v46_0_0 = l_l_v46_0_0 - 1;
                    l_v50_0 = l_v50_0 + 1;
                    l_v49_0 = true;
                    return false;
                elseif l_l_v46_0_0 == 0 then
                    return true;
                else
                    return false;
                end;
            else
                l_v49_0 = false;
                return false;
            end;
        end;
    end;
    l___syncRun_1(v52);
end;
v20.rightClick = function(v56)
    local l___syncRun_2 = v2.__syncRun;
    local v58 = 1;
    local v59 = true;
    local v60 = 0;
    local v61 = 1;
    local v62;
    do
        local l_v58_0, l_v59_0, l_v60_0 = v58, v59, v60;
        v62 = function()
            if not l_v59_0 then
                if l_v58_0 >= 1 then
                    v28(v56, l_v60_0, v61);
                    l_v58_0 = l_v58_0 - 1;
                    l_v60_0 = l_v60_0 + 1;
                    l_v59_0 = true;
                    return false;
                elseif l_v58_0 == 0 then
                    return true;
                else
                    return false;
                end;
            else
                l_v59_0 = false;
                return false;
            end;
        end;
    end;
    l___syncRun_2(v62);
end;
v20.mouseLeftDown = function(v66)
    v20.sendMouseButtonEvent(v66.X, v66.Y, 0, true);
end;
v20.mouseLeftUp = function(v67)
    v20.sendMouseButtonEvent(v67.X, v67.Y, 0, false);
end;
v20.mouseRightDown = function(v68)
    v20.sendMouseButtonEvent(v68.X, v68.Y, 1, true);
end;
v20.mouseRightUp = function(v69)
    v20.sendMouseButtonEvent(v69.X, v69.Y, 1, false);
end;
v20.mouseMove = function(v70)
    v20.SendMouseMoveEvent(v70.X, v70.Y);
end;
local function _(v71, v72, v73)
    local v74 = 0;
    local v75 = false;
    return function(v76)
        if v75 then
            v74 = v74 + v76;
            if v73 and v74 < v73 then
                v20.mouseMove((v72 - v71) * (v74 / v73) + v71);
            else
                v20.mouseMove(v72);
                v20.mouseLeftUp(v72);
                return true;
            end;
        else
            v20.mouseLeftDown(v71);
            v75 = true;
        end;
        return false;
    end;
end;
v20.mouseDrag = function(v78, v79, v80)
    local l___syncRun_3 = v2.__syncRun;
    local v82 = 0;
    local v83 = false;
    local v84;
    do
        local l_v82_0, l_v83_0 = v82, v83;
        v84 = function(v87)
            if l_v83_0 then
                l_v82_0 = l_v82_0 + v87;
                if v80 and l_v82_0 < v80 then
                    v20.mouseMove((v79 - v78) * (l_v82_0 / v80) + v78);
                else
                    v20.mouseMove(v79);
                    v20.mouseLeftUp(v79);
                    return true;
                end;
            else
                v20.mouseLeftDown(v78);
                l_v83_0 = true;
            end;
            return false;
        end;
    end;
    l___syncRun_3(v84);
end;
v20.__setInputVisualizerEnabled = function(v88)
    if not v88 then
        v3:disable();
        return ;
    else
        v3:enable();
        return ;
    end;
end;
return v20;

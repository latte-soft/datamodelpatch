local l_Error_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Error;
local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local function _(v2)
    local l_Parent_0 = v2.Parent;
    if l_Parent_0 == nil then
        return v2;
    else
        while l_Parent_0.Parent ~= nil and l_Parent_0.Parent.Parent ~= game do
            l_Parent_0 = l_Parent_0.Parent;
        end;
        return l_Parent_0;
    end;
end;
local function _(v5)
    return function(v6, v7)
        local l_v6_FirstAncestorOfClass_0 = v6:FindFirstAncestorOfClass("CoreGui");
        local l_v6_FirstAncestorOfClass_1 = v6:FindFirstAncestorOfClass("ScreenGui");
        local v10 = l_v6_FirstAncestorOfClass_0 or game:GetService("CoreGui");
        local v11 = l_v6_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
        local v12 = nil;
        local v13 = false;
        if not v11:FindFirstAncestorOfClass("CoreGui") and v11.Parent == nil then
            v11.Parent = v10;
            v13 = true;
        end;
        if not v6:FindFirstAncestorOfClass("ScreenGui") then
            local l_Parent_1 = v6.Parent;
            if l_Parent_1 == nil then
                v12 = v6;
            else
                while l_Parent_1.Parent ~= nil and l_Parent_1.Parent.Parent ~= game do
                    l_Parent_1 = l_Parent_1.Parent;
                end;
                v12 = l_Parent_1;
            end;
            v12.Parent = v11;
        end;
        v5(v6, v7);
        if l_v6_FirstAncestorOfClass_1 ~= v11 then
            v12.Parent = nil;
            v11:Destroy();
        end;
        if not (not v11 or not v13) then
            v11.Parent = nil;
        end;
    end;
end;
local function _(v16)
    local l_AbsolutePosition_0 = v16.AbsolutePosition;
    local l_AbsoluteSize_0 = v16.AbsoluteSize;
    return l_AbsolutePosition_0.X + l_AbsoluteSize_0.X / 2, l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y / 2;
end;
local function v25(v20)
    local l_AbsolutePosition_1 = v20.AbsolutePosition;
    local l_AbsoluteSize_1 = v20.AbsoluteSize;
    local v23 = l_AbsolutePosition_1.X + l_AbsoluteSize_1.X / 2;
    local v24 = l_AbsolutePosition_1.Y + l_AbsoluteSize_1.Y / 2;
    l_VirtualInputManager_0:SendMouseButtonEvent(v23, v24, 0, true, nil, 1);
    l_VirtualInputManager_0:SendMouseButtonEvent(v23, v24, 0, false, nil, 1);
    l_VirtualInputManager_0:WaitForInputEventsProcessed();
end;
local function v28(_, v27)
    if not (v27 and v27.key) then
        error("No key set for event");
    end;
    l_VirtualInputManager_0:SendKeyEvent(true, v27.key, false, nil);
    l_VirtualInputManager_0:WaitForInputEventsProcessed();
end;
local function v31(_, v30)
    if not (v30 and v30.key) then
        error("No key set for event");
    end;
    l_VirtualInputManager_0:SendKeyEvent(false, v30.key, false, nil);
    l_VirtualInputManager_0:WaitForInputEventsProcessed();
end;
local function v36(v32, v33)
    if not v32:IsA("TextBox") then
        error(l_Error_0.new("The change event must be fired in a TextBox Instance"));
    elseif not (not v33 or not v33.target) then
        for v34, v35 in pairs(v33.target) do
            v32[v34] = v35;
        end;
        return ;
    end;
end;
local function v39(v37, v38)
    v37.Size = if not not v38 and v38.value then v38.value else v37.Size;
end;
local v85 = {
    click = function(v40, v41)
        local l_v40_FirstAncestorOfClass_0 = v40:FindFirstAncestorOfClass("CoreGui");
        local l_v40_FirstAncestorOfClass_1 = v40:FindFirstAncestorOfClass("ScreenGui");
        local v44 = l_v40_FirstAncestorOfClass_0 or game:GetService("CoreGui");
        local v45 = l_v40_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
        local v46 = nil;
        local v47 = false;
        if not v45:FindFirstAncestorOfClass("CoreGui") and v45.Parent == nil then
            v45.Parent = v44;
            v47 = true;
        end;
        if not v40:FindFirstAncestorOfClass("ScreenGui") then
            local l_Parent_2 = v40.Parent;
            if l_Parent_2 == nil then
                v46 = v40;
            else
                while l_Parent_2.Parent ~= nil and l_Parent_2.Parent.Parent ~= game do
                    l_Parent_2 = l_Parent_2.Parent;
                end;
                v46 = l_Parent_2;
            end;
            v46.Parent = v45;
        end;
        v25(v40, v41);
        if l_v40_FirstAncestorOfClass_1 ~= v45 then
            v46.Parent = nil;
            v45:Destroy();
        end;
        if not (not v45 or not v47) then
            v45.Parent = nil;
        end;
    end, 
    keyDown = function(v49, v50)
        local l_v49_FirstAncestorOfClass_0 = v49:FindFirstAncestorOfClass("CoreGui");
        local l_v49_FirstAncestorOfClass_1 = v49:FindFirstAncestorOfClass("ScreenGui");
        local v53 = l_v49_FirstAncestorOfClass_0 or game:GetService("CoreGui");
        local v54 = l_v49_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
        local v55 = nil;
        local v56 = false;
        if not v54:FindFirstAncestorOfClass("CoreGui") and v54.Parent == nil then
            v54.Parent = v53;
            v56 = true;
        end;
        if not v49:FindFirstAncestorOfClass("ScreenGui") then
            local l_Parent_3 = v49.Parent;
            if l_Parent_3 == nil then
                v55 = v49;
            else
                while l_Parent_3.Parent ~= nil and l_Parent_3.Parent.Parent ~= game do
                    l_Parent_3 = l_Parent_3.Parent;
                end;
                v55 = l_Parent_3;
            end;
            v55.Parent = v54;
        end;
        v28(v49, v50);
        if l_v49_FirstAncestorOfClass_1 ~= v54 then
            v55.Parent = nil;
            v54:Destroy();
        end;
        if not (not v54 or not v56) then
            v54.Parent = nil;
        end;
    end, 
    keyUp = function(v58, v59)
        local l_v58_FirstAncestorOfClass_0 = v58:FindFirstAncestorOfClass("CoreGui");
        local l_v58_FirstAncestorOfClass_1 = v58:FindFirstAncestorOfClass("ScreenGui");
        local v62 = l_v58_FirstAncestorOfClass_0 or game:GetService("CoreGui");
        local v63 = l_v58_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
        local v64 = nil;
        local v65 = false;
        if not v63:FindFirstAncestorOfClass("CoreGui") and v63.Parent == nil then
            v63.Parent = v62;
            v65 = true;
        end;
        if not v58:FindFirstAncestorOfClass("ScreenGui") then
            local l_Parent_4 = v58.Parent;
            if l_Parent_4 == nil then
                v64 = v58;
            else
                while l_Parent_4.Parent ~= nil and l_Parent_4.Parent.Parent ~= game do
                    l_Parent_4 = l_Parent_4.Parent;
                end;
                v64 = l_Parent_4;
            end;
            v64.Parent = v63;
        end;
        v31(v58, v59);
        if l_v58_FirstAncestorOfClass_1 ~= v63 then
            v64.Parent = nil;
            v63:Destroy();
        end;
        if not (not v63 or not v65) then
            v63.Parent = nil;
        end;
    end, 
    change = function(v67, v68)
        local l_v67_FirstAncestorOfClass_0 = v67:FindFirstAncestorOfClass("CoreGui");
        local l_v67_FirstAncestorOfClass_1 = v67:FindFirstAncestorOfClass("ScreenGui");
        local v71 = l_v67_FirstAncestorOfClass_0 or game:GetService("CoreGui");
        local v72 = l_v67_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
        local v73 = nil;
        local v74 = false;
        if not v72:FindFirstAncestorOfClass("CoreGui") and v72.Parent == nil then
            v72.Parent = v71;
            v74 = true;
        end;
        if not v67:FindFirstAncestorOfClass("ScreenGui") then
            local l_Parent_5 = v67.Parent;
            if l_Parent_5 == nil then
                v73 = v67;
            else
                while l_Parent_5.Parent ~= nil and l_Parent_5.Parent.Parent ~= game do
                    l_Parent_5 = l_Parent_5.Parent;
                end;
                v73 = l_Parent_5;
            end;
            v73.Parent = v72;
        end;
        v36(v67, v68);
        if l_v67_FirstAncestorOfClass_1 ~= v72 then
            v73.Parent = nil;
            v72:Destroy();
        end;
        if not (not v72 or not v74) then
            v72.Parent = nil;
        end;
    end, 
    resize = function(v76, v77)
        local l_v76_FirstAncestorOfClass_0 = v76:FindFirstAncestorOfClass("CoreGui");
        local l_v76_FirstAncestorOfClass_1 = v76:FindFirstAncestorOfClass("ScreenGui");
        local v80 = l_v76_FirstAncestorOfClass_0 or game:GetService("CoreGui");
        local v81 = l_v76_FirstAncestorOfClass_1 or Instance.new("ScreenGui");
        local v82 = nil;
        local v83 = false;
        if not v81:FindFirstAncestorOfClass("CoreGui") and v81.Parent == nil then
            v81.Parent = v80;
            v83 = true;
        end;
        if not v76:FindFirstAncestorOfClass("ScreenGui") then
            local l_Parent_6 = v76.Parent;
            if l_Parent_6 == nil then
                v82 = v76;
            else
                while l_Parent_6.Parent ~= nil and l_Parent_6.Parent.Parent ~= game do
                    l_Parent_6 = l_Parent_6.Parent;
                end;
                v82 = l_Parent_6;
            end;
            v82.Parent = v81;
        end;
        v39(v76, v77);
        if l_v76_FirstAncestorOfClass_1 ~= v81 then
            v82.Parent = nil;
            v81:Destroy();
        end;
        if not (not v81 or not v83) then
            v81.Parent = nil;
        end;
    end
};
return function(v86, v87, v88)
    local v89 = v85[v87];
    if not v89 then
        error("Event not found");
    end;
    v89(v86, v88);
end;

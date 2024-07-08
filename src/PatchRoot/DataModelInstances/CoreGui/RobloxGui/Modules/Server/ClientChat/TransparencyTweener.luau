local v0 = {};
local l_RunService_0 = game:GetService("RunService");
local _ = script.Parent;
local v4 = {
    __ClassName = "TransparencyTweener", 
    __tostring = function(v3)
        return v3.__ClassName .. ": " .. v3.MemoryLocation;
    end, 
    __metatable = "The metatable is locked"
};
v4.__index = function(v5, v6, _)
    if not rawget(v5, v6) then
        if not rawget(v4, v6) then
            if v6 == "Transparency" then
                return (rawget(v5, "InternalLastTweenPercentage"));
            else
                error(v6 .. " is not a valid member of " .. v5.__ClassName);
                return ;
            end;
        else
            return (rawget(v4, v6));
        end;
    else
        return (rawget(v5, v6));
    end;
end;
v4.__newindex = function(v8, v9, v10)
    if v9 == "Transparency" then
        v8.InternalLastTweenPercentage = v10;
        v8:SetPropertiesToTweenPercentage(v10);
        return ;
    else
        error(v9 .. " is not a valid member of " .. v8.__ClassName);
        return ;
    end;
end;
v4.Dump = function(v11)
    local v12 = tostring(v11);
    for v13, v14 in pairs(v11.TweenObjects) do
        local v15 = " | ";
        if type(v13) == "table" then
            v15 = v15 .. "{{" .. v13:Dump() .. "}}";
        elseif type(v13) == "userdata" then
            v15 = v15 .. v13.Name .. "/" .. v13:GetFullName();
        end;
        for v16, v17 in pairs(v14) do
            v15 = v15 .. " [" .. v16 .. "=" .. string.sub(tostring(v17), 1, 4) .. "]";
        end;
        v12 = v12 .. v15;
    end;
    return v12;
end;
v4.OutputTest = function(v18)
    print("Test Output for {={" .. v18:Dump() .. "}=}");
    for v19, v20 in pairs(v18.TweenObjects) do
        print("TweenObject:", v19);
        for v21, v22 in pairs(v20) do
            print("\t[" .. v21 .. "=" .. string.sub(tostring(v22), 1, 4) .. "] Actual:" .. v19[v21]);
        end;
    end;
end;
v4.RegisterTweenObjectProperty = function(v23, v24, v25, v26)
    v26 = v26 or v24[v25];
    if not v23.TweenObjects[v24] then
        v23.TweenObjects[v24] = {};
    end;
    v23.TweenObjects[v24][v25] = v26;
    v23:SetObjectPropertyToPercentValue(v24, v25, v26, v23.InternalLastTweenPercentage);
end;
v4.UnregisterTweenObject = function(v27, v28)
    v27.TweenObjects[v28] = nil;
end;
v4.SetObjectPropertyToPercentValue = function(_, v30, v31, v32, v33)
    v30[v31] = v32 + (1 - v32) * v33;
end;
v4.SetPropertiesToTweenPercentage = function(v34, v35)
    for v36, v37 in pairs(v34.TweenObjects) do
        for v38, v39 in pairs(v37) do
            v34:SetObjectPropertyToPercentValue(v36, v38, v39, v35);
        end;
    end;
end;
v4.Tween = function(v40, v41, v42, v43)
    if not v40.Tweening then
        v40.Tweening = true;
        local l_v43_0 = v43;
        if not l_v43_0 then
            l_v43_0 = v40.InternalLastTweenPercentage;
        else
            v40:SetPropertiesToTweenPercentage(l_v43_0);
        end;
        local v45 = tick();
        local v46 = v45 + v41;
        local v47 = v42 - l_v43_0;
        local v48 = 0;
        spawn(function()
            local v49 = tick();
            while not (not (v49 < v46) or v40.Canceled) do
                v48 = math.min(math.max((v49 - v45) / v41, 0), 1);
                local v50 = l_v43_0 + v47 * v48;
                v40.InternalLastTweenPercentage = v50;
                v40:SetPropertiesToTweenPercentage(v50);
                l_RunService_0.RenderStepped:wait();
                v49 = tick();
            end;
            if v40.Canceled then
                v40.Canceled = false;
                if v40.TweenIsQueued then
                    v40.TweenIsQueued = false;
                    v40.Tweening = false;
                    v40:Tween(unpack(v40.QueuedTween));
                    return ;
                end;
            else
                v40.InternalLastTweenPercentage = v42;
                v40:SetPropertiesToTweenPercentage(v42);
            end;
            v40.Tweening = false;
        end);
        return ;
    else
        v40.QueuedTween = {
            v41, 
            v42, 
            v43
        };
        v40.TweenIsQueued = true;
        v40:CancelTween();
        return ;
    end;
end;
v4.CancelTween = function(v51)
    v51.Canceled = true;
end;
v0.new = function()
    local v52 = {};
    v52.MemoryLocation = tostring(v52):match("[0123456789ABCDEF]+");
    v52.TweenObjects = setmetatable({}, {
        __mode = "k"
    });
    v52.Transparency = nil;
    v52.InternalLastTweenPercentage = 0;
    v52.Tweening = false;
    v52.Canceled = false;
    v52.TweenIsQueued = false;
    v52.QueuedTween = {};
    return (setmetatable(v52, v4));
end;
return v0;

local function v0(...)
    return select("#", ...), {
        ...
    };
end;
local function v6(v1, ...)
    local v2, v3 = v0(...);
    local v4, v5 = v0(xpcall(function()
        return v1(unpack(v3, 1, v2));
    end, debug.traceback));
    return v4, v5;
end;
local function _(v7, v8, v9)
    return function(...)
        local v10, v11 = v6(v7, ...);
        if not v11[1] then
            v9(unpack(v11, 2, v10));
            return ;
        else
            v8(unpack(v11, 2, v10));
            return ;
        end;
    end;
end;
local function _(v13)
    return next(v13) == nil;
end;
local v15 = {};
v15.__index = v15;
v15.Status = {
    Started = "Started", 
    Resolved = "Resolved", 
    Rejected = "Rejected"
};
v15.new = function(v16)
    local v17 = {
        _source = debug.traceback(), 
        _type = "Promise", 
        _status = v15.Status.Started, 
        _values = nil, 
        _valuesLength = -1, 
        _unhandledRejection = false, 
        _queuedResolve = {}, 
        _queuedReject = {}
    };
    setmetatable(v17, v15);
    local function v18(...)
        v17:_resolve(...);
    end;
    local function v19(...)
        v17:_reject(...);
    end;
    local _, v21 = v6(v16, v18, v19);
    local v22 = v21[1];
    local v23 = v21[2];
    if not v22 and v17._status == v15.Status.Started then
        v19(v23);
    end;
    return v17;
end;
v15.resolve = function(v24)
    return v15.new(function(v25)
        v25(v24);
    end);
end;
v15.reject = function(v26)
    return v15.new(function(_, v28)
        v28(v26);
    end);
end;
v15.all = function(...)
    local v29 = {
        ...
    };
    if type(v29[1]) == "table" and v29[1]._type ~= "Promise" then
        v29 = v29[1];
    end;
    return v15.new(function(v30, v31)
        local v32 = false;
        local v33 = {};
        local v34 = 0;
        local v35 = 0;
        for _ in pairs(v29) do
            v35 = v35 + 1;
        end;
        local function _(v37, v38)
            if not v32 then
                v33[v37] = v38;
                v34 = v34 + 1;
                if v34 == v35 then
                    v30(v33);
                    v32 = true;
                end;
                return ;
            else
                return ;
            end;
        end;
        if v35 == 0 then
            v30(v33);
            v32 = true;
            return ;
        else
            for v40, v41 in pairs(v29) do
                if v41._status == v15.Status.Started then
                    v41:andThen(function(v42)
                        local l_v40_0 = v40;
                        if not v32 then
                            v33[l_v40_0] = v42;
                            v34 = v34 + 1;
                            if v34 == v35 then
                                v30(v33);
                                v32 = true;
                            end;
                            return ;
                        else
                            return ;
                        end;
                    end):catch(function(v44)
                        v32 = true;
                        v31(v44);
                    end);
                elseif v41._status == v15.Status.Resolved then
                    local v45 = unpack(v41._values);
                    if not v32 then
                        v33[v40] = v45;
                        v34 = v34 + 1;
                        if v34 == v35 then
                            v30(v33);
                            v32 = true;
                        end;
                    end;
                else
                    v41:catch(function(_)
                        v32 = true;
                        v31(unpack(v41._values));
                    end);
                end;
            end;
            return ;
        end;
    end);
end;
v15.is = function(v47)
    if type(v47) ~= "table" then
        return false;
    else
        return v47._type == "Promise";
    end;
end;
v15.promisify = function(v48)
    return function(...)
        local v49 = {
            ...
        };
        local v50 = select("#", ...);
        return v15.new(function(v51, v52)
            spawn(function()
                local l_status_0, l_result_0 = pcall(v48, unpack(v49, 1, v50));
                if not l_status_0 then
                    v52(l_result_0);
                    return ;
                else
                    v51(l_result_0);
                    return ;
                end;
            end);
        end);
    end;
end;
v15.getStatus = function(v55)
    return v55._status;
end;
v15.andThen = function(v56, v57, v58)
    v56._unhandledRejection = false;
    return v15.new(function(v59, v60)
        local l_v59_0 = v59;
        if v57 then
            local l_v57_0 = v57;
            local l_l_v57_0_0 = l_v57_0 --[[ copy: 3 -> 5 ]];
            l_v59_0 = function(...)
                local v64, v65 = v6(l_l_v57_0_0, ...);
                if not v65[1] then
                    v60(unpack(v65, 2, v64));
                    return ;
                else
                    v59(unpack(v65, 2, v64));
                    return ;
                end;
            end;
        end;
        local l_v60_0 = v60;
        if v58 then
            local l_v58_0 = v58;
            l_v60_0 = function(...)
                local v68, v69 = v6(l_v58_0, ...);
                if not v69[1] then
                    v60(unpack(v69, 2, v68));
                    return ;
                else
                    v59(unpack(v69, 2, v68));
                    return ;
                end;
            end;
        end;
        if v56._status == v15.Status.Started then
            table.insert(v56._queuedResolve, l_v59_0);
            table.insert(v56._queuedReject, l_v60_0);
            return ;
        elseif v56._status == v15.Status.Resolved then
            l_v59_0(unpack(v56._values, 1, v56._valuesLength));
            return ;
        else
            if v56._status == v15.Status.Rejected then
                l_v60_0(unpack(v56._values, 1, v56._valuesLength));
            end;
            return ;
        end;
    end);
end;
v15.catch = function(v70, v71)
    return v70:andThen(nil, v71);
end;
v15.await = function(v72)
    v72._unhandledRejection = false;
    if v72._status == v15.Status.Started then
        local v73 = nil;
        local v74 = nil;
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        v72:andThen(function(...)
            v73 = {
                ...
            };
            v74 = select("#", ...);
            l_BindableEvent_0:Fire(true);
        end, function(...)
            v73 = {
                ...
            };
            v74 = select("#", ...);
            l_BindableEvent_0:Fire(false);
        end);
        local v76 = l_BindableEvent_0.Event:Wait();
        l_BindableEvent_0:Destroy();
        return v76, unpack(v73, 1, v74);
    elseif v72._status == v15.Status.Resolved then
        return true, unpack(v72._values, 1, v72._valuesLength);
    elseif v72._status == v15.Status.Rejected then
        return false, unpack(v72._values, 1, v72._valuesLength);
    else
        return ;
    end;
end;
v15._resolve = function(v77, ...)
    if v77._status ~= v15.Status.Started then
        return ;
    else
        local v78 = select("#", ...);
        if not v15.is((...)) then
            v77._status = v15.Status.Resolved;
            v77._values = {
                ...
            };
            v77._valuesLength = v78;
            for _, v80 in ipairs(v77._queuedResolve) do
                v80(...);
            end;
            return ;
        else
            if v78 > 1 then
                warn((("When returning a Promise from andThen, extra arguments are " .. "discarded\n\n%s"):format(v77._source)));
            end;
            (...):andThen(function(...)
                v77:_resolve(...);
            end, function(...)
                v77:_reject(...);
            end);
            return ;
        end;
    end;
end;
v15._reject = function(v81, ...)
    if v81._status ~= v15.Status.Started then
        return ;
    else
        v81._status = v15.Status.Rejected;
        v81._values = {
            ...
        };
        v81._valuesLength = select("#", ...);
        if next(v81._queuedReject) == nil then
            v81._unhandledRejection = true;
            local v82 = tostring((...));
            spawn(function()
                if v81._unhandledRejection then
                    warn((("Unhandled promise rejection:\n\n%s\n\n%s"):format(v82, v81._source)));
                    return ;
                else
                    return ;
                end;
            end);
            return ;
        else
            for _, v84 in ipairs(v81._queuedReject) do
                v84(...);
            end;
            return ;
        end;
    end;
end;
return v15;

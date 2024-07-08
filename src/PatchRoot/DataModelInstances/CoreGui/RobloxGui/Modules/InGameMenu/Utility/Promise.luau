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
local function _(v15)
    assert(type(v15) == "string", "createSymbol requires `name` to be a string.");
    local v16 = newproxy(true);
    getmetatable(v16).__tostring = function()
        return ("Symbol(%s)"):format(v15);
    end;
    return v16;
end;
assert(true, "createSymbol requires `name` to be a string.");
local v18 = newproxy(true);
local v19 = getmetatable(v18);
local v20 = "PromiseMarker";
local l_v20_0 = v20 --[[ copy: 9 -> 13 ]];
v19.__tostring = function()
    return ("Symbol(%s)"):format(l_v20_0);
end;
local l_v18_0 = v18;
v18 = {
    prototype = {}
};
v18.__index = v18.prototype;
v19 = {};
assert(true, "createSymbol requires `name` to be a string.");
v20 = newproxy(true);
local v23 = getmetatable(v20);
local v24 = "Started";
local l_v24_0 = v24 --[[ copy: 12 -> 14 ]];
v23.__tostring = function()
    return ("Symbol(%s)"):format(l_v24_0);
end;
v19.Started = v20;
assert(true, "createSymbol requires `name` to be a string.");
v20 = newproxy(true);
v23 = getmetatable(v20);
v24 = "Resolved";
local l_v24_1 = v24 --[[ copy: 12 -> 15 ]];
v23.__tostring = function()
    return ("Symbol(%s)"):format(l_v24_1);
end;
v19.Resolved = v20;
assert(true, "createSymbol requires `name` to be a string.");
v20 = newproxy(true);
v23 = getmetatable(v20);
v24 = "Rejected";
v23.__tostring = function()
    return ("Symbol(%s)"):format(v24);
end;
v19.Rejected = v20;
v18.Status = v19;
v18.new = function(v27)
    local v28 = {
        _source = debug.traceback(), 
        [l_v18_0] = true, 
        _status = v18.Status.Started, 
        _values = nil, 
        _valuesLength = -1, 
        _unhandledRejection = false, 
        _queuedResolve = {}, 
        _queuedReject = {}
    };
    setmetatable(v28, v18);
    local function v29(...)
        v28:_resolve(...);
    end;
    local function v30(...)
        v28:_reject(...);
    end;
    local _, v32 = v6(v27, v29, v30);
    local v33 = v32[1];
    local v34 = v32[2];
    if not v33 and v28._status == v18.Status.Started then
        v30(v34);
    end;
    return v28;
end;
v18.resolve = function(v35)
    return v18.new(function(v36)
        v36(v35);
    end);
end;
v18.reject = function(v37)
    return v18.new(function(_, v39)
        v39(v37);
    end);
end;
v18.all = function(v40)
    if type(v40) ~= "table" then
        error("Please pass a list of promises to Promise.all", 2);
    end;
    if #v40 == 0 then
        return v18.resolve({});
    else
        for v41 = 1, #v40 do
            if not v18.is(v40[v41]) then
                error(("Non-promise value passed into Promise.all at index #%d"):format(v41), 2);
            end;
        end;
        return v18.new(function(v42, v43)
            local v44 = {};
            local v45 = 0;
            local function v47(v46, ...)
                v44[v46] = ...;
                v45 = v45 + 1;
                if v45 == #v40 then
                    v42(v44);
                end;
            end;
            for v48 = 1, #v40 do
                v40[v48]:andThen(function(...)
                    v47(v48, ...);
                end, function(...)
                    v43(...);
                end);
            end;
        end);
    end;
end;
v18.is = function(v49)
    if type(v49) ~= "table" then
        return false;
    else
        return v49[l_v18_0] == true;
    end;
end;
v18.prototype.getStatus = function(v50)
    return v50._status;
end;
v18.prototype.andThen = function(v51, v52, v53)
    v51._unhandledRejection = false;
    return v18.new(function(v54, v55)
        local l_v54_0 = v54;
        if v52 then
            local l_v52_0 = v52;
            local l_l_v52_0_0 = l_v52_0 --[[ copy: 3 -> 5 ]];
            l_v54_0 = function(...)
                local v59, v60 = v6(l_l_v52_0_0, ...);
                if not v60[1] then
                    v55(unpack(v60, 2, v59));
                    return ;
                else
                    v54(unpack(v60, 2, v59));
                    return ;
                end;
            end;
        end;
        local l_v55_0 = v55;
        if v53 then
            local l_v53_0 = v53;
            l_v55_0 = function(...)
                local v63, v64 = v6(l_v53_0, ...);
                if not v64[1] then
                    v55(unpack(v64, 2, v63));
                    return ;
                else
                    v54(unpack(v64, 2, v63));
                    return ;
                end;
            end;
        end;
        if v51._status == v18.Status.Started then
            table.insert(v51._queuedResolve, l_v54_0);
            table.insert(v51._queuedReject, l_v55_0);
            return ;
        elseif v51._status == v18.Status.Resolved then
            l_v54_0(unpack(v51._values, 1, v51._valuesLength));
            return ;
        else
            if v51._status == v18.Status.Rejected then
                l_v55_0(unpack(v51._values, 1, v51._valuesLength));
            end;
            return ;
        end;
    end);
end;
v18.prototype.catch = function(v65, v66)
    return v65:andThen(nil, v66);
end;
v18.prototype.await = function(v67)
    v67._unhandledRejection = false;
    if v67._status == v18.Status.Started then
        local v68 = nil;
        local v69 = nil;
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        v67:andThen(function(...)
            local v71, v72 = v0(...);
            v69 = v71;
            v68 = v72;
            l_BindableEvent_0:Fire(true);
        end, function(...)
            local v73, v74 = v0(...);
            v69 = v73;
            v68 = v74;
            l_BindableEvent_0:Fire(false);
        end);
        local v75 = l_BindableEvent_0.Event:Wait();
        l_BindableEvent_0:Destroy();
        return v75, unpack(v68, 1, v69);
    elseif v67._status == v18.Status.Resolved then
        return true, unpack(v67._values, 1, v67._valuesLength);
    elseif v67._status == v18.Status.Rejected then
        return false, unpack(v67._values, 1, v67._valuesLength);
    else
        error("Promise had an invalid status.");
        return ;
    end;
end;
v18.prototype._unwrap = function(v76)
    if v76._status == v18.Status.Started then
        error("Promise has not resolved or rejected.", 2);
    end;
    return v76._status == v18.Status.Resolved, unpack(v76._values, 1, v76._valuesLength);
end;
v18.prototype._resolve = function(v77, ...)
    if v77._status ~= v18.Status.Started then
        return ;
    elseif not v18.is((...)) then
        v77._status = v18.Status.Resolved;
        local v78, v79 = v0(...);
        v77._valuesLength = v78;
        v77._values = v79;
        for _, v81 in ipairs(v77._queuedResolve) do
            v81(...);
        end;
        return ;
    else
        if select("#", ...) > 1 then
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
v18.prototype._reject = function(v82, ...)
    if v82._status ~= v18.Status.Started then
        return ;
    else
        v82._status = v18.Status.Rejected;
        local v83, v84 = v0(...);
        v82._valuesLength = v83;
        v82._values = v84;
        if next(v82._queuedReject) == nil then
            v82._unhandledRejection = true;
            v83 = tostring((...));
            spawn(function()
                if v82._unhandledRejection then
                    warn((("Unhandled promise rejection:\n\n%s\n\n%s"):format(v83, v82._source)));
                    return ;
                else
                    return ;
                end;
            end);
            return ;
        else
            for _, v86 in ipairs(v82._queuedReject) do
                v86(...);
            end;
            return ;
        end;
    end;
end;
return v18;

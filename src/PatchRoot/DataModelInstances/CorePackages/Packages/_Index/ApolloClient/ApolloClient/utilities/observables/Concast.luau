local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v2.Boolean;
local l_Set_0 = v2.Set;
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local v7 = require(l_Parent_0.Promise);
local v8 = {};
local l_Observable_0 = require(script.Parent.Observable).Observable;
local l_iterateObserversSafely_0 = require(script.Parent.iteration).iterateObserversSafely;
local l_fixObservableSubclass_0 = require(script.Parent.subclassing).fixObservableSubclass;
local function _(v12)
    return l_Boolean_0.toJSBoolean(v12) and typeof(v12.andThen) == "function";
end;
local v14 = setmetatable({}, {
    __index = l_Observable_0
});
v14.__index = v14;
v14.new = function(v15)
    local v16 = nil;
    v16 = setmetatable(l_Observable_0.new(function(v17)
        v16:addObserver(v17);
        return function()
            return v16:removeObserver(v17);
        end;
    end), v14);
    v16.observers = l_Set_0.new();
    v16.sub = v8;
    v16.source = {};
    v16.latest = nil;
    v16.addCount = 0;
    v16.promise = v7.new(function(v18, v19)
        v16.resolve = function(_, ...)
            v18(...);
        end;
        v16.reject = function(_, ...)
            v19(...);
        end;
    end);
    v16.handlers = {
        next = function(_, v23)
            if v16.sub ~= nil then
                v16.latest = {
                    "next", 
                    v23
                };
                l_iterateObserversSafely_0(v16.observers, "next", v23);
            end;
        end, 
        error = function(_, v25)
            local l_sub_0 = v16.sub;
            if l_sub_0 ~= nil then
                if l_Boolean_0.toJSBoolean(l_sub_0) then
                    v7.delay(0):andThen(function()
                        return l_sub_0:unsubscribe();
                    end);
                end;
                v16.sub = nil;
                v16.latest = {
                    "error", 
                    v25
                };
                v16:reject(v25);
                l_iterateObserversSafely_0(v16.observers, "error", v25);
            end;
        end, 
        complete = function(_)
            if v16.sub ~= nil then
                local v28 = table.remove(v16.sources, 1);
                if l_Boolean_0.toJSBoolean(v28) then
                    if not (l_Boolean_0.toJSBoolean(v28) and typeof(v28.andThen) == "function") then
                        v16.sub = v28:subscribe(v16.handlers);
                    else
                        v28:andThen(function(v29)
                            v16.sub = v29:subscribe(v16.handlers);
                        end);
                        return ;
                    end;
                else
                    v16.sub = nil;
                    if v16.latest ~= nil and v16.latest[1] == "next" then
                        v16:resolve(v16.latest[2]);
                    else
                        v16:resolve();
                    end;
                    l_iterateObserversSafely_0(v16.observers, "complete");
                    return ;
                end;
            end;
        end
    };
    v16.cancel = function(_, v31)
        v16:reject(v31);
        v16.sources = {};
        v16.handlers:complete();
    end;
    v16.promise:catch(function()
    end);
    if typeof(v15) == "function" then
        v15 = {
            l_Observable_0.new(v15)
        };
    end;
    local l_v15_0 = v15;
    if not (l_Boolean_0.toJSBoolean(l_v15_0) and typeof(l_v15_0.andThen) == "function") then
        v16:start(v15);
    else
        v15:andThen(function(v33)
            v16:start(v33);
        end, function(...)
            v16.handlers:error(...);
        end);
    end;
    return v16;
end;
v14.start = function(v34, v35)
    if v34.sub ~= v8 then
        return ;
    else
        v34.sources = l_Array_0.from(v35);
        v34.handlers:complete();
        return ;
    end;
end;
v14.deliverLastMessage = function(v36, v37)
    if l_Boolean_0.toJSBoolean(v36.latest) then
        local v38 = v36.latest[1];
        local v39 = v37[v38];
        if l_Boolean_0.toJSBoolean(v39) then
            v39(v37, v36.latest[2]);
        end;
        if (v36.sub == nil and v38 == "next") and v37.complete ~= nil then
            v37:complete();
        end;
    end;
end;
v14.addObserver = function(v40, v41)
    if not v40.observers:has(v41) then
        v40:deliverLastMessage(v41);
        v40.observers:add(v41);
        v40.addCount = v40.addCount + 1;
    end;
end;
v14.removeObserver = function(v42, v43, v44)
    if v42.observers:delete(v43) then
        v42.addCount = v42.addCount - 1;
        if not (not (v42.addCount < 1) or v44) then
            v42.handlers:error(l_Error_0.new("Observable cancelled prematurely"));
        end;
    end;
end;
v14.cleanup = function(v45, v46)
    local v47 = false;
    local v48 = nil;
    local function v49()
        if not v47 then
            v47 = true;
            v45.observers:delete(v48);
            v46();
        end;
    end;
    v48 = {
        next = v49, 
        error = v49, 
        complete = v49
    };
    local l_addCount_0 = v45.addCount;
    v45:addObserver(v48);
    v45.addCount = l_addCount_0;
end;
v14.of = function(...)
    return l_Observable_0.of(v14, ...);
end;
v14.from = function(...)
    return l_Observable_0.from(v14, ...);
end;
v0.Concast = v14;
l_fixObservableSubclass_0(v14);
return v0;

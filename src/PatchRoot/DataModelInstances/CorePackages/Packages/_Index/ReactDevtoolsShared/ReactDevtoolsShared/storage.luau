local v0 = {};
if _G.__LOCALSTORAGE__ == nil then
    _G.__LOCALSTORAGE__ = {};
end;
if _G.__SESSIONSTORAGE__ == nil then
    _G.__SESSIONSTORAGE__ = {};
end;
local l___LOCALSTORAGE___0 = _G.__LOCALSTORAGE__;
local l___SESSIONSTORAGE___0 = _G.__SESSIONSTORAGE__;
v0.localStorageGetItem = function(v3)
    return l___LOCALSTORAGE___0[v3];
end;
v0.localStorageRemoveItem = function(v4)
    l___LOCALSTORAGE___0[v4] = nil;
end;
v0.localStorageSetItem = function(v5, v6)
    l___LOCALSTORAGE___0[v5] = v6;
end;
v0.sessionStorageGetItem = function(v7)
    return l___SESSIONSTORAGE___0[v7];
end;
v0.sessionStorageRemoveItem = function(v8)
    l___SESSIONSTORAGE___0[v8] = nil;
end;
v0.sessionStorageSetItem = function(v9, v10)
    l___SESSIONSTORAGE___0[v9] = v10;
end;
return v0;

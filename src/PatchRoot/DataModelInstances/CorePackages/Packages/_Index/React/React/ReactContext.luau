local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_REACT_PROVIDER_TYPE_0 = l_ReactSymbols_0.REACT_PROVIDER_TYPE;
local l_REACT_CONTEXT_TYPE_0 = l_ReactSymbols_0.REACT_CONTEXT_TYPE;
return {
    createContext = function(v5, v6)
        local v7 = {
            ["$$typeof"] = l_REACT_CONTEXT_TYPE_0, 
            _calculateChangedBits = v6, 
            _currentValue = v5, 
            _currentValue2 = v5, 
            _threadCount = 0, 
            Provider = nil, 
            Consumer = nil, 
            displayName = nil, 
            _currentRenderer = nil, 
            _currentRenderer2 = nil
        };
        v7.Provider = {
            ["$$typeof"] = l_REACT_PROVIDER_TYPE_0, 
            _context = v7
        };
        local v8 = false;
        if not _G.__DEV__ then
            v7.Consumer = v7;
        else
            local v9 = {
                ["$$typeof"] = l_REACT_CONTEXT_TYPE_0, 
                _context = v7, 
                _calculateChangedBits = v7._calculateChangedBits
            };
            setmetatable(v9, {
                __index = function(_, v11)
                    if v11 == "_currentValue" then
                        return v7._currentValue;
                    elseif v11 == "_currentValue2" then
                        return v7._currentValue2;
                    elseif v11 == "_threadCount" then
                        return v7._threadCount;
                    elseif v11 == "displayName" then
                        return v7.displayName;
                    else
                        return nil;
                    end;
                end, 
                __newindex = function(_, v13, v14)
                    if v13 == "_currentValue" then
                        v7._currentValue = v14;
                        return ;
                    elseif v13 == "_currentValue2" then
                        v7._currentValue2 = v14;
                        return ;
                    elseif v13 == "_threadCount" then
                        v7._threadCount = v14;
                        return ;
                    else
                        if not (not (v13 == "displayName") or v8) then
                            l_console_0.warn("Setting `displayName` on Context.Consumer has no effect. " .. "You should set it directly on the context with Context.displayName = " .. v14 .. ".");
                            v8 = true;
                        end;
                        return ;
                    end;
                end
            });
            v7.Consumer = v9;
        end;
        if _G.__DEV__ then
            v7._currentRenderer = nil;
            v7._currentRenderer2 = nil;
        end;
        return v7;
    end
};

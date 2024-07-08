local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_inspect_0 = require(l_Parent_0.LuauPolyfill).util.inspect;
local _ = require(l_Parent_0.Shared);
local l_REACT_LAZY_TYPE_0 = require(l_Parent_0.Shared).ReactSymbols.REACT_LAZY_TYPE;
lazyInitializer = function(v5)
    if v5._status == -1 then
        local v6 = v5._result();
        v5._status = 0;
        v5._result = v6;
        v6:andThen(function(v7)
            if v5._status == 0 then
                local l_default_0 = v7.default;
                if _G.__DEV__ and l_default_0 == nil then
                    l_console_0.error("lazy: Expected the result of a dynamic import() call. " .. "Instead received: `%s`\n\nYour code should look like: \n  " .. "local MyComponent = lazy(function() return req" .. "quire(script.Parent.MyComponent) end)", l_inspect_0(v7));
                end;
                local l_v5_0 = v5;
                l_v5_0._status = 1;
                l_v5_0._result = l_default_0;
            end;
        end, function(v10)
            if v5._status == 0 then
                local l_v5_1 = v5;
                l_v5_1._status = 2;
                l_v5_1._result = v10;
            end;
        end);
    end;
    if v5._status == 1 then
        return v5._result;
    else
        error(v5._result);
        return ;
    end;
end;
return {
    lazy = function(v12)
        local v13 = {
            ["$$typeof"] = l_REACT_LAZY_TYPE_0, 
            _payload = {
                _status = -1, 
                _result = v12
            }, 
            _init = lazyInitializer
        };
        if _G.__DEV__ then
            local v14 = nil;
            local v15 = nil;
            do
                local l_v14_0, l_v15_0 = v14, v15;
                setmetatable(v13, {
                    __index = function(_, v19)
                        if v19 == "defaultProps" then
                            return l_v14_0;
                        elseif v19 == "propTypes" then
                            return l_v15_0;
                        else
                            return ;
                        end;
                    end, 
                    __newindex = function(v20, v21, v22)
                        if v21 == "defaultProps" then
                            l_console_0.error("React.lazy(...): It is not supported to assign `defaultProps` to " .. "a lazy component import. Either specify them where the component " .. "is defined, or create a wrapping component around it.");
                            l_v14_0 = v22;
                            setmetatable(v20, {
                                __index = function()
                                end, 
                                __newindex = function()
                                end
                            });
                        end;
                        if v21 == "propTypes" then
                            l_console_0.error("React.lazy(...): It is not supported to assign `propTypes` to " .. "a lazy component import. Either specify them where the component " .. "is defined, or create a wrapping component around it.");
                            l_v15_0 = v22;
                            setmetatable(v20, {
                                __index = function()
                                end, 
                                __newindex = function()
                                end
                            });
                        end;
                    end
                });
            end;
        end;
        return v13;
    end
};

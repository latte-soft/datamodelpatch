local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local _ = require(l_Parent_0.Shared);
local l_REACT_FORWARD_REF_TYPE_0 = l_ReactSymbols_0.REACT_FORWARD_REF_TYPE;
local l_REACT_MEMO_TYPE_0 = l_ReactSymbols_0.REACT_MEMO_TYPE;
return {
    forwardRef = function(v6)
        if _G.__DEV__ then
            if typeof(v6) == "table" and v6["$$typeof"] == l_REACT_MEMO_TYPE_0 then
                l_console_0.error("forwardRef requires a render function but received a `memo` " .. "component. Instead of forwardRef(memo(...)), use " .. "memo(forwardRef(...)).");
            elseif typeof(v6) ~= "function" then
                l_console_0.error("forwardRef requires a render function but was given %s.", (typeof(v6)));
            else
                local v7, _ = debug.info(v6, "a");
                if v7 ~= 0 and v7 ~= 2 then
                    l_console_0.error("forwardRef render functions accept exactly two parameters: props and ref. %s", v7 == 1 and "Did you forget to use the ref parameter?" or "Any additional parameter will be undefined.");
                end;
            end;
        end;
        local v9 = {
            ["$$typeof"] = l_REACT_FORWARD_REF_TYPE_0, 
            render = v6
        };
        if _G.__DEV__ then
            local v10 = nil;
            do
                local l_v10_0 = v10;
                setmetatable(v9, {
                    __index = function(v12, v13)
                        if v13 == "displayName" then
                            return l_v10_0;
                        else
                            return (rawget(v12, v13));
                        end;
                    end, 
                    __newindex = function(v14, v15, v16)
                        if v15 == "displayName" then
                            l_v10_0 = v16;
                            return ;
                        else
                            rawset(v14, v15, v16);
                            return ;
                        end;
                    end
                });
            end;
        end;
        return v9;
    end
};

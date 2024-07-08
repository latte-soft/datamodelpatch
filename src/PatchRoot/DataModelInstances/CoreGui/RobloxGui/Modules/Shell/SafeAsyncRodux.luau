return function(v0)
    local v1 = {};
    local v2 = nil;
    local l_asyncFunc_0 = v0.asyncFunc;
    assert(type(l_asyncFunc_0) == "function", "Must init with an async function.");
    local l_userRelated_0 = v0.userRelated;
    local l_callback_0 = v0.callback;
    local v6 = v0.retries or 0;
    local v7 = v0.retryFunc or function()
        return false;
    end;
    local v9 = v0.waitFunc or function(v8)
        wait(v8 * v8);
    end;
    local v10 = false;
    v1.Cancel = function(_)
        v10 = true;
    end;
    setmetatable(v1, {
        __call = function(_, v13, ...)
            assert(type(v13) == "table", "Must call with the store.");
            local v14 = {};
            v2 = v14;
            local l_RobloxUser_0 = v13:getState().RobloxUser;
            local function _()
                if v2 ~= v14 then
                    return true;
                elseif l_userRelated_0 and l_RobloxUser_0 ~= v13:getState().RobloxUser then
                    return true;
                elseif not v10 then
                    return ;
                else
                    return true;
                end;
            end;
            local v17 = {
                l_asyncFunc_0(v13, ...)
            };
            local v18 = 1;
            local v19 = (v2 ~= v14 or l_userRelated_0 and l_RobloxUser_0 ~= v13:getState().RobloxUser) or (v10 and true or nil);
            while not (not (not v19 and v18 <= v6) or not v7(v13, unpack(v17))) do
                v9(v18);
                v18 = v18 + 1;
                v19 = (v2 ~= v14 or l_userRelated_0 and l_RobloxUser_0 ~= v13:getState().RobloxUser) or (v10 and true or nil);
                if not v19 then
                    v17 = {
                        l_asyncFunc_0(v13, ...)
                    };
                    if v2 ~= v14 then
                        v19 = true;
                    elseif l_userRelated_0 and l_RobloxUser_0 ~= v13:getState().RobloxUser then
                        v19 = true;
                    elseif not v10 then
                        v19 = nil;
                    else
                        v19 = true;
                    end;
                end;
            end;
            if not v19 and type(l_callback_0) == "function" then
                l_callback_0(v13, unpack(v17));
            end;
        end
    });
    return v1;
end;

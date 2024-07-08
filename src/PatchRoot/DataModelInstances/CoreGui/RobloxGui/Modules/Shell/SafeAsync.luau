local v0 = nil;
pcall(function()
    v0 = game:GetService("ThirdPartyUserService");
end);
local v1 = nil;
if v0 then
    v0.ActiveUserSignedOut:connect(function()
        v1 = {};
    end);
end;
return function(v2)
    local v3 = {};
    local v4 = nil;
    local l_asyncFunc_0 = v2.asyncFunc;
    assert(type(l_asyncFunc_0) == "function", "Must init with an async function.");
    local l_userRelated_0 = v2.userRelated;
    local l_callback_0 = v2.callback;
    local v8 = false;
    local v9 = v2.retries or 0;
    local v10 = v2.retryFunc or function()
        return false;
    end;
    local v12 = v2.waitFunc or function(v11)
        wait(v11 * v11);
    end;
    v3.Cancel = function(_)
        v8 = true;
    end;
    setmetatable(v3, {
        __call = function(_, ...)
            local v15 = {};
            v4 = v15;
            local l_v1_0 = v1;
            local function _()
                if v4 ~= v15 then
                    return true;
                elseif l_userRelated_0 and l_v1_0 ~= v1 then
                    return true;
                elseif not v8 then
                    return ;
                else
                    return true;
                end;
            end;
            local v18 = {
                l_asyncFunc_0(...)
            };
            local v19 = 1;
            local v20 = (v4 ~= v15 or l_userRelated_0 and l_v1_0 ~= v1) or (v8 and true or nil);
            while not (not (not v20 and v19 <= v9) or not v10(unpack(v18))) do
                v12(v19);
                v19 = v19 + 1;
                v20 = (v4 ~= v15 or l_userRelated_0 and l_v1_0 ~= v1) or (v8 and true or nil);
                if not v20 then
                    v18 = {
                        l_asyncFunc_0(...)
                    };
                    if v4 ~= v15 then
                        v20 = true;
                    elseif l_userRelated_0 and l_v1_0 ~= v1 then
                        v20 = true;
                    elseif not v8 then
                        v20 = nil;
                    else
                        v20 = true;
                    end;
                end;
            end;
            if not v20 and type(l_callback_0) == "function" then
                l_callback_0(unpack(v18));
            end;
        end
    });
    return v3;
end;

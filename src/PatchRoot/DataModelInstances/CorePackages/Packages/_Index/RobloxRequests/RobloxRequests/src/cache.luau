local l_MessagingService_0 = game:GetService("MessagingService");
local l_DataStoreService_0 = game:GetService("DataStoreService");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(script.Parent.json);
local v4 = l_RunService_0:IsStudio();
local function v5(...)
    print("[http]", ...);
end;
local v6 = {
    settings = {}, 
    max_size = math.huge, 
    data = {}
};
v6.update_settings = function(v7, v8)
    v7 = type(v7) == "table" and v7 or {
        v7
    };
    local _ = {};
    local v10 = 0;
    while v10 < #v7 do
        v10 = v10 + 1;
        local v11 = v7[v10];
        if v11:sub(1, 7) == "http://" then
            v7[v10] = v11:sub(8);
            v11 = v7[v10];
        elseif v11:sub(1, 8) == "https://" then
            v7[v10] = v11:sub(9);
            v11 = v7[v10];
        end;
        if v11:sub(1, 2) == "*." then
            table.insert(v7, v11:sub(3));
        end;
        if not v11:find("/") then
            table.insert(v7, v11 .. "/");
            table.insert(v7, v11 .. "/*");
        end;
    end;
    for _, v13 in ipairs(v7) do
        v6.settings[v13] = v8;
        if not (not (v8.cache_locally == false) or v8.cache_globally) then
            v6.settings[v13] = nil;
        end;
    end;
end;
v6.cache_locally = function(v14, v15)
    v15 = v15 or {};
    v15.cache_globally = false;
    v6.update_settings(v14, v15);
end;
v6.cache_globally = function(v16, v17)
    v17 = v17 or {};
    v17.cache_globally = true;
    v6.update_settings(v16, v17);
end;
v6.should_cache = function(v18)
    v18 = v18:split("?")[1];
    for v19, _ in pairs(v6.settings) do
        if v18:match(".*://" .. v19:gsub("%*", ".*")) then
            return v19;
        end;
    end;
    return false;
end;
v6.is_cached = function(v21, v22)
    local v23 = v6.should_cache(v21);
    local v24 = v6.settings[v23];
    if v23 then
        if v6.data[v22] ~= nil then
            if v24.expires and v24.expires < tick() - v6.data[v22].timestamp then
                return false;
            else
                return true;
            end;
        elseif not v6.settings[v23].cache_globally then
            return false;
        elseif not v6.global_cache_index[v22] then
            return false;
        else
            return true;
        end;
    else
        return false;
    end;
end;
v6.global_cache_index = {};
local v25 = {};
local l_status_0, l_result_0 = pcall(function()
    return l_DataStoreService_0:GetDataStore("HttpRequestsCache");
end);
if l_status_0 then
    local l_status_1, l_result_1 = pcall(function()
        return l_result_0:GetAsync("index") or {};
    end);
    if l_status_1 then
        v6.global_cache_index = l_result_1;
        v6.global_cache_update_interval = 20;
        coroutine.wrap(function()
            while wait(v6.global_cache_update_interval) do
                pcall(function()
                    local v30 = 0;
                    for v31, v32 in pairs(v25) do
                        l_result_0:SetAsync(v31, v32);
                        v30 = v30 + 1;
                    end;
                    if v30 > 0 then
                        v5(("pushing %s requests to global cache index"):format(v30));
                    end;
                    local v33 = {};
                    l_result_0:UpdateAsync("index", function(v34)
                        v34 = v34 or {};
                        for v35, _ in pairs(v25) do
                            table.insert(v33, v35);
                            v34[v35] = true;
                            v6.global_cache_index[v35] = true;
                        end;
                        return v34;
                    end);
                    if not v4 then
                        l_MessagingService_0:PublishAsync("RequestsCacheIndex", v3.enc(v33));
                    end;
                    v25 = {};
                end);
            end;
        end)();
        if not v4 then
            l_MessagingService_0:SubscribeAsync("RequestsCacheIndex", function(v37)
                for _, v39 in ipairs((v3.dec(v37.Data))) do
                    v6.global_cache_index[v39] = true;
                end;
            end);
        end;
    end;
end;
v6.get_expire = function(v40)
    return v6.settings[v6.should_cache(v40)].expires or math.huge;
end;
v6.get_cached = function(v41, v42)
    local v43 = v6.should_cache(v41);
    local v44 = v6.data[v42];
    if not v44 then
        if not l_status_0 or not v6.settings[v43].cache_globally then
            return ;
        else
            v5("accessing datastore cache for", v42);
            return l_result_0:GetAsync(v42), "global";
        end;
    else
        return v44, "local";
    end;
end;
v6.update_cache = function(v45, v46, v47)
    print(("[http] %s added to cache"):format(v45));
    v47.timestamp = tick();
    v6.data[v46] = v47;
    local v48 = v6.should_cache(v45);
    if not l_status_0 or not v6.settings[v48].cache_globally then
        return ;
    else
        v5("queued", v46);
        v25[v46] = v47;
        return ;
    end;
end;
return v6;

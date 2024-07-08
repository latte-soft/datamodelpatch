local v0 = require(script.Parent.Parent.Parent.Roact);
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    local v3 = {};
    setmetatable(v3, {
        __index = v1
    });
    v3.callback = v2;
    v3.connected = true;
    v3.isMock = 231;
    return v3;
end;
v1.Fire = function(v4, v5)
    if v4.connected then
        v4.callback(v5);
    end;
end;
v1.Disconnect = function(v6)
    v6.connected = false;
end;
local v7 = {};
v7.__index = v7;
v7.new = function()
    local v8 = {};
    setmetatable(v8, {
        __index = v7
    });
    v8.connections = {};
    return v8;
end;
v7.Connect = function(v9, v10)
    local v11 = v1.new(v10);
    table.insert(v9.connections, v11);
    return v11;
end;
v7.Fire = function(v12, v13)
    for _, v15 in v12.connections, nil, nil do
        v15:Fire(v13);
    end;
end;
local v16 = {};
v16.__index = v16;
v16.new = function(v17, v18, v19)
    local v20 = {};
    setmetatable(v20, {
        __index = v16
    });
    v20.mockContentProviderProceedWithLoad = false;
    v20.contentResolved = false;
    v20.assetFetchStatuses = {};
    v20.signals = {};
    v20.preloadAsyncCalled = false;
    v20.isMock = true;
    v20.ultimatelySuccessfulContentIds = v17 or {};
    v20.ultimatelyTimedOutContentIds = v18 or {};
    v20.ultimatelyFailedContentIds = v19 or {};
    return v20;
end;
v16.mockReload = function(v21, v22, v23)
    v21.mockContentProviderProceedWithLoad = false;
    v21:_staggeredProgress(nil, v22, v23 or Enum.AssetFetchStatus.Success);
end;
v16.proceedWithLoad = function(v24)
    v24.mockContentProviderProceedWithLoad = true;
    v0.act(function()
        task.wait(0.1);
    end);
end;
v16._setAssetFetchStatus = function(v25, v26, v27)
    v25.assetFetchStatuses[v26] = v27;
    if v25.signals[v26] then
        v25.signals[v26]:Fire(v27);
    end;
end;
v16._staggeredProgress = function(v28, v29, v30, v31)
    v28.contentResolved = false;
    task.spawn(function()
        while true do
            if not v28.mockContentProviderProceedWithLoad then
                goto label0;
            end;
            if not v28.contentResolved then
                v28:_setAssetFetchStatus(v30, Enum.AssetFetchStatus.Loading);
                if v29 then
                    v29(v30, Enum.AssetFetchStatus.Loading);
                end;
                v28.contentResolved = true;
                v28.mockContentProviderProceedWithLoad = false;
            else
                break;
            end;
            ::label0::;
            task.wait();
        end;
        v28:_setAssetFetchStatus(v30, v31);
        if v29 then
            v29(v30, v31);
        end;
        v28.mockContentProviderProceedWithLoad = false;
    end);
end;
v16._makeMockSignal = function(_)
    return (v7.new());
end;
v16.GetAssetFetchStatusChangedSignal = function(v33, v34)
    if v33.signals[v34] == nil then
        v33.signals[v34] = v33:_makeMockSignal();
    end;
    return v33.signals[v34];
end;
v16.GetAssetFetchStatus = function(v35, v36)
    if v35.assetFetchStatuses[v36] ~= nil then
        return v35.assetFetchStatuses[v36];
    else
        return Enum.AssetFetchStatus.None;
    end;
end;
v16.PreloadAsync = function(v37, v38, v39)
    v37.preloadAsyncCalled = true;
    for _, v41 in ipairs(v38) do
        if not v37.ultimatelySuccessfulContentIds[v41] then
            if not v37.ultimatelyTimedOutContentIds[v41] then
                if not v37.ultimatelyFailedContentIds[v41] then
                    task.delay(0, function()
                        v37:_setAssetFetchStatus(v41, Enum.AssetFetchStatus.Success);
                        if v39 then
                            v39(v41, Enum.AssetFetchStatus.Success);
                        end;
                    end);
                else
                    v37:_staggeredProgress(v39, v41, Enum.AssetFetchStatus.Failure);
                end;
            else
                v37:_staggeredProgress(v39, v41, Enum.AssetFetchStatus.TimedOut);
            end;
        else
            v37:_staggeredProgress(v39, v41, Enum.AssetFetchStatus.Success);
        end;
    end;
end;
return v16;

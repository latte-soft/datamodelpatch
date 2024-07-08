local v0 = require(script.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_Set_0 = v0.Set;
local l_Symbol_0 = v0.Symbol;
local v4 = {};
local v5 = {};
v5.__index = v5;
v5.new = function()
    local v6 = {
        _mockState = {}, 
        _mockConfigRegistry = {}, 
        _invocationCallCounter = 1, 
        _spyState = l_Set_0.new()
    };
    setmetatable(v6, v5);
    return v6;
end;
v5._ensureMockConfig = function(v7, v8)
    local v9 = v7._mockConfigRegistry[v8];
    if not v9 then
        v9 = v7:_defaultMockConfig();
        v7._mockConfigRegistry[v8] = v9;
    end;
    return v9;
end;
v5._ensureMockState = function(v10, v11)
    local v12 = v10._mockState[v11];
    if not v12 then
        v12 = v10:_defaultMockState();
        v10._mockState[v11] = v12;
    end;
    if #v12.calls > 0 then
        v12.lastCall = v12.calls[#v12.calls];
    end;
    return v12;
end;
v5._defaultMockConfig = function(_)
    return {
        mockImpl = nil, 
        mockName = "jest.fn()", 
        specificMockImpls = {}, 
        specificReturnValues = {}
    };
end;
v5._defaultMockState = function(_)
    return {
        calls = {}, 
        contexts = {}, 
        instances = {}, 
        invocationCallOrder = {}, 
        results = {}
    };
end;
v5._makeComponent = function(v15, v16, v17)
    if v16.type == "function" then
        local v28 = setmetatable({}, {
            __call = function(v18, ...)
                local v19 = {
                    ...
                };
                local v20 = v15:_ensureMockState(v18);
                local v21 = v15:_ensureMockConfig(v18);
                table.insert(v20.instances, v18);
                table.insert(v20.contexts, v19[1]);
                for v22 = 1, select("#", ...) do
                    if v19[v22] == nil then
                        v19[v22] = l_Symbol_0.for_("$$nil");
                    end;
                end;
                table.insert(v20.calls, v19);
                local v23 = {
                    type = "incomplete", 
                    value = nil
                };
                table.insert(v20.results, v23);
                table.insert(v20.invocationCallOrder, v15._invocationCallCounter);
                v15._invocationCallCounter = v15._invocationCallCounter + 1;
                local l_status_0, l_result_0 = pcall(function(v24)
                    local v25 = l_Array_0.shift(v21.specificMockImpls);
                    if v25 == nil then
                        v25 = v21.mockImpl;
                    end;
                    if not v25 then
                        return nil;
                    else
                        return v25(unpack(v24));
                    end;
                end, {
                    ...
                });
                if not l_status_0 then
                    v23.type = "throw";
                    v23.value = l_result_0;
                    error(l_result_0);
                end;
                v23.type = "return";
                v23.value = l_result_0;
                return l_result_0;
            end
        });
        v28._isMockFunction = true;
        v28.getMockImplementation = function()
            return v15:_ensureMockConfig(v28).mockImpl;
        end;
        if typeof(v17) == "function" then
            v15._spyState.add(v17);
        end;
        v15._mockState[v28] = v15._defaultMockState();
        v15._mockConfigRegistry[v28] = v15._defaultMockConfig();
        v28.mock = setmetatable({}, {
            __index = function(_, v30)
                return v15:_ensureMockState(v28)[v30];
            end
        });
        v28.mockClear = function()
            v15._mockState[v28] = nil;
            return v28;
        end;
        v28.mockReset = function()
            v28.mockClear();
            v15._mockConfigRegistry[v28] = nil;
            return v28;
        end;
        v28.mockRestore = function()
            v28.mockReset();
            if not v17 then
                return nil;
            else
                return v17();
            end;
        end;
        v28.mockImplementationOnce = function(v31)
            table.insert(v15:_ensureMockConfig(v28).specificMockImpls, v31);
            return v28;
        end;
        v28.mockImplementation = function(v32)
            v15:_ensureMockConfig(v28).mockImpl = v32;
            return v28;
        end;
        v28.mockReturnValueOnce = function(v33)
            return v28.mockImplementationOnce(function()
                return v33;
            end);
        end;
        v28.mockReturnValue = function(v34)
            return v28.mockImplementation(function()
                return v34;
            end);
        end;
        v28.mockReturnThis = function()
            return v28.mockImplementation(function(_)
                return v28;
            end);
        end;
        v28.mockName = function(v36)
            if v36 then
                v15:_ensureMockConfig(v28).mockName = v36;
            end;
            return v28;
        end;
        v28.getMockName = function()
            return v15:_ensureMockConfig(v28).mockName or "jest.fn()";
        end;
        v28.new = function(...)
            v28(...);
            return v28;
        end;
        if v16.mockImpl then
            v28.mockImplementation(v16.mockImpl);
        end;
        return v28;
    else
        error("Call to _makeComponent with non-function");
        return ;
    end;
end;
v5._createMockFunction = function(_, v38, v39)
    if v38.name then
        return v39;
    else
        return v39;
    end;
end;
v5.isMockFunction = function(_, v41)
    local v42 = false;
    if typeof(v41) == "table" then
        v42 = v41._isMockFunction == true;
    end;
    return v42;
end;
v5.fn = function(v43, v44)
    local v45 = v43:_makeComponent({
        length = 0, 
        type = "function"
    });
    if v44 then
        v45.mockImplementation(v44);
    end;
    return v45, function(...)
        return getmetatable(v45).__call(v45, ...);
    end;
end;
v5.clearAllMocks = function(v46)
    v46._mockState = {};
end;
v5.resetAllMocks = function(v47)
    v47._mockConfigRegistry = {};
    v47._mockState = {};
end;
v5.restoreAllMocks = function(v48)
    for v49, _ in ipairs(v48._spyState) do
        v49();
    end;
    v48._spyState = l_Set_0.new();
end;
v5.mocked = function(_, v52, _)
    return v52;
end;
v4.ModuleMocker = v5;
local v54 = v5.new();
v4.fn = function(v55)
    return v54:fn(v55);
end;
v4.mocked = v54.mocked;
return v4;

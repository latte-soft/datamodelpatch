local l_RunService_0 = game:GetService("RunService");
local l_IXPService_0 = game:GetService("IXPService");
local v2 = require(script.Parent.Roact);
local v3 = require(script.Parent.t);
local v4 = require(script.Parent.Cryo);
local v5 = require(script.Symbol);
local v6 = require(script.ExperimentContext);
local v7 = v5.named("IxpServiceProp");
local function v12(v8)
    assert(v3.table(v8));
    if l_IXPService_0 ~= nil then
        if l_RunService_0:IsStudio() then
            l_IXPService_0:ClearUserLayers();
        end;
        local v9 = {};
        for _, v11 in pairs(v8) do
            table.insert(v9, v11);
        end;
        l_IXPService_0:RegisterUserLayers(v9);
    end;
end;
local function v14(v13)
    if l_IXPService_0 ~= nil then
        l_IXPService_0:InitializeUserLayers(v13);
    end;
end;
local function v15()
    if l_IXPService_0 ~= nil then
        l_IXPService_0:ClearUserLayers();
    end;
end;
local function v48(v16, v17, v18, v19, v20)
    assert(v3.string(v16));
    assert(v3.string(v17));
    assert(v3.string(v18));
    assert(v3.string(v19));
    assert(v3.string(v20));
    return function(v21, v22, v23)
        if v23 == nil then
            v23 = true;
        end;
        local v24 = debug.traceback();
        assert(type(v21) == "table", "connect expects layerNames to be a list of layers");
        assert(type(v22) == "function", "connect expects mapLayersToProps to be a function");
        return function(v25)
            if v25 == nil then
                error(string.format("connect returns a function that must be passed a component.\n " .. "Check the connection at:\n %s", v24), 2);
            end;
            local v26 = v2.PureComponent:extend((("AppExperiment(%s)"):format((tostring(v25)))));
            v26.init = function(v27)
                v27.onLoadingStatusChangeConnection = nil;
                v27.state = {
                    layerToVariables = {}, 
                    layerLoadingStatus = Enum.IXPLoadingStatus.None
                };
                v27.updateStateLayerData = function(v28)
                    local v29 = v27.props[v7];
                    if v29 ~= nil then
                        local v30 = {};
                        for _, v32 in ipairs(v21) do
                            v30[v32] = v29[v18](v29, v32);
                        end;
                        v27:setState({
                            layerToVariables = v30, 
                            layerLoadingStatus = v28
                        });
                    end;
                end;
                v27.logAllLayersExposure = function(v33)
                    local v34 = v27.props[v7];
                    if not (not (v34 ~= nil and v33 == Enum.IXPLoadingStatus.Initialized) or not v23) then
                        for _, v36 in ipairs(v21) do
                            if v34[v20](v34, v36) == Enum.IXPLoadingStatus.Initialized then
                                v34[v19](v34, v36);
                            end;
                        end;
                    end;
                end;
                local v37 = v27.props[v7];
                if v37 ~= nil then
                    v27.updateStateLayerData((v37[v17](v37)));
                end;
            end;
            v26.render = function(v38)
                local v39 = v4.Dictionary.join(v38.props, {
                    [v7] = v4.None
                });
                return v2.createElement(v25, (v4.Dictionary.join(v39, (v22(v38.state.layerToVariables, v39)))));
            end;
            v26.didMount = function(v40)
                local v41 = v40.props[v7];
                if v41 ~= nil then
                    v40.onLoadingStatusChangeConnection = v41[v16]:Connect(function(_)
                        local v43 = v41[v17](v41);
                        if v40.state.layerLoadingStatus ~= v43 then
                            v40.updateStateLayerData(v43, v18);
                            v40.logAllLayersExposure(v43);
                        end;
                    end);
                    local v44 = v41[v17](v41);
                    if v40.state.layerLoadingStatus ~= v44 then
                        v40.updateStateLayerData(v44, v18);
                    end;
                    v40.logAllLayersExposure(v44);
                end;
            end;
            v26.willUnmount = function(v45)
                if v45.onLoadingStatusChangeConnection ~= nil then
                    v45.onLoadingStatusChangeConnection:Disconnect();
                end;
            end;
            return function(v46)
                return v2.createElement(v6.Consumer, {
                    render = function(v47)
                        assert(v46[v7] == nil, "Symbol 'IxpServiceProp' should never exist in the incoming props.");
                        return v2.createElement(v26, (v4.Dictionary.join(v46, {
                            [v7] = v47
                        })));
                    end
                });
            end;
        end;
    end;
end;
return {
    Provider = v6.Provider, 
    Consumer = v6.Consumer, 
    Context = v6, 
    registerUserLayers = v12, 
    initializeUserLayers = v14, 
    clearUserLayers = v15, 
    useBrowserTrackerExperiment = require(script.useBrowserTrackerExperiment), 
    useUserExperiment = require(script.useUserExperiment), 
    useIXPService = require(script.useIXPService), 
    connectBrowserTrackerLayer = v48("OnBrowserTrackerLayerLoadingStatusChanged", "GetBrowserTrackerLayerLoadingStatus", "GetBrowserTrackerLayerVariables", "LogBrowserTrackerLayerExposure", "GetBrowserTrackerStatusForLayer"), 
    connectUserLayer = v48("OnUserLayerLoadingStatusChanged", "GetUserLayerLoadingStatus", "GetUserLayerVariables", "LogUserLayerExposure", "GetUserStatusForLayer"), 
    MockIXPService = require(script.MockIXPService)
};

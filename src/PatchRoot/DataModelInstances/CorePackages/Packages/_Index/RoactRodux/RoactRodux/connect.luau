local v0 = require(script.Parent.Parent.Roact);
local v1 = require(script.Parent.shallowEqual);
local v2 = require(script.Parent.join);
local v3 = require(script.Parent.StoreContext);
local function _(v4, v5)
    return table.concat(v4, "\n"):format(unpack(v5 or {}));
end;
local function v7()
    return nil;
end;
local function _(v8)
    return function(v9, v10, v11)
        if v11 == nil then
            v11 = v10.mapStateToProps(v8:getState(), v9);
        end;
        return {
            mappedStoreState = v11, 
            propsForChild = v2(v9, v11, v10.mappedStoreDispatch)
        };
    end;
end;
return function(v13, v14)
    local v15 = debug.traceback();
    if v13 ~= nil then
        assert(typeof(v13) == "function", "mapStateToProps must be a function or nil");
    else
        v13 = v7;
    end;
    local v16 = typeof(v14);
    if v14 ~= nil then
        local v17 = true;
        if v16 ~= "function" then
            v17 = v16 == "table";
        end;
        assert(v17, "mapDispatchToProps must be a function, table, or nil");
    else
        v14 = v7;
    end;
    return function(v18)
        if v18 == nil then
            error(table.concat({
                "connect returns a function that must be passed a component.", 
                "Check the connection at:", 
                "%s"
            }, "\n"):format(unpack({
                v15
            } or {})), 2);
        end;
        local v19 = ("RoduxConnection(%s)"):format((tostring(v18)));
        local v20 = v0.Component:extend(v19);
        v20.getDerivedStateFromProps = function(v21, v22)
            if v22.stateUpdater ~= nil then
                return v22.stateUpdater(v21.innerProps, v22);
            else
                return ;
            end;
        end;
        v20.init = function(v23, v24)
            v23.store = v24.store;
            if v23.store == nil then
                error((table.concat({
                    "Cannot initialize Roact-Rodux connection without being a descendent of StoreProvider", 
                    "Tried to wrap component %q", 
                    "Make sure there is a StoreProvider above this component in the tree."
                }, "\n"):format(unpack({
                    (tostring(v18))
                } or {}))));
            end;
            local v25 = v23.store:getState();
            local l_v13_0 = v13;
            local v27 = l_v13_0(v25, v23.props.innerProps);
            if typeof(v27) == "function" then
                l_v13_0 = v27;
                v27 = l_v13_0(v25, v23.props.innerProps);
            end;
            if v27 ~= nil and typeof(v27) ~= "table" then
                error((table.concat({
                    "mapStateToProps must either return a table, or return another function that returns a table.", 
                    "Instead, it returned %q, which is of type %s."
                }, "\n"):format(unpack({
                    tostring(v27), 
                    (typeof(v27))
                } or {}))));
            end;
            local function v28(...)
                return v23.store:dispatch(...);
            end;
            local v29 = nil;
            if v16 == "table" then
                v29 = {};
                for v30, v31 in pairs(v14) do
                    assert(typeof(v31) == "function", "mapDispatchToProps must contain function values");
                    v29[v30] = function(...)
                        v28(v31(...));
                    end;
                end;
            elseif v16 == "function" then
                v29 = v14(v28);
            end;
            local l_store_0 = v23.store;
            local function v36(v33, v34, v35)
                if v35 == nil then
                    v35 = v34.mapStateToProps(l_store_0:getState(), v33);
                end;
                return {
                    mappedStoreState = v35, 
                    propsForChild = v2(v33, v35, v34.mappedStoreDispatch)
                };
            end;
            v23.state = {
                stateUpdater = v36, 
                mapStateToProps = l_v13_0, 
                mappedStoreDispatch = v29, 
                propsForChild = nil
            };
            for v37, v38 in pairs((v36(v23.props.innerProps, v23.state, v27))) do
                v23.state[v37] = v38;
            end;
        end;
        v20.didMount = function(v39)
            local function v44(v40)
                v39:setState(function(v41, v42)
                    local v43 = v41.mapStateToProps(v40, v42.innerProps);
                    if not v1(v43, v41.mappedStoreState) then
                        return v41.stateUpdater(v42.innerProps, v41, v43);
                    else
                        return nil;
                    end;
                end);
            end;
            local v45 = v39.store:getState();
            v39:setState(function(v46, v47)
                local v48 = v46.mapStateToProps(v45, v47.innerProps);
                if not v1(v48, v46.mappedStoreState) then
                    return v46.stateUpdater(v47.innerProps, v46, v48);
                else
                    return nil;
                end;
            end);
            v39.storeChangedConnection = v39.store.changed:connect(v44);
        end;
        v20.willUnmount = function(v49)
            if v49.storeChangedConnection then
                v49.storeChangedConnection:disconnect();
                v49.storeChangedConnection = nil;
            end;
        end;
        v20.render = function(v50)
            return v0.createElement(v18, v50.state.propsForChild);
        end;
        local v51 = v0.Component:extend(v19);
        v51.render = function(v52)
            return v0.createElement(v3.Consumer, {
                render = function(v53)
                    return v0.createElement(v20, {
                        innerProps = v52.props, 
                        store = v53
                    });
                end
            });
        end;
        return v51;
    end;
end;

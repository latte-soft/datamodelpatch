local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.RoactGamepad);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.CursorKind);
local v5 = require(script.Parent.SelectionImageContext);
local v6 = require(script.Parent.OnRootedListener);
local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local v9 = v1.PureComponent:extend("SelectionCursorProvider");
v9.init = function(v10)
    v10.ref = v1.createRef();
    v10.refs = v2.createRefCache();
    v10.state = {
        mountedCursors = {}, 
        currentSelection = nil, 
        currentCoreSelection = nil
    };
    v10.getSelectionCursor = function(v11)
        assert(v4.isEnumValue(v11), ("Invalid arg #1: expected a CursorKind enum variant, got %s"):format((tostring(v11))));
        if v10.state.mountedCursors[v11] == nil then
            v10:setState(function(v12)
                return {
                    mountedCursors = v3.Dictionary.join(v12.mountedCursors, {
                        [v11] = true
                    })
                };
            end);
        end;
        return v10.refs[v11];
    end;
    v10.initSelectionChangedListener = function(v13)
        if v13 == nil then
            return ;
        else
            if v10.coreSelectionListener ~= nil then
                v10.coreSelectionListener:Disconnect();
                v10.coreSelectionListener = nil;
            end;
            if v10.selectionListener ~= nil then
                v10.selectionListener:Disconnect();
                v10.selectionListener = nil;
            end;
            if not v13:IsDescendantOf(l_CoreGui_0) then
                v10.selectionListener = l_GuiService_0:GetPropertyChangedSignal("SelectedObject"):Connect(function()
                    if not (v10.state.currentSelection ~= nil and l_GuiService_0.SelectedObject ~= nil) or v10.state.currentSelection.SelectionImageObject ~= l_GuiService_0.SelectedObject.SelectionImageObject then
                        v10:setState({
                            currentSelection = l_GuiService_0.SelectedObject
                        });
                    end;
                end);
                return ;
            else
                v10.coreSelectionListener = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
                    if not (v10.state.currentCoreSelection ~= nil and l_GuiService_0.SelectedCoreObject ~= nil) or v10.state.currentCoreSelection.SelectionImageObject ~= l_GuiService_0.SelectedCoreObject.SelectionImageObject then
                        v10:setState({
                            currentCoreSelection = l_GuiService_0.SelectedCoreObject
                        });
                    end;
                end);
                return ;
            end;
        end;
    end;
end;
v9.didMount = function(v14)
    v14.initSelectionChangedListener(v14.ref:getValue());
end;
v9.willUnmount = function(v15)
    if v15.coreSelectionListener ~= nil then
        v15.coreSelectionListener:Disconnect();
        v15.coreSelectionListener = nil;
    end;
    if v15.selectionListener ~= nil then
        v15.selectionListener:Disconnect();
        v15.selectionListener = nil;
    end;
end;
v9.render = function(v16)
    local v17 = {};
    for v18, _ in pairs(v16.state.mountedCursors) do
        local v20 = v18.rawValue();
        local v21 = tostring(v20);
        local v22 = false;
        if v16.refs[v18] ~= nil and (not (not (v16.state.currentSelection ~= nil) or v16.refs[v18].current ~= v16.state.currentSelection.SelectionImageObject) or v16.state.currentCoreSelection ~= nil and v16.refs[v18].current == v16.state.currentCoreSelection.SelectionImageObject) then
            v22 = true;
        end;
        v17[v21] = v1.createElement(v20, {
            isVisible = v22, 
            cursorRef = v16.refs[v18]
        });
    end;
    return v1.createElement(v5.Provider, {
        value = v16.getSelectionCursor
    }, {
        CursorContainer = v1.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            Visible = false
        }, v17), 
        OnRootedListener = v1.createElement(v6, {
            onRooted = v16.initSelectionChangedListener
        }), 
        Children = v1.createFragment(v16.props[v1.Children])
    });
end;
return v9;

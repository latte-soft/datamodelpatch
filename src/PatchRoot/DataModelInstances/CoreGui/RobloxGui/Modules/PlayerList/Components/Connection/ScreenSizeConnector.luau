local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = require(script.Parent.Parent.Parent.Actions.SetScreenSize);
local v4 = require(script.Parent.EventConnection);
local v5 = v1.PureComponent:extend("ScreenSizeConnector");
v5.init = function(v6)
    v6.state = {
        layerCollector = nil
    };
    v6.folderRef = v1.createRef();
end;
v5.render = function(v7)
    if not v7.state.layerCollector then
        return v1.createElement("Folder", {
            [v1.Ref] = v7.folderRef
        });
    else
        local l_AbsoluteSize_0 = v7.state.layerCollector.AbsoluteSize;
        v7.props.setScreenSize(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y);
        return v1.createElement(v4, {
            event = v7.state.layerCollector:GetPropertyChangedSignal("AbsoluteSize"), 
            callback = function()
                l_AbsoluteSize_0 = v7.state.layerCollector.AbsoluteSize;
                v7.props.setScreenSize(l_AbsoluteSize_0.X, l_AbsoluteSize_0.Y);
            end
        });
    end;
end;
v5.watchFolderAncestery = function(v9)
    if v9.folderRef.current and v9.ancesteryConnection == nil then
        local l_FirstAncestorWhichIsA_0 = v9.folderRef.current:FindFirstAncestorWhichIsA("LayerCollector");
        do
            local l_l_FirstAncestorWhichIsA_0_0 = l_FirstAncestorWhichIsA_0;
            if not l_l_FirstAncestorWhichIsA_0_0 then
                v9.ancesteryConnection = v9.folderRef.current.AncestryChanged:Connect(function()
                    if v9.folderRef.current then
                        l_l_FirstAncestorWhichIsA_0_0 = v9.folderRef.current:FindFirstAncestorWhichIsA("LayerCollector");
                        if l_l_FirstAncestorWhichIsA_0_0 then
                            v9:setState({
                                layerCollector = l_l_FirstAncestorWhichIsA_0_0
                            });
                        end;
                    end;
                end);
            else
                v9:setState({
                    layerCollector = l_l_FirstAncestorWhichIsA_0_0
                });
            end;
        end;
    end;
end;
v5.didMount = function(v12)
    v12:watchFolderAncestery();
end;
v5.didUpdate = function(v13)
    if v13.state.layerCollector then
        if v13.ancesteryConnection then
            v13.ancesteryConnection:Disconnect();
            v13.ancesteryConnection = nil;
        end;
        return ;
    else
        v13:watchFolderAncestery();
        return ;
    end;
end;
v5.willUnmount = function(v14)
    if v14.ancesteryConnection then
        v14.ancesteryConnection:Disconnect();
        v14.ancesteryConnection = nil;
    end;
end;
return v2.connect(nil, function(v15)
    return {
        setScreenSize = function(v16, v17)
            return v15(v3(v16, v17));
        end
    };
end)(v5);

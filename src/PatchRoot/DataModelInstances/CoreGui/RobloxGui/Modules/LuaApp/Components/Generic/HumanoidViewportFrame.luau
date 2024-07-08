local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_Modules_0.LuaApp.Util.rebuildJoints);
local v7 = require(l_Modules_0.LuaApp.Components.Generic.AvatarViewportFrame);
local v8 = v5.interface({
    humanoidDescription = v5.optional(v5.instanceIsA("HumanoidDescription")), 
    loadRigType = v5.optional(v5.enum(Enum.HumanoidRigType)), 
    Size = v5.optional(v5.UDim2), 
    Position = v5.optional(v5.UDim2)
});
local v9 = v4.PureComponent:extend("HumanoidViewportFrame");
v9.defaultProps = {
    loadRigType = Enum.HumanoidRigType.R15
};
v9.init = function(v10)
    v10.state = {
        modelRef = nil
    };
    v10.isMounted = false;
end;
v9.updateHumanoid = function(v11)
    if v11.state.modelRef ~= nil then
        v11.state.modelRef.value:Destroy();
        if v11.isMounted then
            v11:setState({
                modelRef = nil
            });
        end;
    end;
    local l_humanoidDescription_0 = v11.props.humanoidDescription;
    local l_loadRigType_0 = v11.props.loadRigType;
    if l_humanoidDescription_0 == nil then
        return ;
    else
        coroutine.wrap(function()
            local v14 = nil;
            local l_status_0, l_result_0 = pcall(function()
                v14 = l_Players_0:CreateHumanoidModelFromDescription(l_humanoidDescription_0, l_loadRigType_0);
            end);
            if l_status_0 then
                v14.Name = "Model";
                v6(v14);
                if v11.isMounted then
                    v11:setState({
                        modelRef = {
                            value = v14
                        }
                    });
                end;
                return ;
            else
                warn(string.format("Cannot load model from humanoidDescription, reason: %s", (tostring(l_result_0))));
                return ;
            end;
        end)();
        return ;
    end;
end;
v9.didMount = function(v17)
    v17.isMounted = true;
    v17:updateHumanoid();
end;
v9.willUnmount = function(v18)
    v18.isMounted = false;
    if v18.state.modelRef ~= nil then
        v18.state.modelRef.value:Destroy();
    end;
end;
v9.didUpdate = function(v19, v20)
    if not (v20.humanoidDescription == v19.props.humanoidDescription) or v20.loadRigType ~= v19.props.loadRigType then
        v19:updateHumanoid();
    end;
end;
v9.render = function(v21)
    assert(v8(v21.props));
    return v4.createElement(v7, (v3.Dictionary.join(v21.props, {
        modelRef = v21.state.modelRef, 
        humanoidDescription = v3.None, 
        loadRigType = v3.None
    })));
end;
return v9;

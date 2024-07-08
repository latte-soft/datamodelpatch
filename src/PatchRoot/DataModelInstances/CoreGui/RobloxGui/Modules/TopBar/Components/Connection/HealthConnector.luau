local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Actions.SetIsDead);
local v7 = require(l_Parent_0.Actions.UpdateHealth);
local v8 = require(l_Parent_0.Parent.Common.EventConnection);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v10 = v2.PureComponent:extend("HealthConnector");
v10.validateProps = v4.strictInterface({
    setIsDead = v4.callback, 
    updateHealth = v4.callback
});
v10.init = function(v11)
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v13 = nil;
    if l_Character_0 then
        v13 = l_Character_0:FindFirstChildOfClass("Humanoid");
    end;
    v11:setState({
        character = l_Character_0, 
        humanoid = v13
    });
end;
v10.didMount = function(v14)
    if v14.state.humanoid then
        v14.props.updateHealth(v14.state.humanoid.Health, v14.state.humanoid.MaxHealth);
    end;
end;
v10.render = function(v15)
    local v16 = {};
    if not v15.state.humanoid then
        if v15.state.character then
            v16.ChildAddedConnection = v2.createElement(v8, {
                event = v15.state.character.ChildAdded, 
                callback = function(v17)
                    if v17:IsA("Humanoid") then
                        v15:setState({
                            humanoid = v17
                        });
                    end;
                end
            });
        end;
    else
        v16.HealthChangedConnection = v2.createElement(v8, {
            event = v15.state.humanoid.HealthChanged, 
            callback = function(_)
                v15.props.updateHealth(v15.state.humanoid.Health, v15.state.humanoid.MaxHealth);
            end
        });
        v16.HumanoidDiedConnection = v2.createElement(v8, {
            event = v15.state.humanoid.Died, 
            callback = function()
                v15.props.setIsDead(true);
            end
        });
    end;
    v16.CharacterAddedConnection = v2.createElement(v8, {
        event = l_LocalPlayer_0.CharacterAdded, 
        callback = function(v19)
            v15:setState({
                humanoid = v19:FindFirstChildOfClass("Humanoid") or v2.None, 
                character = v19
            });
            v15.props.setIsDead(false);
        end
    });
    v16.CharacterRemovingConnection = v2.createElement(v8, {
        event = l_LocalPlayer_0.CharacterRemoving, 
        callback = function()
            v15:setState({
                humanoid = v2.None, 
                character = v2.None
            });
        end
    });
    return v2.createFragment(v16);
end;
v10.didUpdate = function(v20, _, v22)
    if v20.state.humanoid == nil then
        v20.props.updateHealth(0, 0);
    elseif v20.state.humanoid ~= v22.humanoid then
        v20.props.setIsDead(false);
        v20.props.updateHealth(v20.state.humanoid.Health, v20.state.humanoid.MaxHealth);
    end;
    if v20.state.character and v20.state.character ~= v22.character then
        local l_Humanoid_0 = v20.state.character:FindFirstChildWhichIsA("Humanoid");
        if l_Humanoid_0 and l_Humanoid_0 ~= v20.state.humanoid then
            v20:setState({
                humanoid = l_Humanoid_0
            });
        end;
    end;
end;
return v3.UNSTABLE_connect2(nil, function(v24)
    return {
        setIsDead = function(v25)
            return v24(v6(v25));
        end, 
        updateHealth = function(v26, v27)
            return v24(v7(v26, v27));
        end
    };
end)(v10);

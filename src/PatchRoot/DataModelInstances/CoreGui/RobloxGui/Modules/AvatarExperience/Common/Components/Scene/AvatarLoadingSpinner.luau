local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Workspace_0 = game:GetService("Workspace");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.UIBlox);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local _ = require(l_CoreGui_0.RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState);
local l_LoadingSpinner_0 = v7.App.Loading.LoadingSpinner;
local v11 = v4.PureComponent:extend("AvatarLoadingSpinner");
v11.validateProps = v6.interface({
    currentCharacter = v6.optional(v6.instanceIsA("Model")), 
    layeredClothingLoading = v6.boolean, 
    hasAvatarData = v6.boolean, 
    ppeEmoteLoading = v6.optional(v6.boolean)
});
v11.init = function(v12)
    v12.containerRef = v4.createRef();
    local v13, v14 = v4.createBinding(nil);
    v12.characterScreenPosition = v13;
    v12.updateCharacterScreenPosition = v14;
    v13, v14 = v4.createBinding(nil);
    v12.containerPositon = v13;
    v12.updateContainerPosition = v14;
    v12.positionBinding = v4.joinBindings({
        characterScreenPosition = v12.characterScreenPosition, 
        containerPositon = v12.containerPositon
    }):map(function(v15)
        local l_characterScreenPosition_0 = v15.characterScreenPosition;
        local l_containerPositon_0 = v15.containerPositon;
        if l_characterScreenPosition_0 and l_containerPositon_0 then
            return (UDim2.fromOffset(l_characterScreenPosition_0.X - l_containerPositon_0.X, l_characterScreenPosition_0.Y - l_containerPositon_0.Y));
        else
            return UDim2.fromScale(0.5, 0.5);
        end;
    end);
    v12.absolutePositionChanged = function(v18)
        v12.updateContainerPosition(v18.AbsolutePosition);
    end;
    v12.renderStepped = function()
        v12:updateSpinnerPosition();
    end;
end;
v11.shouldRender = function(v19)
    return (v19.props.ppeEmoteLoading or v19.props.layeredClothingLoading) or not v19.props.hasAvatarData;
end;
v11.render = function(v20)
    if not v20:shouldRender() then
        return nil;
    else
        return v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            [v4.Change.AbsolutePosition] = v20.absolutePositionChanged, 
            [v4.Ref] = v20.containerRef
        }, {
            LoadingSpinner = v4.createElement(l_LoadingSpinner_0, {
                size = UDim2.fromOffset(48, 48), 
                position = v20.positionBinding, 
                anchorPoint = Vector2.new(0.5, 0.5)
            }), 
            RenderSteppedConnection = v4.createElement(l_ExternalEventConnection_0, {
                event = l_RunService_0.RenderStepped, 
                callback = v20.renderStepped
            })
        });
    end;
end;
v11.didMount = function(v21)
    if v21.containerRef:getValue() then
        v21.absolutePositionChanged(v21.containerRef:getValue());
    end;
    v21:updateSpinnerPosition();
end;
v11.updateSpinnerPosition = function(v22)
    if v22.props.currentCharacter and v22.props.hasAvatarData then
        local l_BoundingBox_0, _ = v22.props.currentCharacter:GetBoundingBox();
        v22.updateCharacterScreenPosition((l_Workspace_0.CurrentCamera:WorldToScreenPoint(l_BoundingBox_0.Position)));
        return ;
    else
        return ;
    end;
end;
v11.didUpdate = function(v25, v26)
    local v27 = v25.props.layeredClothingLoading and not v26.layeredClothingLoading;
    local v28 = v25.props.currentCharacter ~= v26.currentCharacter;
    local v29 = v25.props.ppeEmoteLoading and not v26.ppeEmoteLoading;
    if not (not (v27 or v28) and not v29) then
        v25:updateSpinnerPosition();
    end;
end;
return (v5.connect(function(v30, _)
    return {
        currentCharacter = v30.AvatarExperience.AvatarScene.Character.CurrentCharacter, 
        layeredClothingLoading = v30.AvatarExperience.AvatarScene.Character.ApplyingLayeredClothing, 
        hasAvatarData = v30.AvatarExperience.AvatarEditor.HasAvatarData, 
        ppeEmoteLoading = v30.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.ppeEmoteLoadingCount > 0
    };
end, nil)(v11));

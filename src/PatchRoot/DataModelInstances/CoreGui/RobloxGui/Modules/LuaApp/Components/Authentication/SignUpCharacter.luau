local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.Common.memoize);
local v5 = require(l_Modules_0.LuaApp.Models.HumanoidDescriptionProperties);
local v6 = require(l_Modules_0.LuaApp.Components.Generic.HumanoidViewportFrame);
local v7 = v2.PureComponent:extend("SignUpCharacter");
v7.init = function(v8)
    v8.state = {
        propertiesAppliedToHumanoidDescription = nil
    };
    v8.isMounted = false;
    v8.humanoidDescriptionInstance = nil;
end;
v7.generateHumanoidDescriptionWithCurrentProps = function(v9)
    local l_humanoidDescriptionProperties_0 = v9.props.humanoidDescriptionProperties;
    if l_humanoidDescriptionProperties_0 then
        if v9.humanoidDescriptionInstance then
            v9.humanoidDescriptionInstance:Destroy();
        end;
        v9.humanoidDescriptionInstance = v5.createHumanoidDescription(l_humanoidDescriptionProperties_0);
        v9:setState({
            propertiesAppliedToHumanoidDescription = l_humanoidDescriptionProperties_0
        });
    end;
end;
v7.render = function(v11)
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1
    }, {
        Character = v2.createElement(v6, {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            humanoidDescription = v11.humanoidDescriptionInstance, 
            cameraCFrameOffset = CFrame.Angles(-0.2617993877991494, 0.2617993877991494, 0.03490658503988659), 
            topOffsetScale = 0.15, 
            bottomOffsetScale = 0.15, 
            ImageColor3 = v11.props.characterColor, 
            LightDirection = Vector3.new(-40, -20, 60), 
            LightColor = Color3.fromRGB(180, 180, 180)
        }), 
        Shadow = v2.createElement("ImageLabel", {
            Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/CharacterShadow.png", 
            Size = UDim2.new(1, 0, 0.25, 0), 
            Position = UDim2.new(0.5, 0, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 1
        })
    });
end;
v7.didMount = function(v12)
    v12.isMounted = true;
    v12:generateHumanoidDescriptionWithCurrentProps();
end;
v7.didUpdate = function(v13, v14, _)
    if v13.props.humanoidDescriptionProperties ~= v14.humanoidDescriptionProperties then
        v13:generateHumanoidDescriptionWithCurrentProps();
    end;
end;
v7.willUnmount = function(v16)
    v16.isMounted = false;
    local l_humanoidDescription_0 = v16.state.humanoidDescription;
    if l_humanoidDescription_0 then
        l_humanoidDescription_0:Destroy();
    end;
end;
local v22 = v4(function(v18, v19)
    for _, v21 in ipairs(v18) do
        if v19 == v21.bundleId then
            return v21.userOutfitId;
        end;
    end;
    return "";
end);
return (v3.connect(function(v23, v24)
    return {
        humanoidDescriptionProperties = v23.SignUpInfo.HumanoidDescriptionProperties[v22(v23.SignUpInfo.SignUpBundles, v24.bundleId)]
    };
end)(v7));

local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_FirstChild_0 = settings():FindFirstChild("Game Options");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = nil;
pcall(function()
    v3 = game:GetService("PlatformService");
end);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v5 = require(l_Modules_0.Common.Roact);
local v6 = require(l_Modules_0.Shell.Utility);
local v7 = require(l_Modules_0.Shell.Components.ContextActionEvent);
local v8 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v9 = require(l_Modules_0.Shell.Components.RenderStep);
local l_game_EngineFeature_0 = game:GetEngineFeature("MigrateOverscanToGameBasicSettings");
local v11 = Vector2.new(0.85, 0.85);
local v12 = Vector2.new(0.9, 0.9);
local v13 = Vector2.new(1920, 1080);
local v14 = Vector2.new(0, 0);
local v15 = {
    [Enum.KeyCode.DPadDown] = Vector2.new(0, 2), 
    [Enum.KeyCode.DPadUp] = Vector2.new(0, -2), 
    [Enum.KeyCode.DPadLeft] = Vector2.new(-2, 0), 
    [Enum.KeyCode.DPadRight] = Vector2.new(2, 0)
};
local function v17(v16)
    return v5.createElement("ImageLabel", {
        Size = UDim2.new(0, 95, 0, 95), 
        Position = v16.Position, 
        AnchorPoint = v16.AnchorPoint, 
        BackgroundTransparency = 1, 
        Rotation = v16.Rotation, 
        Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/ScreenAdjustmentArrow.png"
    });
end;
local v18 = v5.Component:extend("Edges");
v18.init = function(v19)
    local function _(v20)
        return v6.ClampVector2(v11, Vector2.new(1, 1), v20);
    end;
    local function _(v22)
        local v23 = v22 * v13;
        return v6.ClampVector2(v14, v13, Vector2.new(v6.Round(v23.X / 2), v6.Round(v23.Y / 2)) * 2);
    end;
    v19.onAdjustThumbstick = function(_, _, v27)
        v19._stickPosition = v6.GamepadLinearToCurve(Vector2.new(v27.Position.X, -v27.Position.Y), 0.2);
    end;
    v19.onAdjustDPad = function(_, v29, v30)
        if v29 == Enum.UserInputState.Begin then
            local v31 = v15[v30.KeyCode];
            if v31 then
                v31 = v31 / v13;
                if not (not v6.IsFinite(v31.X) or not v6.IsFinite(v31.Y)) then
                    v19._edgePercent = v6.ClampVector2(v11, Vector2.new(1, 1), v19._edgePercent + v31);
                    local l_v19_0 = v19;
                    local v33 = {};
                    local v34 = v19._edgePercent * v13;
                    v33.currentSize = v6.ClampVector2(v14, v13, Vector2.new(v6.Round(v34.X / 2), v6.Round(v34.Y / 2)) * 2);
                    l_v19_0:setState(v33);
                end;
            end;
        end;
    end;
    v19.onReset = function(_, v36, _)
        if v36 == Enum.UserInputState.End then
            v19._stickPosition = v14;
            v19._edgePercent = v6.ClampVector2(v11, Vector2.new(1, 1), v12);
            v19._acceleration = 1;
            local l_v19_1 = v19;
            local v39 = {};
            local v40 = v19._edgePercent * v13;
            v39.currentSize = v6.ClampVector2(v14, v13, Vector2.new(v6.Round(v40.X / 2), v6.Round(v40.Y / 2)) * 2);
            l_v19_1:setState(v39);
        end;
    end;
    v19.onAccept = function(_, v42, _)
        if v42 == Enum.UserInputState.Begin then
            v19._seenAPressed = true;
            return ;
        else
            if not (not (v42 == Enum.UserInputState.End) or not v19._seenAPressed) then
                local _, _ = pcall(function()
                    if not l_game_EngineFeature_0 then
                        l_FirstChild_0.OverscanPX = math.min(1, v19._edgePercent.X);
                        l_FirstChild_0.OverscanPY = math.min(1, v19._edgePercent.Y);
                        return ;
                    else
                        l_UserGameSettings_0.Overscan = Vector2.new(math.min(1, v19._edgePercent.X), (math.min(1, v19._edgePercent.Y)));
                        return ;
                    end;
                end);
                if v19.props.onSetEdges then
                    v19.props.onSetEdges();
                end;
            end;
            return ;
        end;
    end;
    v19.onRenderStep = function()
        local v46 = tick();
        if v19._lastUpdate then
            if v19._stickPosition ~= v14 then
                local v47 = v46 - v19._lastUpdate;
                v19._edgePercent = v6.ClampVector2(v11, Vector2.new(1, 1), ((v19._stickPosition * v19._acceleration) * v47) * 0.05 + v19._edgePercent);
                v19._acceleration = math.min(v19._acceleration + v47 * 1, 3);
                local l_v19_2 = v19;
                local v49 = {};
                local v50 = v19._edgePercent * v13;
                v49.currentSize = v6.ClampVector2(v14, v13, Vector2.new(v6.Round(v50.X / 2), v6.Round(v50.Y / 2)) * 2);
                l_v19_2:setState(v49);
            else
                v19._acceleration = 1;
            end;
        end;
        v19._lastUpdate = v46;
    end;
    v19.onSuspended = function()
        pcall(function()
            if not l_game_EngineFeature_0 then
                l_FirstChild_0.OverscanPX = v19._lastSavedOverscan.X;
                l_FirstChild_0.OverscanPY = v19._lastSavedOverscan.Y;
                return ;
            else
                l_UserGameSettings_0.Overscan = Vector2.new(v19._lastSavedOverscan.X, v19._lastSavedOverscan.Y);
                return ;
            end;
        end);
    end;
    local v51 = v6.ClampVector2(v11, Vector2.new(1, 1), v12);
    local v52 = v51 * v13;
    local v53 = v6.ClampVector2(v14, v13, Vector2.new(v6.Round(v52.X / 2), v6.Round(v52.Y / 2)) * 2);
    if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
        pcall(function()
            if not l_game_EngineFeature_0 then
                if l_FirstChild_0.OverscanPX > 0 and l_FirstChild_0.OverscanPY > 0 then
                    v51 = Vector2.new(l_FirstChild_0.OverscanPX, l_FirstChild_0.OverscanPY);
                    v51 = v6.ClampVector2(v11, Vector2.new(1, 1), v51);
                    local v54 = v51 * v13;
                    v53 = v6.ClampVector2(v14, v13, Vector2.new(v6.Round(v54.X / 2), v6.Round(v54.Y / 2)) * 2);
                    v19._lastSavedOverscan = Vector2.new(l_FirstChild_0.OverscanPX, l_FirstChild_0.OverscanPY);
                    l_FirstChild_0.OverscanPX = 1;
                    l_FirstChild_0.OverscanPY = 1;
                end;
            elseif l_UserGameSettings_0.Overscan.x > 0 and l_UserGameSettings_0.Overscan.y > 0 then
                v51 = Vector2.new(l_UserGameSettings_0.Overscan.x, l_UserGameSettings_0.Overscan.y);
                v51 = v6.ClampVector2(v11, Vector2.new(1, 1), v51);
                local v55 = v51 * v13;
                v53 = v6.ClampVector2(v14, v13, Vector2.new(v6.Round(v55.X / 2), v6.Round(v55.Y / 2)) * 2);
                v19._lastSavedOverscan = Vector2.new(l_UserGameSettings_0.Overscan.x, l_UserGameSettings_0.Overscan.y);
                l_UserGameSettings_0.Overscan = Vector2.new(1, 1);
                return ;
            end;
        end);
    end;
    v19._stickPosition = v14;
    v19._edgePercent = v51;
    v19._lastUpdate = nil;
    v19._acceleration = 1;
    v19._seenAPressed = false;
    v19.state = {
        currentSize = v53
    };
end;
v18.render = function(v56)
    return v5.createElement("Frame", {
        Size = UDim2.new(0, v56.state.currentSize.X, 0, v56.state.currentSize.Y), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1
    }, {
        SelectionImage = v5.createElement("ImageLabel", {
            Size = UDim2.new(1, 2, 1, 2), 
            Position = UDim2.new(0, -1, 0, -1), 
            BackgroundTransparency = 1, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(21, 21, 41, 41), 
            Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/ScreenRangeOverlay.png"
        }), 
        TopLeft = v5.createElement(v17, {
            Rotation = 0, 
            Position = UDim2.new(0, 0, 0, 0), 
            AnchorPoint = Vector2.new(0, 0)
        }), 
        TopRight = v5.createElement(v17, {
            Rotation = 90, 
            Position = UDim2.new(1, 0, 0, 0), 
            AnchorPoint = Vector2.new(1, 0)
        }), 
        BottomRight = v5.createElement(v17, {
            Rotation = 180, 
            Position = UDim2.new(1, 0, 1, 0), 
            AnchorPoint = Vector2.new(1, 1)
        }), 
        BottomLeft = v5.createElement(v17, {
            Rotation = 270, 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1)
        }), 
        Render = v5.createElement(v9, {
            name = "UpdateAdjustmentScreen", 
            priority = Enum.RenderPriority.Input.Value, 
            callback = v56.onRenderStep
        }), 
        AdjustConnectorThumbstick = v5.createElement(v7, {
            name = "ThumbstickAdjustmentScreen", 
            callback = v56.onAdjustThumbstick, 
            binds = {
                Enum.KeyCode.Thumbstick2
            }
        }), 
        AdjustConnectorDPad = v5.createElement(v7, {
            name = "DPadAdjustmentScreen", 
            callback = v56.onAdjustDPad, 
            binds = {
                Enum.KeyCode.DPadDown, 
                Enum.KeyCode.DPadUp, 
                Enum.KeyCode.DPadLeft, 
                Enum.KeyCode.DPadRight
            }
        }), 
        ResetConnector = v5.createElement(v7, {
            name = "ResetAdjustmentScreen", 
            callback = v56.onReset, 
            binds = {
                Enum.KeyCode.ButtonX
            }
        }), 
        AcceptConnector = v5.createElement(v7, {
            name = "AcceptAdjustmentScreen", 
            callback = v56.onAccept, 
            binds = {
                Enum.KeyCode.ButtonA
            }
        }), 
        SuspendedCn = v3 and v5.createElement(v8, {
            event = v3.Suspended, 
            callback = v56.onSuspended
        })
    });
end;
return v18;

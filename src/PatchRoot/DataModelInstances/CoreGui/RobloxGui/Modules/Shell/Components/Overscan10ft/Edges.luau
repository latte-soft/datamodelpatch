local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_FirstChild_0 = settings():FindFirstChild("Game Options");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = nil;
pcall(function()
    v4 = game:GetService("PlatformService");
end);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_Modules_0.Shell.Utility);
local v8 = require(l_Modules_0.Shell.Components.ContextActionEvent);
local v9 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v10 = require(l_Modules_0.Shell.Components.RenderStep);
local l_game_EngineFeature_0 = game:GetEngineFeature("MigrateOverscanToGameBasicSettings");
local v12 = Vector2.new(0.85, 0.85);
local v13 = Vector2.new(0.9, 0.9);
local v14 = Vector2.new(1920, 1080);
local v15 = Vector2.new(0, 0);
local function v17(v16)
    return v6.createElement("ImageLabel", {
        Size = UDim2.new(0, 95, 0, 95), 
        Position = v16.Position, 
        AnchorPoint = v16.AnchorPoint, 
        BackgroundTransparency = 1, 
        Rotation = v16.Rotation, 
        Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/ScreenAdjustmentArrow.png"
    });
end;
local v18 = v6.Component:extend("Edges");
v18.init = function(v19)
    local function _(v20)
        return v7.ClampVector2(v12, Vector2.new(1, 1), v20);
    end;
    local function _(v22)
        local v23 = v22 * v14;
        return v7.ClampVector2(v15, v14, Vector2.new(v7.Round(v23.X / 2), v7.Round(v23.Y / 2)) * 2);
    end;
    v19.onAdjustThumbstick = function(_, _, v27)
        v19._stickPosition = v7.GamepadLinearToCurve(Vector2.new(v27.Position.X, -v27.Position.Y), 0.2);
    end;
    v19.onAccept = function()
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
    v19.onRenderStep = function()
        local v30 = tick();
        if v19._lastUpdate then
            if v19._stickPosition ~= v15 then
                local v31 = v30 - v19._lastUpdate;
                v19._edgePercent = v7.ClampVector2(v12, Vector2.new(1, 1), ((v19._stickPosition * v19._acceleration) * v31) * 0.05 + v19._edgePercent);
                v19._acceleration = math.min(v19._acceleration + v31 * 1, 3);
                local l_v19_0 = v19;
                local v33 = {};
                local v34 = v19._edgePercent * v14;
                v33.currentSize = v7.ClampVector2(v15, v14, Vector2.new(v7.Round(v34.X / 2), v7.Round(v34.Y / 2)) * 2);
                l_v19_0:setState(v33);
            else
                v19._acceleration = 1;
            end;
        end;
        v19._lastUpdate = v30;
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
    local v35 = v7.ClampVector2(v12, Vector2.new(1, 1), v13);
    local v36 = v35 * v14;
    local v37 = v7.ClampVector2(v15, v14, Vector2.new(v7.Round(v36.X / 2), v7.Round(v36.Y / 2)) * 2);
    if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
        pcall(function()
            if not l_game_EngineFeature_0 then
                if l_FirstChild_0.OverscanPX > 0 and l_FirstChild_0.OverscanPY > 0 then
                    v35 = Vector2.new(l_FirstChild_0.OverscanPX, l_FirstChild_0.OverscanPY);
                    v35 = v7.ClampVector2(v12, Vector2.new(1, 1), v35);
                    local v38 = v35 * v14;
                    v37 = v7.ClampVector2(v15, v14, Vector2.new(v7.Round(v38.X / 2), v7.Round(v38.Y / 2)) * 2);
                    v19._lastSavedOverscan = Vector2.new(l_FirstChild_0.OverscanPX, l_FirstChild_0.OverscanPY);
                    l_FirstChild_0.OverscanPX = 1;
                    l_FirstChild_0.OverscanPY = 1;
                end;
            elseif l_UserGameSettings_0.Overscan.x > 0 and l_UserGameSettings_0.Overscan.y > 0 then
                v35 = Vector2.new(l_UserGameSettings_0.Overscan.x, l_UserGameSettings_0.Overscan.y);
                v35 = v7.ClampVector2(v12, Vector2.new(1, 1), v35);
                local v39 = v35 * v14;
                v37 = v7.ClampVector2(v15, v14, Vector2.new(v7.Round(v39.X / 2), v7.Round(v39.Y / 2)) * 2);
                v19._lastSavedOverscan = Vector2.new(l_UserGameSettings_0.Overscan.x, l_UserGameSettings_0.Overscan.y);
                l_UserGameSettings_0.Overscan = Vector2.new(1, 1);
                return ;
            end;
        end);
    end;
    v19._stickPosition = v15;
    v19._edgePercent = v35;
    v19._lastUpdate = nil;
    v19._acceleration = 1;
    v19._seenAPressed = false;
    v19.state = {
        currentSize = v37
    };
end;
v18.render = function(v40)
    return v6.createElement("Frame", {
        Size = UDim2.new(0, v40.state.currentSize.X, 0, v40.state.currentSize.Y), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1
    }, {
        SelectionImage = v6.createElement("ImageLabel", {
            Size = UDim2.new(1, 2, 1, 2), 
            Position = UDim2.new(0, -1, 0, -1), 
            BackgroundTransparency = 1, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(21, 21, 41, 41), 
            Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/ScreenRangeOverlay.png"
        }), 
        TopLeft = v6.createElement(v17, {
            Rotation = 0, 
            Position = UDim2.new(0, 0, 0, 0), 
            AnchorPoint = Vector2.new(0, 0)
        }), 
        TopRight = v6.createElement(v17, {
            Rotation = 90, 
            Position = UDim2.new(1, 0, 0, 0), 
            AnchorPoint = Vector2.new(1, 0)
        }), 
        BottomRight = v6.createElement(v17, {
            Rotation = 180, 
            Position = UDim2.new(1, 0, 1, 0), 
            AnchorPoint = Vector2.new(1, 1)
        }), 
        BottomLeft = v6.createElement(v17, {
            Rotation = 270, 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1)
        }), 
        Render = v6.createElement(v10, {
            name = "UpdateAdjustmentScreen", 
            priority = Enum.RenderPriority.Input.Value, 
            callback = v40.onRenderStep
        }), 
        AdjustConnectorThumbstick = v6.createElement(v8, {
            name = "ThumbstickAdjustmentScreen", 
            callback = v40.onAdjustThumbstick, 
            binds = {
                Enum.KeyCode.Thumbstick2
            }
        }), 
        SuspendedCn = v4 and v6.createElement(v9, {
            event = v4.Suspended, 
            callback = v40.onSuspended
        })
    });
end;
return v18;

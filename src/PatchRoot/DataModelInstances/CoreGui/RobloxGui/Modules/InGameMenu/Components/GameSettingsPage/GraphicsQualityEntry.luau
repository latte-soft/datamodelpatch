local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_t_0 = v0.t;
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Rendering_0 = settings().Rendering;
local l_l_UserGameSettings_0_PropertyChangedSignal_0 = l_UserGameSettings_0:GetPropertyChangedSignal("SavedQualityLevel");
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(script.Parent.ToggleEntry);
local v8 = require(l_Parent_0.Utility.ExternalEventConnection);
local v9 = require(script.Parent.SliderEntry);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v11 = require(l_RobloxGui_0.Modules.Flags.GetFixGraphicsQuality);
local v12 = nil;
local v13 = nil;
local v14 = nil;
if v11() then
    v13 = require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("RobloxTranslator"));
    v14 = l_UserGameSettings_0:GetPropertyChangedSignal("GraphicsQualityLevel");
end;
local v15 = require(l_Parent_0.Utility.SendAnalytics);
local v16 = require(l_Parent_0.Resources.Constants);
local v17 = #Enum.SavedQualitySetting:GetEnumItems() - 1;
local v18 = 10;
if v11() then
    v18 = l_Rendering_0:GetMaxQualityLevel() - 1;
end;
local function _(v19, v20, v21, v22, v23)
    return (math.clamp(math.floor(v22 + ((v19 - v20) * (v23 - v22)) / (v21 - v20)), v22, v23));
end;
local _ = function(v25, _)
    if v12 == nil then
        v12 = l_RobloxGui_0:WaitForChild("SendNotificationInfo");
    end;
    v12:Fire({
        GroupName = "Graphics", 
        Title = "Graphics Quality", 
        Text = v25, 
        DetailText = v25, 
        Image = "", 
        Duration = 2
    });
end;
local function v32(v28, v29)
    if v29 > 0 then
        local v30 = v13:FormatByKey("NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Increased", {
            RBX_NUMBER = tostring(v28)
        });
        if v12 == nil then
            v12 = l_RobloxGui_0:WaitForChild("SendNotificationInfo");
        end;
        v12:Fire({
            GroupName = "Graphics", 
            Title = "Graphics Quality", 
            Text = v30, 
            DetailText = v30, 
            Image = "", 
            Duration = 2
        });
        return ;
    else
        if v29 < 0 then
            local v31 = v13:FormatByKey("NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Decreased", {
                RBX_NUMBER = tostring(v28)
            });
            if v12 == nil then
                v12 = l_RobloxGui_0:WaitForChild("SendNotificationInfo");
            end;
            v12:Fire({
                GroupName = "Graphics", 
                Title = "Graphics Quality", 
                Text = v31, 
                DetailText = v31, 
                Image = "", 
                Duration = 2
            });
        end;
        return ;
    end;
end;
local v33 = l_Roact_0.PureComponent:extend("GraphicsQualityEntry");
v33.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    isMenuOpen = l_t_0.optional(l_t_0.boolean)
});
v33.init = function(v34)
    local v35 = nil;
    if not v11() then
        v35 = l_UserGameSettings_0.SavedQualityLevel == Enum.SavedQualitySetting.Automatic;
        v34:setState({
            quality = if not v35 then l_UserGameSettings_0.SavedQualityLevel.Value else 5, 
            automatic = v35
        });
        v34.onQualityChanged = function()
            local l_SavedQualityLevel_0 = l_UserGameSettings_0.SavedQualityLevel;
            v34:setState({
                quality = not (l_SavedQualityLevel_0 == Enum.SavedQualitySetting.Automatic) and l_SavedQualityLevel_0.Value or nil, 
                automatic = l_SavedQualityLevel_0 == Enum.SavedQualitySetting.Automatic
            });
        end;
    else
        v35 = l_UserGameSettings_0.GraphicsQualityLevel == 0;
        v34:setState({
            quality = if not v35 then l_UserGameSettings_0.GraphicsQualityLevel else 5, 
            automatic = v35
        });
        v34.onQualityChanged = function()
            local l_GraphicsQualityLevel_0 = l_UserGameSettings_0.GraphicsQualityLevel;
            v34:setState({
                quality = l_GraphicsQualityLevel_0 ~= 0 and l_GraphicsQualityLevel_0 or nil, 
                automatic = l_GraphicsQualityLevel_0 == 0
            });
        end;
    end;
    if not v35 then
        v34:setManualQualityLevel(v34.state.quality);
    else
        v34:setAutomaticQualityLevel();
    end;
    if v11() then
        game.GraphicsQualityChangeRequest:Connect(function(v38)
            local l_GraphicsQualityLevel_1 = l_UserGameSettings_0.GraphicsQualityLevel;
            if l_GraphicsQualityLevel_1 ~= 0 then
                local v40, v41 = v34:setManualQualityLevel(l_GraphicsQualityLevel_1 + (not v38 and -1 or 1));
                v32(v40, v41);
            end;
        end);
    end;
end;
v33.setAutomaticQualityLevel = function(_)
    if not v11() then
        l_UserGameSettings_0.SavedQualityLevel = Enum.SavedQualitySetting.Automatic;
        l_Rendering_0.QualityLevel = 0;
        return ;
    else
        l_UserGameSettings_0.GraphicsQualityLevel = 0;
        l_Rendering_0.QualityLevel = 0;
        return ;
    end;
end;
v33.setManualQualityLevel = function(_, v44)
    if not v11() then
        local l_v17_0 = v17;
        local v46 = l_Rendering_0:GetMaxQualityLevel() - 1;
        local v47 = math.clamp(math.floor(1 + ((v44 - 1) * (v46 - 1)) / (l_v17_0 - 1)), 1, v46);
        l_UserGameSettings_0.SavedQualityLevel = v44;
        l_Rendering_0.QualityLevel = v47;
        return nil;
    else
        local v48 = math.clamp(v44, 1, v18);
        local l_GraphicsQualityLevel_2 = l_UserGameSettings_0.GraphicsQualityLevel;
        l_UserGameSettings_0.GraphicsQualityLevel = v48;
        l_Rendering_0.QualityLevel = v48;
        return v48, v48 - l_GraphicsQualityLevel_2;
    end;
end;
v33.render = function(v50)
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 156), 
        LayoutOrder = v50.props.LayoutOrder
    }, {
        Layout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        AutoToggle = l_Roact_0.createElement(v7, {
            LayoutOrder = 1, 
            labelKey = "CoreScripts.InGameMenu.GameSettings.AutoGraphicsQuality", 
            checked = v50.state.automatic, 
            onToggled = function()
                if not v50.state.automatic then
                    v50:setAutomaticQualityLevel();
                else
                    v50:setManualQualityLevel(v50.state.quality);
                end;
                v15(v16.AnalyticsSettingsChangeName, nil, {}, true);
            end
        }), 
        Slider = l_Roact_0.createElement(v9, {
            LayoutOrder = 2, 
            labelKey = "CoreScripts.InGameMenu.GameSettings.ManualGraphicsQuality", 
            min = 1, 
            max = v18, 
            stepInterval = 1, 
            value = v50.state.quality, 
            disabled = v50.state.automatic, 
            valueChanged = function(v51)
                v50:setManualQualityLevel(v51);
                v15(v16.AnalyticsSettingsChangeName, nil, {}, true);
            end, 
            canCaptureFocus = v50.props.canCaptureFocus, 
            isMenuOpen = v50.props.isMenuOpen
        }), 
        QualityListener = l_Roact_0.createElement(v8, {
            event = not not v11() and v14 or l_l_UserGameSettings_0_PropertyChangedSignal_0, 
            callback = v50.onQualityChanged
        })
    });
end;
return v33;

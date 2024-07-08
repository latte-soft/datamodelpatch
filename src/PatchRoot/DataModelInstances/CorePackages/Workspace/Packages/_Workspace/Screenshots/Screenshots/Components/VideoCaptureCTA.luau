local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_Parent_1.Localization);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.UIBlox);
local v6 = require(l_Parent_0.Analytics.useAnalytics);
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v11 = require(l_Parent_0.Analytics.EventNames);
local v12 = require(l_Parent_0.Context.ShotsContext);
local v13 = require(l_Parent_0.Flags.FFlagCapturesRemoveOldMenuTheme);
local v14 = Color3.fromRGB(255, 255, 255);
local v15 = Color3.fromRGB(255, 255, 255);
return function(v16)
    local v17 = v6();
    local v18 = l_useStyle_0();
    local l_themeOverrides_0 = v4.useContext(v12).themeOverrides;
    local v20 = l_useLocalization_0({
        videoCTATitle = "Feature.Captures.Title.VideoCTA", 
        videoEducationalText = "Feature.Captures.Label.VideoEducationalText", 
        startRecording = "Feature.Captures.Control.StartRecordingVideo", 
        stopRecording = "Feature.Captures.Control.StopRecordingVideo"
    });
    local v21, v22 = v4.useState(false);
    v4.useEffect(function()
        local v23 = nil;
        local l_FirstChild_0 = settings():FindFirstChild("Game Options");
        if l_FirstChild_0 then
            v23 = l_FirstChild_0.VideoRecordingChangeRequest:connect(function(v25)
                v22(v25);
            end);
        end;
        return function()
            if v23 then
                v23:disconnect();
            end;
        end;
    end, {});
    local v26 = v4.useCallback(function()
        if v21 then
            v17.fireEvent(v11.CapturesMigratedLegacyVideoRecordDeactivated);
        else
            v16.closeSettingsMenu();
            v17.fireEvent(v11.CapturesMigratedLegacyVideoRecordActivated);
        end;
        l_CoreGui_0:ToggleRecording();
    end, {
        v17.fireEvent, 
        v21, 
        v16.closeSettingsMenu
    });
    local l_Color_0 = v18.Theme.BackgroundDefault.Color;
    local l_Transparency_0 = v18.Theme.BackgroundDefault.Transparency;
    local l_Color_1 = v18.Theme.TextDefault.Color;
    local l_Font_0 = v18.Font.CaptionBody.Font;
    local v31 = v18.Font.BaseSize * v18.Font.CaptionBody.RelativeSize;
    local l_Color_2 = v18.Theme.TextEmphasis.Color;
    local l_Font_1 = v18.Font.Header2.Font;
    local v34 = v18.Font.BaseSize * v18.Font.Header2.RelativeSize;
    if not (v13 or not l_themeOverrides_0) then
        l_Color_0 = l_themeOverrides_0.color("RowFrameBackground", v14);
        l_Transparency_0 = l_themeOverrides_0.transparency("RowFrameBackground", 0.85);
        l_Color_1 = l_themeOverrides_0.color("TextDefault", v15);
        l_Font_0 = l_themeOverrides_0.font(l_Font_0, "UtilityText");
        v31 = l_themeOverrides_0.textSize(16, "UtilityText");
        l_Color_2 = l_themeOverrides_0.color("TextEmphasis", v15);
        l_Font_1 = l_themeOverrides_0.font(l_Font_1, "Button");
        v34 = l_themeOverrides_0.textSize(24, "Button");
    end;
    return v4.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        BorderSizePixel = 0, 
        LayoutOrder = 3, 
        Size = UDim2.fromScale(1, 0)
    }, {
        TextFrame = v4.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(0.7, 0)
        }, {
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            Title = v4.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = l_Font_1, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 30), 
                Text = v20.videoCTATitle, 
                TextColor3 = l_Color_2, 
                TextSize = v34, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            EducationalLabel = v4.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = l_Font_0, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 40), 
                Text = v20.videoEducationalText, 
                TextColor3 = l_Color_1, 
                TextSize = v31, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        }), 
        CapturesToggleFrame = v4.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(1, 0.5), 
            Size = UDim2.fromOffset(224, 44)
        }, {
            RecordButton = v4.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.Secondary, 
                onActivated = v26, 
                size = UDim2.fromScale(1, 1), 
                text = if not v21 then v20.startRecording else v20.stopRecording
            })
        })
    });
end;

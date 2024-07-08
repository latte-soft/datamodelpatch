local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local v10 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_LogReporterService_0 = game:GetService("LogReporterService");
local v15 = require(l_Modules_0.LuaApp.Util.Base64);
local l_Players_0 = game:GetService("Players");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local _ = require(l_Modules_0.LuaApp.Constants);
local v19 = Random.new();
GenerateHexString = function(v20)
    local v21 = "";
    for _ = 1, v20 do
        local v23 = v19:NextInteger(1, 16);
        v21 = v21 .. string.sub("0123456789abcdef", v23, v23);
    end;
    return v21;
end;
SetHexStringSeed = function(v24)
    v19 = Random.new(v24);
end;
return function()
    local v25 = l_useDispatch_0();
    local v26, v27 = v2.useState("");
    local v28, v29 = v2.useState("");
    local v30, v31 = v2.useState(false);
    local v40 = v2.useCallback(function()
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        SetHexStringSeed((math.floor(tick() * 1000 + (not not l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0))));
        local v33 = GenerateHexString(10);
        local v34 = string.format("%s-%s-%s-%s-%s", GenerateHexString(8), GenerateHexString(4), GenerateHexString(4), GenerateHexString(4), GenerateHexString(12));
        local v35 = GenerateHexString(64);
        local v36 = {
            reportId = v33, 
            userId = not not l_LocalPlayer_0 and tostring(l_LocalPlayer_0.UserId) or "", 
            placeId = tostring(game.PlaceId)
        };
        local l_status_0, l_result_0 = pcall(function()
            if not l_LocalPlayer_0 then
                return false, false;
            else
                return l_VoiceChatService_0:IsVoiceEnabledForUserIdAsync(l_LocalPlayer_0.UserId);
            end;
        end);
        v36.voiceEnabled = tostring(not not l_status_0 and (l_result_0 or false));
        local v39 = string.format("https://console.backtrace.rbx.com/p/LogReports/debug?time=hour&filters=%s", v15.Encode("[[\"reportId\",\"equal\",\"" .. v33 .. "\"]]"):sub(0, -2));
        l_LogReporterService_0:ReportLog(v15.Encode(v35):sub(0, -2), v34, "clientDump", v36, {});
        v27(v39);
        v29(v33);
        v31(true);
    end, {
        game.PlaceId
    });
    local v41 = v2.useCallback(function()
        v25(v6());
    end, {});
    local v42 = v10({
        cancelButtonText = "CommonUI.Features.Action.Close", 
        sendButtonText = "CommonUI.Features.Action.Send", 
        dialogTitle = "CommonUI.Features.Label.ReportLogs", 
        promptText = "CommonUI.Features.Prompt.ReportLogsQuestion", 
        resultText = "CommonUI.Features.Prompt.ReportLogsResult"
    });
    local v43 = l_useStyle_0();
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = v43.Theme.BackgroundUIDefault.Color, 
        BackgroundTransparency = 1, 
        Active = true, 
        Selectable = false
    }, {
        AlertWindow = v2.createElement(l_InteractiveAlert_0, {
            title = v42.dialogTitle, 
            screenSize = l_useSelector_0(function(v44)
                return v44.ScreenSize;
            end), 
            bodyText = if not v30 then v42.promptText else string.format("%s\nreportId: %s", v42.resultText, v28), 
            middleContent = function()
                return v2.createElement("TextButton", {
                    Text = v26, 
                    TextColor3 = v43.Tokens.Semantic.Color.Text.Link.Color3, 
                    TextWrapped = true, 
                    TextSize = v43.Tokens.Global.FontSize_50, 
                    Size = if not v30 then UDim2.new(0, 0, 0, 0) else UDim2.new(1, 0, 0, 75), 
                    BackgroundTransparency = 1, 
                    [v2.Event.Activated] = function()
                        l_default_0:shareUrl({
                            url = v26, 
                            context = "ReportLogsUrlShare"
                        });
                    end
                });
            end, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.Secondary, 
                        props = {
                            onActivated = v41, 
                            text = v42.cancelButtonText
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            text = v42.sendButtonText, 
                            userInteractionEnabled = not v30, 
                            isDisabled = v30, 
                            onActivated = v40
                        }
                    }
                }
            }
        })
    });
end;

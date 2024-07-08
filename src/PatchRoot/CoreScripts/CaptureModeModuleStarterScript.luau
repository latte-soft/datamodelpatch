local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
require(l_CorePackages_0.UIBlox).init((require(l_RobloxGui_0:WaitForChild("Modules").UIBloxInGameConfig)));
local v3 = game:DefineFastFlag("FeedbackModuleEarlyFontInitialization", false);
local v4 = game:DefineFastFlag("CaptureModeNativeExitSupport", false);
local l_GetFFlagSelectInSceneReportMenu_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSelectInSceneReportMenu;
if v3 then
    local l_TextService_0 = game:GetService("TextService");
    local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
    l_GetTextBoundsParams_0.Text = "random text";
    l_GetTextBoundsParams_0.Font = Font.fromEnum(Enum.Font.Gotham);
    l_GetTextBoundsParams_0.Size = 19;
    l_GetTextBoundsParams_0.Width = 0;
    local _ = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
end;
if v4 then
    game:GetService("GuiService").NativeClose:Connect(function()
        game:GetService("ExperienceStateCaptureService"):ToggleCaptureMode();
    end);
end;
if not l_GetFFlagSelectInSceneReportMenu_0() then
    require(l_RobloxGui_0.Modules.Feedback).initialize();
    return ;
else
    game:WaitForChild("SafetyService");
    if not game:GetService("SafetyService").IsCaptureModeForReport then
        require(l_RobloxGui_0.Modules.Feedback).initialize();
        return ;
    else
        require(l_CorePackages_0.Workspace.Packages.InGameAssetReporting).initialize();
        return ;
    end;
end;

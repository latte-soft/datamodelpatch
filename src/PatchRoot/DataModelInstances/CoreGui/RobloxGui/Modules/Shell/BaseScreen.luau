local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local v7 = require(l_Shell_0.Experiment.XboxPrimaryNavIXPTest);
local v8 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local v9 = require(l_Shell_0.Flags.GetFFlagXboxFixPrimaryNavABEvents);
return function(v10)
    local v11 = {};
    local v12 = false;
    local v13 = false;
    local v14 = nil;
    local v15 = "";
    v11.view = nil;
    v11.fixPosition = false;
    v11.GetBackText = function(_)
        return v15;
    end;
    local function _()
        if not v11.view then
            v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
        end;
        return v11.view;
    end;
    if not v10 then
        if not v11.view then
            v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
        end;
        v11.Container = v11.view.Container;
    end;
    local function v18()
        if v12 then
            l_ScreenManager_0:CloseCurrent(v11);
            if v8() > 0 then
                if not v9() then
                    l_Analytics_0.reportBackNavigation(v11:GetName());
                else
                    l_Analytics_0.reportBackNavigation(v11:GetId());
                    return ;
                end;
            end;
        end;
    end;
    v11.GetView = function(_)
        if not v11.view then
            v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
        end;
        return v11.view;
    end;
    v11.GetTitle = function(_)
        if not v11.view then
            v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
        end;
        return v11.view.TitleText.Text;
    end;
    v11.SetTitle = function(_, v22)
        if not v11.view then
            v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
        end;
        v11.view.TitleText.Text = v22;
    end;
    v11.SetTitleZIndex = function(_, v24)
        if not v11.view then
            v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
        end;
        v11.view.TitleText.ZIndex = v24;
    end;
    v11.SetBackText = function(_, v26)
        v15 = v26;
        if not v11.view then
            v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
        end;
        v11.view:SetBackText(v15);
    end;
    v11.GetDefaultSelectionObject = function(_)
        return nil;
    end;
    v11.Destroy = function(_)
        if not v11.view then
            v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
        end;
        v11.view.Container:Destroy();
    end;
    v11.SetPosition = function(_, v30)
        if not v11.view then
            v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
        end;
        v11.view.Container.Position = v30;
    end;
    v11.SetParent = function(_, v32)
        v14 = v32;
    end;
    v11.GetName = function(_)
        if not v11.view then
            v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
        end;
        return v11.view.TitleText.Text;
    end;
    v11.GetId = function(_)
        if not v11.view then
            v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
        end;
        return v11.view.TitleText.Text;
    end;
    v11.GetAnalyticsInfo = function(_)
        local v36 = {};
        local v37 = l_Analytics_0.WidgetNames("WidgetId");
        if not v11.view then
            v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
        end;
        v36[v37] = v11.view.TitleText.Text;
        return v36;
    end;
    v11.IsFocused = function(_)
        return v12;
    end;
    v11.ReloadView = function(_, v40)
        local l_view_0 = v11.view;
        local l_v13_0 = v13;
        local l_v12_0 = v12;
        if l_view_0 then
            if l_v12_0 then
                l_view_0:RemoveFocus();
            end;
            if l_v13_0 then
                l_view_0:Hide();
            end;
        end;
        if v40 then
            if l_v13_0 then
                v40:Show();
            end;
            if l_v12_0 then
                v40:Focus();
            end;
        end;
        v11.view = v40;
    end;
    v11.OnBackButtonClick = function(_)
        v18();
    end;
    v11.Show = function(v45)
        v13 = true;
        local l_l_ScreenManager_0_ScreenBelow_0 = l_ScreenManager_0:GetScreenBelow(v45);
        if not l_l_ScreenManager_0_ScreenBelow_0 or not l_l_ScreenManager_0_ScreenBelow_0.GetName then
            v45:SetBackText(l_LocalizedStrings_0:LocalizedString("BackWord"));
        else
            v45:SetBackText(l_l_ScreenManager_0_ScreenBelow_0:GetName());
        end;
        if v7.isUserEnrolled() then
            if not v11.view then
                v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
            end;
            if v11.view.OnShow then
                if not v11.view then
                    v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
                end;
                v11.view.OnShow();
            end;
        end;
        if not v11.view then
            v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
        end;
        v11.view.Container.Parent = v14;
        l_ScreenManager_0:DefaultCancelFade(v45.TransitionTweens);
        if not v45.fixPosition then
            local l_l_ScreenManager_0_0 = l_ScreenManager_0;
            if not v11.view then
                v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
            end;
            v45.TransitionTweens = l_l_ScreenManager_0_0:DefaultFadeIn(v11.view.Container);
        else
            local l_l_ScreenManager_0_1 = l_ScreenManager_0;
            if not v11.view then
                v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
            end;
            v45.TransitionTweens = l_l_ScreenManager_0_1:FadeInSitu(v11.view.Container);
        end;
        l_ScreenManager_0:PlayDefaultOpenSound();
        if v8() > 0 then
            if not v9() then
                l_Analytics_0.reportNavigationLoaded(v11:GetName());
            else
                l_Analytics_0.reportNavigationLoaded(v11:GetId());
                return ;
            end;
        end;
    end;
    v11.Hide = function(v49)
        v13 = false;
        if v7.isUserEnrolled() then
            if not v11.view then
                v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
            end;
            if v11.view.OnHide then
                if not v11.view then
                    v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
                end;
                v11.view.OnHide();
            end;
        end;
        if not v11.view then
            v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
        end;
        v11.view.Container.Parent = nil;
        l_ScreenManager_0:DefaultCancelFade(v49.TransitionTweens);
        v49.TransitionTweens = nil;
    end;
    v11.Focus = function(v50)
        v12 = true;
        if v50.SavedSelectedObject then
            local l_SavedSelectedObject_0 = v50.SavedSelectedObject;
            if not v11.view then
                v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
            end;
            if l_SavedSelectedObject_0:IsDescendantOf(v11.view.Container) then
                l_Utility_0.SetSelectedCoreObject(v50.SavedSelectedObject);
                goto label0 --[[  true, true  ]];
            end;
        end;
        l_Utility_0.SetSelectedCoreObject(v50:GetDefaultSelectionObject());
        ::label0::;
        if v7.isUserEnrolled() then
            if not v11.view then
                v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
            end;
            if v11.view.OnFocus then
                if not v11.view then
                    v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
                end;
                v11.view.OnFocus();
            end;
        end;
        l_ContextActionService_0:BindCoreAction("ReturnFromScreen", function(_, v53, _)
            if v53 == Enum.UserInputState.End then
                v18();
            end;
        end, false, Enum.KeyCode.ButtonB);
    end;
    v11.RemoveFocus = function(v55)
        v12 = false;
        local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
        if l_SelectedCoreObject_0 then
            if not v11.view then
                v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
            end;
            if l_SelectedCoreObject_0:IsDescendantOf(v11.view.Container) then
                v55.SavedSelectedObject = l_SelectedCoreObject_0;
                l_Utility_0.SetSelectedCoreObject(nil);
            end;
        end;
        if v7.isUserEnrolled() then
            if not v11.view then
                v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
            end;
            if v11.view.OnRemoveFocus then
                if not v11.view then
                    v11.view = require(l_Shell_0:FindFirstChild("Templates"):FindFirstChild("BaseScreen"))(v11);
                end;
                v11.view.OnRemoveFocus();
            end;
        end;
        l_ContextActionService_0:UnbindCoreAction("ReturnFromScreen");
    end;
    return v11;
end;

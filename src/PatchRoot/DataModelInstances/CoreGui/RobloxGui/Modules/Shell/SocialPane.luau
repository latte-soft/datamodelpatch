local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_GuiService_0 = game:GetService("GuiService");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_FriendsData_0 = require(l_Shell_0:FindFirstChild("FriendsData"));
local l_FriendsView_0 = require(l_Shell_0:FindFirstChild("FriendsView"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_ScrollingGrid_0 = require(l_Shell_0:FindFirstChild("ScrollingGrid"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_LoadingWidget_0 = require(l_Shell_0:FindFirstChild("LoadingWidget"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local v11 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local v12 = require(l_Shell_0.Flags.GetFFlagXboxFixPrimaryNavABEvents);
return function(v13)
    local v14 = {};
    local v15 = nil;
    local v16 = false;
    local v17 = l_Utility_0.Create("Frame")({
        Name = "SocialPane", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Visible = false, 
        SelectionImageObject = l_Utility_0.Create("ImageLabel")({
            BackgroundTransparency = 1
        }), 
        Parent = v13
    });
    local v18 = l_Utility_0.Create("Frame")({
        Size = UDim2.new(0, 1720, 0, 610), 
        Position = UDim2.new(0, 0, 0, 33), 
        BackgroundTransparency = 1, 
        Parent = v17
    });
    local v19 = l_ScrollingGrid_0({
        SelectionMode = "Middle", 
        Dynamic = true
    });
    v19:SetSize(UDim2.new(1, 0, 1, 0));
    v19:SetCellSize(Vector2.new(446, 114));
    v19:SetSpacing(Vector2.new(50, 10));
    v19:SetScrollDirection(v19.Enum.ScrollDirection.Horizontal);
    v19:SetPosition(UDim2.new(0, 0, 0, 0));
    local l_v19_GuiObject_0 = v19:GetGuiObject();
    l_v19_GuiObject_0.Visible = false;
    v19:SetParent(v18);
    local v21 = l_Utility_0.Create("ImageLabel")({
        Name = "noFriendsIcon", 
        Size = UDim2.new(0, 296, 0, 259), 
        Position = UDim2.new(0.5, -148, 0, 100), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/FriendsIcon@1080.png", 
        Visible = false, 
        Parent = v17
    });
    local v22 = l_Utility_0.Create("TextLabel")({
        Name = "NoFriendsText", 
        Size = UDim2.new(0, 500, 0, 72), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = l_LocalizedStrings_0:LocalizedString("NoFriendsPhrase"), 
        TextYAlignment = Enum.TextYAlignment.Top, 
        TextWrapped = true, 
        Visible = false, 
        Parent = v17
    });
    v22.Position = UDim2.new(0.5, -v22.Size.X.Offset / 2, 0, (v21.Position.Y.Offset + v21.Size.Y.Offset) + 32);
    local function _(v23)
        v21.Visible = not v23;
        v22.Visible = not v23;
    end;
    local function v27(v25)
        local v26 = v25 > 0;
        v21.Visible = not v26;
        v22.Visible = not v26;
    end;
    local function _()
        if v16 then
            local v28 = v15 and v15:GetDefaultFocusItem();
            if v28 then
                l_Utility_0.SetSelectedCoreObject(v28);
            end;
        end;
    end;
    local v33 = l_LoadingWidget_0({
        Parent = v17
    }, {
        function()
            local v30 = l_FriendsData_0.GetOnlineFriendsAsync();
            v15 = l_FriendsView_0(v19, v30, v27);
            local v31 = #v30 > 0;
            v21.Visible = not v31;
            v22.Visible = not v31;
            if v16 then
                local v32 = v15 and v15:GetDefaultFocusItem();
                if v32 then
                    l_Utility_0.SetSelectedCoreObject(v32);
                end;
            end;
        end
    });
    spawn(function()
        v33:AwaitFinished();
        v33:Cleanup();
        l_v19_GuiObject_0.Visible = true;
    end);
    v14.GetName = function(_)
        return l_LocalizedStrings_0:LocalizedString("FriendsWord");
    end;
    v14.GetId = function(_)
        return l_Analytics_0.TabNames("FriendsId");
    end;
    v14.IsFocused = function(_)
        return v16;
    end;
    v14.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("SocialPaneId")
        };
    end;
    v14.Show = function(v38)
        v17.Visible = true;
        v38.TransitionTweens = l_ScreenManager_0:DefaultFadeIn(v17);
        l_ScreenManager_0:PlayDefaultOpenSound();
        if v11() > 0 then
            if not v12() then
                l_Analytics_0.reportNavigationLoaded(v14:GetName());
            else
                l_Analytics_0.reportNavigationLoaded(l_Analytics_0.TabNames("FriendsId"));
                return ;
            end;
        end;
    end;
    v14.Hide = function(v39)
        v17.Visible = false;
        l_ScreenManager_0:DefaultCancelFade(v39.TransitionTweens);
        v39.TransitionTweens = nil;
    end;
    v14.Focus = function(_)
        v16 = true;
        if v16 then
            local v41 = v15 and v15:GetDefaultFocusItem();
            if v41 then
                l_Utility_0.SetSelectedCoreObject(v41);
            end;
        end;
    end;
    v14.RemoveFocus = function(_)
        v16 = false;
        local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
        if not (not l_SelectedCoreObject_0 or not l_SelectedCoreObject_0:IsDescendantOf(v17)) then
            l_Utility_0.SetSelectedCoreObject(nil);
        end;
    end;
    v14.SetPosition = function(_, v45)
        v17.Position = v45;
    end;
    v14.SetParent = function(_, v47)
        v17.Parent = v47;
    end;
    v14.IsAncestorOf = function(_, v49)
        return v17 and v17:IsAncestorOf(v49);
    end;
    return v14;
end;

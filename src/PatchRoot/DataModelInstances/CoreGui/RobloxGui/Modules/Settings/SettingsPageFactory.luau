local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_TweenService_0 = game:GetService("TweenService");
local v5 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v6 = require(l_RobloxGui_0.Modules.StyleWidgets);
local v7 = require(l_RobloxGui_0.Modules.Settings.Theme);
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v8 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local l_status_0, l_result_0 = pcall(function()
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v11 = l_status_0 and l_result_0;
local function v62()
    local v12 = {
        HubRef = nil, 
        LastSelectedObject = nil, 
        TabPosition = 0, 
        Active = false, 
        OpenStateChangedCount = 0, 
        ShouldShowBottomBar = true, 
        ShouldShowHubBar = true, 
        IsPageClipped = true, 
        SelectARow = nil
    };
    local v13 = {};
    local v14 = false;
    v12.TabHeader = v5:Create("TextButton")({
        Name = "Header", 
        Text = "", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.2, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0)
    });
    if not v5:IsSmallTouchScreen() then
        if v8 then
            v12.TabHeader.Size = UDim2.new(0, 220, 1, 0);
        end;
    else
        v12.TabHeader.Size = UDim2.new(0, 84, 1, 0);
    end;
    v12.TabHeader.MouseButton1Click:connect(function()
        if v12.HubRef then
            v12.HubRef:SwitchToPage(v12, true);
        end;
    end);
    local v15 = v5:Create("ImageLabel")({
        Name = "Icon", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0.75, 0, 0.75, 0), 
        Position = UDim2.new(0, 10, 0.5, -18), 
        Image = "", 
        ImageTransparency = 0.5, 
        Parent = v12.TabHeader
    });
    local _ = v5:Create("UIAspectRatioConstraint")({
        Name = "AspectRatioConstraint", 
        AspectRatio = 1, 
        Parent = v15
    });
    local v17 = 0;
    if v7.UIBloxThemeEnabled then
        v17 = -2;
    end;
    local v18 = v5:Create("TextLabel")({
        Name = "Title", 
        Text = "", 
        Font = v7.font(Enum.Font.SourceSansBold, "Button"), 
        FontSize = v7.fontSize(Enum.FontSize.Size24, "Button"), 
        TextColor3 = Color3.new(1, 1, 1), 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1.05, 0, 1, 0), 
        Position = UDim2.new(1.2, v7.TabHeaderIconPadding, 0, v17), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextTransparency = 0.5
    });
    local l_UITextSizeConstraint_0 = Instance.new("UITextSizeConstraint");
    l_UITextSizeConstraint_0.MaxTextSize = 24;
    if not v11 or v7.UIBloxThemeEnabled then
        v18.Parent = v15;
    else
        v18.Parent = v12.TabHeader;
        v18.TextScaled = true;
        v18.TextWrapped = true;
        l_UITextSizeConstraint_0.Parent = v18;
    end;
    if not v5:IsSmallTouchScreen() then
        if v8 then
            v18.FontSize = v7.fontSize(Enum.FontSize.Size48);
            l_UITextSizeConstraint_0.MaxTextSize = 48;
        end;
    else
        v18.FontSize = v7.fontSize(Enum.FontSize.Size18);
        l_UITextSizeConstraint_0.MaxTextSize = 18;
    end;
    local v20 = nil;
    local v21 = nil;
    if not v7.UIBloxThemeEnabled then
        v20 = v6.MakeTabSelectionWidget(v12.TabHeader);
    else
        v20 = v5:Create("ImageLabel")({
            Name = "TabSelection", 
            Visible = false, 
            BackgroundColor3 = v7.color("TabSelection"), 
            BackgroundTransparency = v7.transparency("TabSelection"), 
            Size = UDim2.new(1, -2, 0, 2), 
            Position = UDim2.new(0, 3, 1, -2), 
            BorderSizePixel = 0, 
            Parent = v12.TabHeader
        });
        v21 = v5:Create("Frame")({
            Name = "TabLabel", 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Parent = v12.TabHeader
        });
        v5:Create("UIListLayout")({
            Name = "Layout", 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 10), 
            Parent = v21
        });
        v15.Parent = v21;
        v18.Parent = v21;
        v18.Size = UDim2.new(0, 0, 0, 0);
        v18.AutomaticSize = Enum.AutomaticSize.XY;
    end;
    local v22 = Vector2.new(v18.Size.X.Scale, v18.Size.Y.Scale);
    v5:OnResized(v12.TabHeader, function()
        if v12.TabHeader then
            if not v7.UIBloxThemeEnabled then
                if not v5:IsSmallTouchScreen() then
                    if not v8 then
                        v12.TabHeader.Icon.Size = UDim2.new(0, 44, 0, 37);
                        v12.TabHeader.Icon.Position = UDim2.new(0, 15, 0.5, -18);
                        v12.TabHeader.Icon.AnchorPoint = Vector2.new(0, 0);
                    else
                        v12.TabHeader.Icon.Size = UDim2.new(0, 88, 0, 74);
                        v12.TabHeader.Icon.Position = UDim2.new(0, 0, 0.5, 0);
                        v12.TabHeader.Icon.AnchorPoint = Vector2.new(0, 0.5);
                    end;
                else
                    v12.TabHeader.Icon.Size = UDim2.new(0, 34, 0, 28);
                    v12.TabHeader.Icon.Position = UDim2.new(v12.TabHeader.Icon.Position.X.Scale, v12.TabHeader.Icon.Position.X.Offset, 0.5, -14);
                    v12.TabHeader.Icon.AnchorPoint = Vector2.new(0, 0);
                end;
            elseif not v5:IsSmallTouchScreen() then
                if not v8 then
                    local v23 = v7.getIconSize(v7.IconSize.Medium);
                    v15.Size = UDim2.fromOffset(v23, v23);
                else
                    v15.Size = UDim2.new(0, 88, 0, 74);
                end;
            else
                v15.Size = UDim2.new(0, 34, 0, 28);
            end;
            local v24 = v5:IsPortrait();
            if not v7.UIBloxThemeEnabled then
                if not v24 then
                    v12.TabHeader.Icon.Position = UDim2.new(0, 10, 0.5, -14);
                    v12.TabHeader.Icon.AnchorPoint = Vector2.new(0, 0);
                    v12.TabHeader.Icon.Size = UDim2.new(0, 34, 0, 28);
                    if not v11 then
                        v12.TabHeader.Icon.Title.Visible = true;
                    else
                        v12.TabHeader.Title.Visible = true;
                    end;
                else
                    v12.TabHeader.Icon.Position = UDim2.new(0.5, 0, 0.5, 0);
                    v12.TabHeader.Icon.AnchorPoint = Vector2.new(0.5, 0.5);
                    v12.TabHeader.Icon.Size = UDim2.new(0.5, 0, 0.5, 0);
                    if not v11 then
                        v12.TabHeader.Icon.Title.Visible = false;
                    else
                        v12.TabHeader.Title.Visible = false;
                    end;
                end;
            else
                local l_Layout_0 = v21.Layout;
                if not v24 then
                    if v5:IsSmallTouchScreen() then
                        v18.FontSize = v7.fontSize(Enum.FontSize.Size18);
                    end;
                    l_Layout_0.FillDirection = Enum.FillDirection.Horizontal;
                    l_Layout_0.Padding = UDim.new(0, 10);
                else
                    if v5:IsSmallTouchScreen() then
                        v18.FontSize = v7.fontSize(Enum.FontSize.Size14);
                    end;
                    v15.Size = UDim2.new(0, 22, 0, 22);
                    l_Layout_0.FillDirection = Enum.FillDirection.Vertical;
                    l_Layout_0.Padding = UDim.new(0, 0);
                end;
            end;
            if not (not v11 or v7.UIBloxThemeEnabled) then
                local l_AbsoluteSize_0 = v12.TabHeader.Icon.AbsoluteSize;
                v18.Position = UDim2.new(0.125, l_AbsoluteSize_0.X + v7.TabHeaderIconPadding, 0.225, 0);
                v18.Size = UDim2.new((v22.X - 0.125) - 0.025, -(l_AbsoluteSize_0.X + v7.TabHeaderIconPadding), 0.5, 0);
            end;
            return ;
        else
            return ;
        end;
    end);
    v12.Page = v5:Create("Frame")({
        Name = "Page", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    });
    if v7.UIBloxThemeEnabled then
        v5:Create("UIPadding")({
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 11), 
            Parent = v12.Page
        });
    end;
    v12.PageListLayout = v5:Create("UIListLayout")({
        Name = "RowListLayout", 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = UDim.new(0, not v7.UIBloxThemeEnabled and 3 or 8), 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Parent = v12.Page
    });
    l_GuiService_0:AddSelectionParent(l_HttpService_0:GenerateGUID(false), v12.Page);
    v12.Displayed = Instance.new("BindableEvent");
    v12.Displayed.Name = "Displayed";
    v12.Displayed.Event:connect(function()
        if v12.HubRef.Shield.Visible then
            v12:SelectARow();
            return ;
        else
            return ;
        end;
    end);
    v12.Hidden = Instance.new("BindableEvent");
    v12.Hidden.Event:connect(function()
        if not (not l_GuiService_0.SelectedCoreObject or not l_GuiService_0.SelectedCoreObject:IsDescendantOf(v12.Page)) then
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    end);
    v12.Hidden.Name = "Hidden";
    v12.SelectARow = function(_, v28)
        if not (not (v28 or not l_GuiService_0.SelectedCoreObject) and l_GuiService_0.SelectedCoreObject:IsDescendantOf(v12.Page)) then
            if not v12.LastSelectedObject then
                if v13 and #v13 > 0 then
                    local _ = nil;
                    l_GuiService_0.SelectedCoreObject = if type(v13[1].ValueChanger) ~= "table" then v13[1].ValueChanger else not not v13[1].ValueChanger.SliderFrame and v13[1].ValueChanger.SliderFrame or v13[1].ValueChanger.SelectorFrame;
                end;
            else
                l_GuiService_0.SelectedCoreObject = v12.LastSelectedObject;
                return ;
            end;
        end;
    end;
    v12.Display = function(_, v31, v32)
        v12.OpenStateChangedCount = v12.OpenStateChangedCount + 1;
        if v12.TabHeader then
            if not v7.UIBloxThemeEnabled then
                v12.TabHeader.TabSelection.Visible = true;
                v12.TabHeader.Icon.ImageTransparency = 0;
                if not v11 then
                    v12.TabHeader.Icon.Title.TextTransparency = 0;
                else
                    v12.TabHeader.Title.TextTransparency = 0;
                end;
            else
                v12.TabHeader.TabSelection.Visible = true;
                v15.ImageTransparency = 0;
                v18.TextTransparency = 0;
            end;
        end;
        v12.Page.Parent = v31;
        v12.Page.Visible = true;
        local v33 = UDim2.new(0, 0, 0, 0);
        local function v34()
            v12.Page.Visible = true;
            v14 = true;
            v12.Displayed:Fire();
        end;
        if not v32 then
            if not l_UserGameSettings_0.ReducedMotion then
                v12.Page:TweenPosition(v33, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true, v34);
                return ;
            else
                v12.Page.Position = v33;
                v31.InnerCanvasGroupShow.GroupTransparency = 1;
                v12.Page.Parent = v31.InnerCanvasGroupShow;
                v12.Page.Visible = true;
                local v35 = l_TweenService_0:Create(v31.InnerCanvasGroupShow, TweenInfo.new(0.25), {
                    GroupTransparency = 0
                });
                v35:Play();
                v35.Completed:Connect(function()
                    v12.Page.Parent = v31;
                    v12.Page.Visible = true;
                    v14 = true;
                    v12.Displayed:Fire();
                end);
                return ;
            end;
        else
            v12.Page.Position = v33;
            v12.Page.Visible = true;
            v14 = true;
            v12.Displayed:Fire();
            return ;
        end;
    end;
    v12.Hide = function(_, v37, v38, v39, v40, v41, v42)
        v12.OpenStateChangedCount = v12.OpenStateChangedCount + 1;
        if v12.TabHeader then
            if not v7.UIBloxThemeEnabled then
                v12.TabHeader.TabSelection.Visible = false;
                v12.TabHeader.Icon.ImageTransparency = 0.5;
                if not v11 then
                    v12.TabHeader.Icon.Title.TextTransparency = 0.5;
                else
                    v12.TabHeader.Title.TextTransparency = 0.5;
                end;
            else
                v12.TabHeader.TabSelection.Visible = false;
                v15.ImageTransparency = 0.5;
                v18.TextTransparency = 0.5;
            end;
        end;
        if v12.Page.Parent then
            local v43 = UDim2.new(1 * v37, 0, 0, 0);
            local function v44()
                v12.Page.Visible = false;
                v12.Page.Position = UDim2.new(v12.TabPosition - v38, 0, 0, 0);
                v14 = false;
                v12.Hidden:Fire();
            end;
            local function v46()
                if not v39 then
                    if not l_UserGameSettings_0.ReducedMotion or not v42 then
                        v12.Page:TweenPosition(v43, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, v44);
                        return ;
                    else
                        v41.InnerCanvasGroupHide.GroupTransparency = 0;
                        v12.Page.Parent = v41.InnerCanvasGroupHide;
                        local v45 = l_TweenService_0:Create(v41.InnerCanvasGroupHide, TweenInfo.new(0.25), {
                            GroupTransparency = 1
                        });
                        v45:Play();
                        v45.Completed:Connect(function()
                            v12.Page.Parent = v41;
                            v12.Page.Position = v43;
                            v12.Page.Visible = false;
                            v12.Page.Position = UDim2.new(v12.TabPosition - v38, 0, 0, 0);
                            v14 = false;
                            v12.Hidden:Fire();
                        end);
                        return ;
                    end;
                else
                    v12.Page.Position = v43;
                    v12.Page.Visible = false;
                    v12.Page.Position = UDim2.new(v12.TabPosition - v38, 0, 0, 0);
                    v14 = false;
                    v12.Hidden:Fire();
                    return ;
                end;
            end;
            if not v40 then
                v46();
            else
                local l_OpenStateChangedCount_0 = v12.OpenStateChangedCount;
                delay(v40, function()
                    if l_OpenStateChangedCount_0 == v12.OpenStateChangedCount then
                        v46();
                    end;
                end);
                return ;
            end;
        end;
    end;
    v12.GetDisplayed = function(_)
        return v14;
    end;
    v12.GetVisibility = function(_)
        return v12.Page.Parent;
    end;
    v12.GetTabHeader = function(_)
        return v12.TabHeader;
    end;
    v12.SetHub = function(_, v52)
        v12.HubRef = v52;
        for _, v54 in next, v13, nil do
            if type(v54.ValueChanger) == "table" then
                v54.ValueChanger.HubRef = v12.HubRef;
            end;
        end;
    end;
    v12.GetSize = function(_)
        return v12.Page.AbsoluteSize;
    end;
    v12.AddRow = function(_, v57, v58, v59, v60)
        v13[#v13 + 1] = {
            SelectionFrame = v57, 
            Label = v58, 
            ValueChanger = v59
        };
        local v61 = 0;
        if v57 then
            v61 = v57.Size.Y.Offset;
        end;
        if not v60 then
            v12.Page.Size = UDim2.new(1, 0, 0, v12.Page.Size.Y.Offset + v61);
        else
            v12.Page.Size = UDim2.new(1, 0, 0, (v12.Page.Size.Y.Offset + v61) + v60);
        end;
        if v12.HubRef and type(v59) == "table" then
            v59.HubRef = v12.HubRef;
        end;
    end;
    return v12;
end;
return {
    CreateNewPage = function(_)
        return (v62());
    end
};

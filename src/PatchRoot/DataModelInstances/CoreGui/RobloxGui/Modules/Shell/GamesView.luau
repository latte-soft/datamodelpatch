local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_GuiService_0 = game:GetService("GuiService");
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_SortsData_0 = require(l_Shell_0:FindFirstChild("SortsData"));
local l_ScrollingGrid_0 = require(l_Shell_0:FindFirstChild("ScrollingGrid"));
local l_GameCarouselItem_0 = require(l_Shell_0:FindFirstChild("GameCarouselItem"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_LockedGameCarouselView_0 = require(l_Shell_0:FindFirstChild("LockedGameCarouselView"));
local l_AchievementManager_0 = require(l_Shell_0:FindFirstChild("AchievementManager"));
return function(v11, v12)
    local v13 = l_ScrollingGrid_0(v11);
    v13.Container.Visible = false;
    local v14 = {};
    local v15 = {};
    local v16 = {};
    local v17 = nil;
    local v18 = false;
    local v19 = false;
    local v20 = nil;
    local v21 = l_Utility_0.Create("ImageLabel")({
        Name = "StaticSelectionImage", 
        Size = UDim2.new(0, 246, 0, 246), 
        BackgroundTransparency = 1, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(19, 19, 43, 43), 
        Image = "rbxasset://textures/ui/SelectionBox.png", 
        Selectable = false, 
        ZIndex = 3
    });
    local v22 = l_LockedGameCarouselView_0();
    v22:SetSelectionImageObject(l_Utility_0.Create("ImageLabel")({
        BackgroundTransparency = 1
    }));
    v22:SetParent(nil);
    v22:SetZIndex(2);
    local function _(v23)
        return UDim2.new(v23.Position.X.Scale, v23.Position.X.Offset - 7, v23.Position.Y.Scale, (v23.Position.Y.Offset + 50) - 7);
    end;
    local function v27()
        local v25 = #v15 > 0 and v15[1] or nil;
        if v25 then
            local l_v25_Container_0 = v25:GetContainer();
            v21.Position = UDim2.new(l_v25_Container_0.Position.X.Scale, l_v25_Container_0.Position.X.Offset - 7, l_v25_Container_0.Position.Y.Scale, (l_v25_Container_0.Position.Y.Offset + 50) - 7);
            v21.Size = UDim2.new(0, 246, 0, 246);
            v21.Parent = v13.Container.Parent;
        end;
        v22:SetParent(nil);
    end;
    local function v30()
        v22:SetParent(nil);
        local v28 = #v15 > 0 and v15[1] or nil;
        if v28 then
            local l_v28_Container_0 = v28:GetContainer();
            v21.Position = UDim2.new(l_v28_Container_0.Position.X.Scale, l_v28_Container_0.Position.X.Offset - 7, l_v28_Container_0.Position.Y.Scale, (l_v28_Container_0.Position.Y.Offset + 50) - 7);
            v21.Size = UDim2.new(0, 246, 0, 246);
        end;
    end;
    local function v36()
        local v31 = #v15 > 0 and v15[1] or nil;
        if v31 then
            local l_v31_CarouselView_0 = v31:GetCarouselView();
            if l_v31_CarouselView_0 then
                local l_Size_0 = l_v31_CarouselView_0:GetContainer().Size;
                local v34 = UDim2.new(0, l_Size_0.X.Offset, 0, l_Size_0.Y.Offset * 0.84);
                v22:SetSize(v34);
                v22:SetPosition(UDim2.new(0, 8, 0, 8));
                v21.Size = v34 + UDim2.new(0, 16, 0, 16);
                local l_Position_0 = l_v31_CarouselView_0:GetContainer().Position;
                v21.Position = UDim2.new(l_Position_0.X.Scale, l_Position_0.X.Offset - 118, l_Position_0.Y.Scale, l_Position_0.Y.Offset + 10);
            end;
        end;
        v22:SetParent(v21);
    end;
    local function _()
        v21.Parent = nil;
    end;
    local _ = {};
    local function v41(v39)
        local v40 = v15[v39];
        return v40 and v40:GetContainer();
    end;
    local function _(v42)
        for v43 = 1, #v15 do
            if v42 == v15[v43] then
                return v43;
            end;
        end;
        return 0;
    end;
    local function _(v45)
        for v46 = 1, #v16 do
            if v45 == v16[v46] then
                return v46;
            end;
        end;
        return 0;
    end;
    local v48 = 0;
    local function _()
        for v49 = 1, #v15 do
            if v15[v49]:IsSelected() then
                return v49;
            end;
        end;
        return 0;
    end;
    local function _()
        for v51 = 1, #v15 do
            local v52 = v15[v51];
            if v52:IsSelected() then
                return v52;
            end;
        end;
        return nil;
    end;
    local function v63()
        if not v18 then
            local v54;
            for v55 = 1, #v15 do
                if v15[v55]:IsSelected() then
                    v54 = v55;
                    goto label0 --[[  true, false  ]];
                end;
            end;
            v54 = 0;
            ::label0::;
            v48 = v54;
            local v56 = nil;
            if v54 == 0 then
                for v57 = 1, #v15 do
                    local v58 = v15[v57];
                    v58:RemoveFocus();
                    v58:SetTransparency(0, 0, 0.5);
                end;
                return ;
            else
                for v59 = 1, #v15 do
                    local v60 = v15[v59];
                    local v61 = 0;
                    local v62 = 0;
                    if not v60:IsSelected() then
                        if v59 < v54 then
                            v61 = 4;
                            v62 = 4;
                        elseif v59 == v54 then
                            v61 = 0;
                            v62 = 0;
                        else
                            v61 = 0.5;
                            v62 = 0.5;
                        end;
                        v60:RemoveFocus();
                    else
                        v60:Focus();
                        v27();
                        v56 = v60;
                    end;
                    v60:SetTransparency(v61, v62, nil);
                end;
                if v56 then
                    if not v56:IsLocked() then
                        v30();
                    else
                        v36();
                        return ;
                    end;
                end;
                return ;
            end;
        else
            return ;
        end;
    end;
    local function v70()
        local v64;
        for v65 = 1, #v15 do
            if v15[v65]:IsSelected() then
                v64 = v65;
                goto label1 --[[  true, false  ]];
            end;
        end;
        v64 = 0;
        ::label1::;
        if v64 > 0 then
            for v66 = 1, #v15 do
                local v67 = v15[v66];
                local v68 = 0;
                local v69 = 0;
                if v66 < v64 then
                    v68 = 4;
                    v69 = 4;
                elseif v66 == v64 then
                    v68 = 0;
                    v69 = 0;
                else
                    v68 = 0.5;
                    v69 = 0.5;
                end;
                v67:SetTransparency(v68, v69, 0, true);
            end;
        end;
    end;
    local function v86(v71)
        if v71 then
            local v72;
            for v73 = 1, #v15 do
                if v71 == v15[v73] then
                    v72 = v73;
                    goto label2 --[[  true, false  ]];
                end;
            end;
            v72 = 0;
            ::label2::;
            if not v71:HasResults() then
                if v72 > 0 then
                    local v74 = v71:IsSelected();
                    v71:RemoveFocus();
                    table.remove(v15, v72);
                    v13:RecalcLayout(#v15 + 1);
                    if not (not v19 or not v74) then
                        if v72 > 0 and v72 <= #v15 then
                            v15[v72]:Focus();
                        else
                            v13:BackToInitial();
                            if #v15 > 0 then
                                v15[1]:Focus();
                            end;
                        end;
                    end;
                    local v75;
                    for v76 = 1, #v15 do
                        if v15[v76]:IsSelected() then
                            v75 = v76;
                            goto label3 --[[  true, false  ]];
                        end;
                    end;
                    v75 = 0;
                    ::label3::;
                    v48 = v75;
                end;
            elseif v72 == 0 then
                local v77;
                for v78 = 1, #v15 do
                    if v15[v78]:IsSelected() then
                        v77 = v78;
                        goto label4 --[[  true, false  ]];
                    end;
                end;
                v77 = 0;
                ::label4::;
                local v79 = false;
                for v80 = 1, #v15 do
                    local v81;
                    for v82 = 1, #v16 do
                        if v71 == v16[v82] then
                            v81 = v82;
                            goto label5 --[[  true, false  ]];
                        end;
                    end;
                    v81 = 0;
                    ::label5::;
                    local v83 = v15[v80];
                    local v84;
                    for v85 = 1, #v16 do
                        if v83 == v16[v85] then
                            v84 = v85;
                            goto label6 --[[  true, false  ]];
                        end;
                    end;
                    v84 = 0;
                    ::label6::;
                    if v81 < v84 then
                        table.insert(v15, v80, v71);
                        v79 = true;
                        break;
                    end;
                end;
                if not v79 then
                    table.insert(v15, v71);
                end;
                v13:RecalcLayout(#v15 + 1);
                v15[v77]:Focus();
            end;
            v70();
            return ;
        else
            return ;
        end;
    end;
    local function _(v87, v88)
        local v89 = l_GameCarouselItem_0(UDim2.new(0, 1900, 0, 250), v87, v88, v12, v86);
        table.insert(v15, v89);
        table.insert(v16, v89);
        return v89;
    end;
    local function v99(v91)
        local l_Featured_0 = l_SortsData_0.DefaultSortId.Featured;
        for v93 = 1, #v91 do
            local v94 = v91[v93];
            local v95 = l_GameCarouselItem_0(UDim2.new(0, 1900, 0, 250), v94.Name, function()
                return v94;
            end, v12, v86);
            table.insert(v15, v95);
            table.insert(v16, v95);
            local l_v95_0 = v95;
            if not (v94.userId or not l_v95_0) and v94.Id ~= l_Featured_0 then
                l_v95_0:SetLockInPUP(true);
            end;
        end;
        v13:SetItemCallback(v41);
        v13:RecalcLayout(#v15 + 1);
        for v97 = 1, #v16 do
            if l_AchievementManager_0:AllGamesUnlocked() or not v16[v97]:GetLockInPUP() then
                v16[v97]:Unlock();
            else
                v16[v97]:Lock();
            end;
        end;
        for v98 = 1, #v16 do
            v16[v98]:Init();
        end;
    end;
    local v100 = nil;
    local function v105()
        if not v18 then
            v18 = true;
            local v101 = false;
            local v102 = nil;
            if not l_SortsData_0:HasSorts() then
                v101 = true;
            else
                v102 = l_SortsData_0:GetSorts();
                if not v100 or v102.Version ~= v100 then
                    v101 = true;
                end;
            end;
            if not v101 then
                v18 = false;
            else
                v13.Container.Visible = false;
                spawn(function()
                    local v103 = 2;
                    while not (not (v103 > 0) or v102) do
                        v102 = l_SortsData_0:GetSorts();
                        v103 = v103 - 1;
                    end;
                    if v102 then
                        if #v16 > 0 then
                            for v104 = 1, #v16 do
                                v16[v104]:Destroy();
                            end;
                        end;
                        v15 = {};
                        v16 = {};
                        v20 = nil;
                        v12(nil);
                        v13:RecalcLayout(0);
                        v13:BackToInitial();
                        v48 = 0;
                        v99(v102.Data);
                        v100 = v102.Version;
                    end;
                    v13.Container.Visible = true;
                    if v19 and #v15 > 0 then
                        v15[1]:Focus();
                        v27();
                        v70();
                    end;
                    v18 = false;
                end);
            end;
            return ;
        else
            return ;
        end;
    end;
    local function v110()
        v13:Focus();
        if not v18 then
            local v106 = 0;
            if not v20 then
                for v107 = 1, #v15 do
                    if v15[v107]:IsSelected() then
                        v106 = v107;
                        goto label7 --[[  true, false  ]];
                    end;
                end;
                v106 = 0;
            else
                local l_v20_0 = v20;
                for v109 = 1, #v15 do
                    if l_v20_0 == v15[v109] then
                        v106 = v109;
                        goto label8 --[[  true, false  ]];
                    end;
                end;
                v106 = 0;
                ::label8::;
                v20 = nil;
            end;
            ::label7::;
            if v106 > 0 and v106 <= #v15 then
                v15[v106]:Focus();
            else
                v13:BackToInitial();
                if #v15 > 0 then
                    v15[1]:Focus();
                end;
            end;
            v70();
        end;
    end;
    local function v117(v111)
        local v112;
        for v113 = 1, #v15 do
            local v114 = v15[v113];
            if v114:IsSelected() then
                v112 = v114;
                goto label9 --[[  true, false  ]];
            end;
        end;
        v112 = nil;
        ::label9::;
        v20 = v112;
        v48 = 0;
        if v111 then
            v13:BackToInitial(l_GlobalSettings_0.TabDockTweenDuration);
            v20 = nil;
        end;
        v21.Parent = nil;
        v13:RemoveFocus();
        for v115 = 1, #v15 do
            local v116 = v15[v115];
            v116:RemoveFocus();
            v116:SetTransparency(0, 0, 0.5);
        end;
    end;
    v14.GetDefaultFocusItem = function(_)
        return nil;
    end;
    v14.SetParent = function(_, v120)
        v13:SetParent(v120);
    end;
    v14.Load = function(_)
        v105();
    end;
    v14.Focus = function(_)
        v19 = true;
        l_Utility_0.DisconnectEvent(v17);
        v17 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):connect(function()
            v63();
        end);
        v110();
    end;
    v14.RemoveFocus = function(_, v124)
        v19 = false;
        l_Utility_0.DisconnectEvent(v17);
        v117(v124);
    end;
    l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.PlayedGamesChanged, "GamesPaneRecentlyPlayedUpdate");
    l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.FavoriteToggle, "GamesPaneFavoritesUpdate");
    l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.UnlockedUGC, "GamesPaneUnlockedUGC");
    l_EventHub_0:addEventListener(l_EventHub_0.Notifications.PlayedGamesChanged, "GamesPaneRecentlyPlayedUpdate", function()
        spawn(function()
            local v125 = l_LocalizedStrings_0:LocalizedString("RecentlyPlayedSortTitle");
            for v126 = 1, #v16 do
                if v125 == v16[v126]:GetSortName() then
                    v16[v126]:Refresh();
                    return ;
                end;
            end;
        end);
    end);
    l_EventHub_0:addEventListener(l_EventHub_0.Notifications.FavoriteToggle, "GamesPaneFavoritesUpdate", function(v127)
        if v127 then
            spawn(function()
                local v128 = l_LocalizedStrings_0:LocalizedString("FavoritesSortTitle");
                for v129 = 1, #v16 do
                    if v128 == v16[v129]:GetSortName() then
                        v16[v129]:Refresh();
                        return ;
                    end;
                end;
            end);
        end;
    end);
    if not l_AchievementManager_0:AllGamesUnlocked() then
        l_EventHub_0:addEventListener(l_EventHub_0.Notifications.UnlockedUGC, "GamesPaneUnlockedUGC", function()
            spawn(function()
                for v130 = 1, #v16 do
                    if v16[v130]:IsLocked() then
                        v16[v130]:Unlock();
                    end;
                end;
            end);
        end);
    end;
    spawn(function()
        v105();
    end);
    return v14;
end;

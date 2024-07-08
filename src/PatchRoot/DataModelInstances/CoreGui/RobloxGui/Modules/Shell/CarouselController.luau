local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_Modules_0.Shell.EventHub);
local v4 = require(l_Modules_0.Shell.GlobalSettings);
local v5 = require(l_Modules_0.Shell.SoundManager);
local v6 = require(l_Modules_0.Shell.Utility);
local v7 = require(l_Modules_0.Shell.GameData);
local v8 = require(l_Modules_0.Shell.Http);
local v9 = require(l_Modules_0.Shell.BatchThumbnailLoader);
local v10 = require(l_Modules_0.Shell.ThumbnailLoader);
return function(v11, v12, v13, v14, v15)
    v12 = v12 or false;
    local v16 = {};
    local v17 = nil;
    local v18 = nil;
    local v19 = tonumber(v15) or 1;
    local v20 = nil;
    local v21 = 10;
    local v22 = {};
    local v23 = {};
    local v24 = false;
    local v25 = tonumber(v13) or 1;
    local v26 = tonumber(v14) or 0;
    local v27 = false;
    local v28 = true;
    local v29 = false;
    v16.NewItemSelected = v6.Signal();
    local function v43(v30)
        local l_placeId_0 = v30.placeId;
        local l_v7_GameData_0 = v7:GetGameData(l_placeId_0);
        if not l_v7_GameData_0 then
            return ;
        else
            local v33 = v6.Create("ImageButton")({
                Name = "CarouselViewImage", 
                BackgroundColor3 = v4.ModalBackgroundColor, 
                BorderSizePixel = 0; 
                v5:CreateSound("MoveSelection")
            });
            local l_v11_SelectionImageObject_0 = v11:GetSelectionImageObject();
            if l_v11_SelectionImageObject_0 then
                v33.SelectionImageObject = l_v11_SelectionImageObject_0;
            end;
            local v35 = nil;
            if not l_v7_GameData_0.ImageToken then
                v35 = v10:Create(v33, l_v7_GameData_0.UniverseId, v10.GameIconSizes.Medium, v10.AssetType.SquareIcon);
                spawn(function()
                    v35:LoadAsync(true, false, nil);
                end);
            else
                v35 = v9;
                v9:CreateThumbnail(v33, l_v7_GameData_0.ImageToken, v9.Sizes.Medium, true, false, nil);
            end;
            local v36 = {
                item = v33, 
                thumbnailLoader = v35, 
                PlaceId = l_placeId_0
            };
            local v37 = {};
            v36.AnimateTransparency = function(_, v39, v40, v41)
                v6.CancelTweens(v37);
                local v42 = nil;
                if v39 < v40 then
                    v35:SetTransparency(v40, v33);
                else
                    v42 = function()
                        v35:SetTransparency(v40, v33);
                    end;
                end;
                table.insert(v37, v6.PropertyTweener(v33, "BackgroundTransparency", v39, v40, v41, v6.EaseOutQuad, true));
                table.insert(v37, v6.PropertyTweener(v33, "ImageTransparency", v39, v40, v41, v6.EaseOutQuad, true, v42));
            end;
            return v36;
        end;
    end;
    local function _(v44)
        if v44 then
            local v45 = {
                PreviousUrl = v44.PreviousUrl, 
                NextUrl = v44.NextUrl
            };
            local l_v44_PagePlaceIds_0 = v44:GetPagePlaceIds();
            local l_v44_PagePlaceNames_0 = v44:GetPagePlaceNames();
            local l_v44_PageVoteData_0 = v44:GetPageVoteData();
            local l_v44_PageIconIds_0 = v44:GetPageIconIds();
            local l_v44_CreatorNames_0 = v44:GetCreatorNames();
            local l_v44_PageCreatorUserIds_0 = v44:GetPageCreatorUserIds();
            for v52 = 1, #v44.Data do
                table.insert(v45, {
                    Name = l_v44_PagePlaceNames_0[v52], 
                    PlaceId = l_v44_PagePlaceIds_0[v52], 
                    IconId = l_v44_PageIconIds_0[v52], 
                    VoteData = l_v44_PageVoteData_0[v52], 
                    CreatorName = l_v44_CreatorNames_0[v52], 
                    CreatorUserId = l_v44_PageCreatorUserIds_0[v52], 
                    Description = nil, 
                    IsFavorited = nil, 
                    GameData = nil
                });
            end;
            return v45;
        else
            return {};
        end;
    end;
    local v54 = nil;
    local function v71(v55)
        local v56 = {};
        local v57 = {};
        for v58 = 1, #v55 do
            local v59 = v55[v58];
            local l_placeId_1 = v59.placeId;
            local v61 = v43(v59);
            if v61 then
                v61.item.Activated:connect(function()
                    if v59.isSponsored then
                        spawn(function()
                            v8.PostSponsoredGameClickAsync(v59.nativeAdData);
                        end);
                    end;
                    if l_placeId_1 then
                        v3:dispatchEvent(v3.Notifications.OpenGameDetail, l_placeId_1);
                    end;
                end);
                table.insert(v57, v61);
            end;
        end;
        v56.LockFirstItem = function(_)
            if not ((not v57 or not v57[1]) or not v57[1].item) then
                v57[1].item.NextSelectionLeft = v57[1].item;
            end;
        end;
        v56.UnlockFirstItem = function(_)
            if not ((not v57 or not v57[1]) or not v57[1].item) then
                v57[1].item.NextSelectionLeft = nil;
            end;
        end;
        v56.LockLastItem = function(_)
            if not ((not v57 or not v57[#v57]) or not v57[#v57].item) then
                v57[#v57].item.NextSelectionRight = v57[#v57].item;
            end;
        end;
        v56.UnlockLastItem = function(_)
            if not ((not v57 or not v57[#v57]) or not v57[#v57].item) then
                v57[#v57].item.NextSelectionRight = nil;
            end;
        end;
        v56.GetCount = function(_)
            return #v57;
        end;
        v56.GetItems = function(_)
            return v57;
        end;
        v56.Destroy = function(_)
            for v69, v70 in pairs(v57) do
                v57[v69] = nil;
                v70.item:Destroy();
            end;
        end;
        return v56;
    end;
    local function v76()
        local v72 = nil;
        local v73 = nil;
        for v74, _ in pairs(v22) do
            if not v72 or v74 < v72 then
                v72 = v74;
            end;
            if not v73 or v73 < v74 then
                v73 = v74;
            end;
        end;
        return v72, v73;
    end;
    local function _(v77)
        if v77 < 1 then
            return nil;
        else
            local l_v17_SortAsync_0 = v17:GetSortAsync((v77 - 1) * 25, 25);
            if l_v17_SortAsync_0 then
                if #l_v17_SortAsync_0 > 0 then
                    v22[v77] = l_v17_SortAsync_0;
                end;
                return v22[v77];
            else
                return nil;
            end;
        end;
    end;
    local function _(v80)
        local l_v17_CuratedSortAsync_0 = v17:GetCuratedSortAsync(v80, 25);
        if not l_v17_CuratedSortAsync_0 or #l_v17_CuratedSortAsync_0 == 0 then
            v29 = true;
            return nil;
        else
            if #l_v17_CuratedSortAsync_0 < 25 then
                v29 = true;
            end;
            v22[v80] = l_v17_CuratedSortAsync_0;
            return v22[v80];
        end;
    end;
    local function v89(v83)
        if v83 < 0 then
            v28 = true;
            return nil;
        else
            local l_v17_CuratedSortAsync_1, v85 = v17:GetCuratedSortAsync(v83, 25, true);
            if not l_v17_CuratedSortAsync_1 or #l_v17_CuratedSortAsync_1 == 0 then
                v28 = true;
                return nil;
            else
                if not v85 or #l_v17_CuratedSortAsync_1 < 25 then
                    v28 = true;
                end;
                if v83 == 0 then
                    local _, v87 = v76();
                    for v88 = v87, 1, -1 do
                        v22[v88 + 1] = v22[v88];
                    end;
                    v22[1] = l_v17_CuratedSortAsync_1;
                else
                    v22[v83] = l_v17_CuratedSortAsync_1;
                end;
                if v83 == 0 then
                    v83 = 1;
                    v25 = v25 + 1;
                    v26 = v26 + 1;
                end;
                return v22[v83];
            end;
        end;
    end;
    local function v95()
        local v90 = v25 - 1;
        v25 = 1;
        v26 = v26 - v90;
        for v91 = 1, v90 do
            local v92 = v23[v91];
            if v92 then
                v23[v91] = nil;
                v11:RemoveAmountFromFront(v92:GetCount());
                v92:Destroy();
            end;
        end;
        for v93 = 1, v26 do
            v22[v93] = v22[v93 + v90];
            v23[v93] = v23[v93 + v90];
        end;
        for v94 = v26 + 1, v26 + v90 do
            v22[v94] = nil;
            v23[v94] = nil;
        end;
        v19 = v19 - v90 * 25;
    end;
    local v96 = nil;
    v54 = function(v97)
        local v98 = 0;
        if v96 then
            v98 = v11:GetItemIndex(v97) - v11:GetItemIndex(v96);
        end;
        local _ = v11:GetVisibleCount();
        local l_v11_Count_0 = v11:GetCount();
        if v98 > 0 then
            local l_v11_FirstVisibleItemIndex_0 = v11:GetFirstVisibleItemIndex();
            local l_v11_LastVisibleItemIndex_0 = v11:GetLastVisibleItemIndex();
            if not (v24 or v29) and l_v11_Count_0 <= l_v11_LastVisibleItemIndex_0 + v21 then
                v24 = true;
                local l_l_v11_FirstVisibleItemIndex_0_0 = l_v11_FirstVisibleItemIndex_0 --[[ copy: 4 -> 6 ]];
                spawn(function()
                    local v104 = nil;
                    if not v27 then
                        local v105 = v26 + 1;
                        if v105 < 1 then
                            v104 = nil;
                        else
                            local l_v17_SortAsync_1 = v17:GetSortAsync((v105 - 1) * 25, 25);
                            if l_v17_SortAsync_1 then
                                if #l_v17_SortAsync_1 > 0 then
                                    v22[v105] = l_v17_SortAsync_1;
                                end;
                                v104 = v22[v105];
                            else
                                v104 = nil;
                            end;
                        end;
                    else
                        local v107 = v26 + 1;
                        local l_v17_CuratedSortAsync_2 = v17:GetCuratedSortAsync(v107, 25);
                        if not l_v17_CuratedSortAsync_2 or #l_v17_CuratedSortAsync_2 == 0 then
                            v29 = true;
                            v104 = nil;
                        else
                            if #l_v17_CuratedSortAsync_2 < 25 then
                                v29 = true;
                            end;
                            v22[v107] = l_v17_CuratedSortAsync_2;
                            v104 = v22[v107];
                        end;
                    end;
                    if not v104 then
                        v29 = true;
                    else
                        local v109 = v71(v104);
                        v26 = v26 + 1;
                        v11:InsertCollectionBack(v109:GetItems());
                        v23[v26] = v109;
                        if v23[v26 - 1] then
                            v23[v26 - 1]:UnlockLastItem();
                        end;
                        v109:LockLastItem();
                        if v11:GetCount() > 50 then
                            local v110 = nil;
                            v110 = v23[v25];
                            if (l_l_v11_FirstVisibleItemIndex_0_0 - v110:GetCount()) - v21 > 0 then
                                v23[v25] = nil;
                                v25 = v25 + 1;
                                v11:RemoveAmountFromFront(v110:GetCount());
                                v110:Destroy();
                                if v28 then
                                    v28 = false;
                                end;
                            end;
                        end;
                    end;
                    v24 = false;
                end);
            end;
        elseif v98 < 0 then
            local l_v11_FirstVisibleItemIndex_1 = v11:GetFirstVisibleItemIndex();
            local l_v11_LastVisibleItemIndex_1 = v11:GetLastVisibleItemIndex();
            if not (v24 or v28) and l_v11_FirstVisibleItemIndex_1 - v21 <= 0 then
                v24 = true;
                spawn(function()
                    local v113 = nil;
                    if not v27 then
                        local v114 = v25 - 1;
                        if v114 < 1 then
                            v113 = nil;
                        else
                            local l_v17_SortAsync_2 = v17:GetSortAsync((v114 - 1) * 25, 25);
                            if l_v17_SortAsync_2 then
                                if #l_v17_SortAsync_2 > 0 then
                                    v22[v114] = l_v17_SortAsync_2;
                                end;
                                v113 = v22[v114];
                            else
                                v113 = nil;
                            end;
                        end;
                    else
                        v113 = v89(v25 - 1);
                    end;
                    if not v113 then
                        v28 = true;
                    else
                        local v116 = v71(v113);
                        v25 = v25 - 1;
                        v11:InsertCollectionFront(v116:GetItems());
                        v23[v25] = v116;
                        if v23[v25 + 1] then
                            v23[v25 + 1]:UnlockFirstItem();
                        end;
                        v116:LockFirstItem();
                        if v11:GetCount() > 50 then
                            local v117 = nil;
                            v117 = v23[v26];
                            if l_v11_LastVisibleItemIndex_1 + v21 < l_v11_Count_0 - v117:GetCount() then
                                v23[v26] = nil;
                                v26 = v26 - 1;
                                v11:RemoveAmountFromBack(v117:GetCount());
                                v117:Destroy();
                                if v29 then
                                    v29 = false;
                                end;
                            end;
                        end;
                    end;
                    if not (not v27 or not v28) and v25 > 1 then
                        v95();
                    end;
                    v24 = false;
                end);
            end;
        end;
        v19 = v19 + v98;
        v96 = v97;
        v11:ChangeFocus(v97);
        local v118 = math.ceil(v19 / 25);
        v18 = v22[v118][v19 - (v118 - 1) * 25];
        v16.NewItemSelected:fire(v18.placeId, nil, v18.isSponsored);
    end;
    v16.GetFrontGameData = function(_)
        if not v22[v25] then
            return ;
        else
            return v22[v25][1];
        end;
    end;
    v16.GetCurrentFocusGameData = function(_)
        return v18;
    end;
    v16.SelectFront = function(_)
        local l_v11_Front_0 = v11:GetFront();
        if l_v11_Front_0 then
            v54(l_v11_Front_0);
        end;
    end;
    v16.SetLoadBuffer = function(_, v124)
        v21 = v124;
    end;
    v16.InitializeAsync = function(_, v126)
        v11:RemoveAllItems();
        v25 = v25 or 1;
        v26 = v26 or 0;
        v19 = v19 or 1;
        v18 = nil;
        v22 = {};
        v23 = {};
        v17 = v126;
        v27 = (v126 and v126.GameSetTargetId) and v126.GameSetTargetId ~= 0;
        local v127 = true;
        if v25 <= v26 and v19 > 0 then
            local v128 = 0;
            local v129 = (v25 - 1) * 25;
            for v130 = v25, v26 do
                local v131;
                if v27 then
                    local l_v17_CuratedSortAsync_3 = v17:GetCuratedSortAsync(v130, 25);
                    if not l_v17_CuratedSortAsync_3 or #l_v17_CuratedSortAsync_3 == 0 then
                        v29 = true;
                        v131 = nil;
                    else
                        if #l_v17_CuratedSortAsync_3 < 25 then
                            v29 = true;
                        end;
                        v22[v130] = l_v17_CuratedSortAsync_3;
                        v131 = v22[v130];
                    end;
                    if v131 then
                        goto label0;
                    end;
                end;
                if v130 < 1 then
                    v131 = nil;
                else
                    local l_v17_SortAsync_3 = v17:GetSortAsync((v130 - 1) * 25, 25);
                    if l_v17_SortAsync_3 then
                        if #l_v17_SortAsync_3 > 0 then
                            v22[v130] = l_v17_SortAsync_3;
                        end;
                        v131 = v22[v130];
                    else
                        v131 = nil;
                    end;
                end;
                ::label0::;
                if v131 then
                    local v134 = v71(v131);
                    v11:InsertCollectionBack(v134:GetItems());
                    v23[v130] = v134;
                    v129 = v129 + v134:GetCount();
                    v128 = v128 + 1;
                else
                    break;
                end;
            end;
            v26 = (v25 + v128) - 1;
            if v128 > 0 then
                local v135 = nil;
                if v129 < v19 then
                    v19 = v129;
                    v135 = v11:GetBack();
                else
                    v135 = v11:GetItemAt(v19 - (v25 - 1) * 25);
                end;
                if v135 then
                    v96 = v135;
                    v11:ChangeFocus(v135, 0);
                    v127 = false;
                end;
            end;
            if v127 then
                v11:RemoveAllItems();
                v25 = 1;
                v26 = 0;
                v19 = 1;
                v18 = nil;
                v22 = {};
                for v136 = 1, #v23 do
                    v23[v136]:Destroy();
                    v23[v136] = nil;
                end;
                v23 = {};
            end;
        end;
        if v127 then
            for v137 = 1, 2 do
                local v138 = nil;
                if not v27 then
                    if v137 < 1 then
                        v138 = nil;
                    else
                        local l_v17_SortAsync_4 = v17:GetSortAsync((v137 - 1) * 25, 25);
                        if l_v17_SortAsync_4 then
                            if #l_v17_SortAsync_4 > 0 then
                                v22[v137] = l_v17_SortAsync_4;
                            end;
                            v138 = v22[v137];
                        else
                            v138 = nil;
                        end;
                    end;
                else
                    local l_v17_CuratedSortAsync_4 = v17:GetCuratedSortAsync(v137, 25);
                    if not l_v17_CuratedSortAsync_4 or #l_v17_CuratedSortAsync_4 == 0 then
                        v29 = true;
                        v138 = nil;
                    else
                        if #l_v17_CuratedSortAsync_4 < 25 then
                            v29 = true;
                        end;
                        v22[v137] = l_v17_CuratedSortAsync_4;
                        v138 = v22[v137];
                    end;
                end;
                if v138 then
                    local v141 = v71(v138);
                    v26 = v26 + 1;
                    v11:InsertCollectionBack(v141:GetItems());
                    v23[v137] = v141;
                else
                    break;
                end;
            end;
            local l_v11_Front_1 = v11:GetFront();
            if l_v11_Front_1 then
                v19 = 1;
                v96 = l_v11_Front_1;
                v11:SetFocus(l_v11_Front_1);
            end;
        end;
        if v23 and v26 > 0 then
            if v23[v25] then
                v23[v25]:LockFirstItem();
            end;
            if v23[v26] then
                v23[v26]:LockLastItem();
            end;
        end;
    end;
    v16.GetIndexData = function(_)
        return v25, v26, v19;
    end;
    v16.Connect = function(_)
        v20 = v6.DisconnectEvent(v20);
        v20 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):connect(function()
            local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
            if not (not l_SelectedCoreObject_0 or not v11:ContainsItem(l_SelectedCoreObject_0)) then
                v54(l_SelectedCoreObject_0);
            end;
        end);
        local function _(v146)
            return v11:GetItemAt(v11:GetItemIndex(v96) + v11:GetFullVisibleItemCount() * v146) or (v146 == 1 and v11:GetBack() or v11:GetFront());
        end;
        local function _()
            local v148 = v11:GetItemAt(v11:GetItemIndex(v96) + v11:GetFullVisibleItemCount() * 1) or (v11:GetBack() or v11:GetFront());
            if v148 then
                l_GuiService_0.SelectedCoreObject = v148;
            end;
        end;
        local function _()
            local v150 = v11:GetItemAt(v11:GetItemIndex(v96) + v11:GetFullVisibleItemCount() * -1) or v11:GetFront();
            if v150 then
                l_GuiService_0.SelectedCoreObject = v150;
            end;
        end;
        local v152 = false;
        local function v158(_, v154, _)
            if v154 == Enum.UserInputState.Begin then
                v152 = true;
                return ;
            else
                if v152 and v154 == Enum.UserInputState.End then
                    local l_SelectedCoreObject_1 = l_GuiService_0.SelectedCoreObject;
                    if not (not l_SelectedCoreObject_1 or not v11:ContainsItem(l_SelectedCoreObject_1)) then
                        local v157 = v11:GetItemAt(v11:GetItemIndex(v96) + v11:GetFullVisibleItemCount() * 1) or (v11:GetBack() or v11:GetFront());
                        if v157 then
                            l_GuiService_0.SelectedCoreObject = v157;
                        end;
                    end;
                    v152 = false;
                end;
                return ;
            end;
        end;
        local v159 = false;
        local function v165(_, v161, _)
            if v161 == Enum.UserInputState.Begin then
                v159 = true;
                return ;
            else
                if v159 and v161 == Enum.UserInputState.End then
                    local l_SelectedCoreObject_2 = l_GuiService_0.SelectedCoreObject;
                    if not (not l_SelectedCoreObject_2 or not v11:ContainsItem(l_SelectedCoreObject_2)) then
                        local v164 = v11:GetItemAt(v11:GetItemIndex(v96) + v11:GetFullVisibleItemCount() * -1) or v11:GetFront();
                        if v164 then
                            l_GuiService_0.SelectedCoreObject = v164;
                        end;
                    end;
                    v152 = false;
                end;
                return ;
            end;
        end;
        if not v12 then
            l_ContextActionService_0:UnbindCoreAction("BumperRight");
            l_ContextActionService_0:UnbindCoreAction("BumperLeft");
            l_ContextActionService_0:BindCoreAction("BumperRight", v158, false, Enum.KeyCode.ButtonR1);
            l_ContextActionService_0:BindCoreAction("BumperLeft", v165, false, Enum.KeyCode.ButtonL1);
        end;
    end;
    v16.Disconnect = function(_)
        v20 = v6.DisconnectEvent(v20);
        if not v12 then
            l_ContextActionService_0:UnbindCoreAction("BumperRight");
            l_ContextActionService_0:UnbindCoreAction("BumperLeft");
        end;
    end;
    v16.HasResults = function(_)
        return v26 - v25 >= 0;
    end;
    return v16;
end;

local l_RobloxGui_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui");
local l_Shell_0 = l_RobloxGui_0:FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_GameData_0 = require(l_Shell_0:FindFirstChild("GameData"));
return function()
    local v4 = {};
    local v5 = {};
    local v6 = 0;
    local v7 = 1;
    local v8 = nil;
    local v9 = false;
    local v10 = nil;
    local v11 = true;
    local v12 = Color3.new(1, 1, 1);
    local v13 = Color3.new(0.4, 0.4, 0.4);
    local v14 = Color3.new(1, 1, 1);
    local v15 = l_Utility_0.Create("ScrollingFrame")({
        Name = "CarouselContainer", 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        ScrollingEnabled = false, 
        Selectable = false, 
        ScrollBarThickness = 0
    });
    local function _(v16)
        local v17 = false;
        if v16.AbsolutePosition.x + v16.AbsoluteSize.x >= 0 then
            v17 = v16.AbsolutePosition.x < l_RobloxGui_0.AbsoluteSize.x;
        end;
        return v17;
    end;
    local function v21()
        local l_v7_0 = v7;
        if v9 then
            l_v7_0 = 1;
        end;
        local v20 = v15.Size.Y.Offset * l_v7_0;
        return UDim2.new(0, v20, 0, v20);
    end;
    local function v23()
        local v22 = v15.Size.Y.Offset * v7;
        return UDim2.new(0, v22, 0, v22);
    end;
    local function _(v24)
        if v24 == v8 then
            return v21();
        else
            return v23();
        end;
    end;
    local function v41(v26)
        local l_v4_ItemIndex_0 = v4:GetItemIndex(v8);
        local v28 = v26 - l_v4_ItemIndex_0;
        local v29 = 0;
        local _ = 0;
        if l_v4_ItemIndex_0 < v26 then
            local l_v7_1 = v7;
            if v9 then
                l_v7_1 = 1;
            end;
            local v32 = v15.Size.Y.Offset * l_v7_1;
            local v33 = UDim2.new(0, v32, 0, v32).X.Offset + v28 * v6;
            local v34 = v28 - 1;
            local v35 = v15.Size.Y.Offset * v7;
            v29 = v33 + v34 * UDim2.new(0, v35, 0, v35).X.Offset;
        else
            local v36 = v28 * v6;
            local v37 = v15.Size.Y.Offset * v7;
            v29 = v36 + v28 * UDim2.new(0, v37, 0, v37).X.Offset;
        end;
        local v38, v39;
        if l_v4_ItemIndex_0 == v26 then
            v38 = v7;
            if v9 then
                v38 = 1;
            end;
            local v40 = v15.Size.Y.Offset * v38;
            v39 = UDim2.new(0, v40, 0, v40);
            if v39 then
                goto label0;
            end;
        end;
        v38 = v15.Size.Y.Offset * v7;
        v39 = UDim2.new(0, v38, 0, v38);
        ::label0::;
        return UDim2.new(0, v29, 0, (v15.Size.Y.Offset - v39.Y.Offset) / 2);
    end;
    local function v50(v42)
        v42 = v42 or 0;
        for v43 = 1, #v5 do
            local l_item_0 = v5[v43].item;
            local v45;
            if l_item_0 == v8 then
                local l_v7_2 = v7;
                if v9 then
                    l_v7_2 = 1;
                end;
                local v47 = v15.Size.Y.Offset * l_v7_2;
                v45 = UDim2.new(0, v47, 0, v47);
            else
                local v48 = v15.Size.Y.Offset * v7;
                v45 = UDim2.new(0, v48, 0, v48);
            end;
            local v49 = v41(v43);
            if not l_item_0:IsDescendantOf(game) then
                l_item_0.Size = v45;
                l_item_0.Position = v49;
            else
                l_item_0:TweenSizeAndPosition(v45, v49, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, v42, true);
            end;
        end;
    end;
    v4.ChangeFocus = function(v51, v52, v53)
        if v51:ContainsItem(v52) then
            v8 = v52;
            v50(v53 or 0.2);
        end;
    end;
    v4.SetSize = function(_, v55)
        if v55 ~= v15.Size then
            v15.Size = v55;
            v15.CanvasSize = UDim2.new(0, v15.Size.X.Offset * 2, 1, 0);
            v50();
        end;
    end;
    v4.SetPosition = function(_, v57)
        v15.Position = v57;
    end;
    v4.SetPadding = function(_, v59)
        if v59 ~= v6 then
            v6 = v59;
            v50();
        end;
    end;
    v4.SetItemSizePercentOfContainer = function(_, v61)
        if v61 ~= v7 then
            v7 = v61;
            v50();
        end;
    end;
    v4.SetParent = function(_, v63)
        v15.Parent = v63;
    end;
    v4.SetFocus = function(v64, v65)
        if v64:ContainsItem(v65) and v65 ~= v8 then
            v8 = v65;
            v50();
        end;
    end;
    v4.SetClipsDescendants = function(_, v67)
        v15.ClipsDescendants = v67;
    end;
    local v68 = 0;
    v4.SetTransparency = function(_, v70, v71, v72)
        if not v72 and v70 == v68 then
            return ;
        else
            if not v71 then
                v71 = 0.2;
            else
                v68 = l_Utility_0.Clamp(0, 1, v68);
                if not v72 and v70 == v68 then
                    return ;
                end;
            end;
            for _, v74 in pairs(v5) do
                v74:AnimateTransparency(v68, v70, v71);
            end;
            v68 = v70;
            return ;
        end;
    end;
    v4.GetTransparency = function(_)
        return v68;
    end;
    v4.SetSelectable = function(_, v77)
        v12 = v14;
        if not v77 then
            v12 = v13;
        end;
        v11 = v77;
        for _, v79 in pairs(v5) do
            v79.item.Selectable = v11;
            v79.item.ImageColor3 = v12;
        end;
    end;
    v4.GetAvailableItem = function(v80)
        if not v8 or not v8.Parent then
            return v80:GetFront();
        else
            return v8;
        end;
    end;
    v4.GetFocusItem = function(_)
        return v8;
    end;
    v4.GetItemAt = function(_, v83)
        return v5[v83] and v5[v83].item;
    end;
    v4.GetFront = function(_)
        return v5[1] and v5[1].item;
    end;
    v4.GetBack = function(_)
        return v5[#v5] and v5[#v5].item;
    end;
    v4.GetItemIndex = function(_, v87)
        for v88 = 1, #v5 do
            if v5[v88].item == v87 then
                return v88;
            end;
        end;
        return 0;
    end;
    v4.GetCount = function(_)
        return #v5;
    end;
    v4.GetVisibleCount = function(_)
        local v91 = 0;
        for v92 = 1, #v5 do
            local l_item_1 = v5[v92].item;
            local v94 = false;
            if l_item_1.AbsolutePosition.x + l_item_1.AbsoluteSize.x >= 0 then
                v94 = l_item_1.AbsolutePosition.x < l_RobloxGui_0.AbsoluteSize.x;
            end;
            if v94 then
                v91 = v91 + 1;
            end;
        end;
        return v91;
    end;
    v4.GetFirstVisibleItemIndex = function(_)
        for v96 = 1, #v5 do
            local l_item_2 = v5[v96].item;
            local v98 = false;
            if l_item_2.AbsolutePosition.x + l_item_2.AbsoluteSize.x >= 0 then
                v98 = l_item_2.AbsolutePosition.x < l_RobloxGui_0.AbsoluteSize.x;
            end;
            if v98 then
                return v96;
            end;
        end;
    end;
    v4.GetLastVisibleItemIndex = function(_)
        for v100 = #v5, 1, -1 do
            local l_item_3 = v5[v100].item;
            local v102 = false;
            if l_item_3.AbsolutePosition.x + l_item_3.AbsoluteSize.x >= 0 then
                v102 = l_item_3.AbsolutePosition.x < l_RobloxGui_0.AbsoluteSize.x;
            end;
            if v102 then
                return v100;
            end;
        end;
    end;
    v4.GetFullVisibleItemCount = function(_)
        local l_x_0 = v15.AbsoluteSize.x;
        local l_v7_3 = v7;
        if v9 then
            l_v7_3 = 1;
        end;
        local v106 = v15.Size.Y.Offset * l_v7_3;
        local v107 = l_x_0 - UDim2.new(0, v106, 0, v106).X.Offset;
        if v107 <= 0 then
            return 0;
        else
            v106 = v15.Size.Y.Offset * v7;
            return math.floor(v107 / (UDim2.new(0, v106, 0, v106).X.Offset + v6)) + 1;
        end;
    end;
    v4.InsertCollectionFront = function(_, v109)
        for v110 = #v109, 1, -1 do
            local v111 = v109[v110];
            local l_item_4 = v111.item;
            l_item_4.Selectable = v11;
            l_item_4.ImageColor3 = v12;
            l_item_4.ImageTransparency = v68;
            l_item_4.BackgroundTransparency = v68;
            l_item_4.Position = v41(0);
            local v113;
            if l_item_4 == v8 then
                local l_v7_4 = v7;
                if v9 then
                    l_v7_4 = 1;
                end;
                local v115 = v15.Size.Y.Offset * l_v7_4;
                v113 = UDim2.new(0, v115, 0, v115);
            else
                local v116 = v15.Size.Y.Offset * v7;
                v113 = UDim2.new(0, v116, 0, v116);
            end;
            l_item_4.Size = v113;
            table.insert(v5, 1, v111);
            l_item_4.Parent = v15;
            l_GameData_0:AddRelatedGuiObject(v111.PlaceId, l_item_4);
        end;
    end;
    v4.InsertCollectionBack = function(_, v118)
        for v119 = 1, #v118 do
            local v120 = v118[v119];
            local l_item_5 = v120.item;
            l_item_5.Selectable = v11;
            l_item_5.ImageColor3 = v12;
            l_item_5.ImageTransparency = v68;
            l_item_5.BackgroundTransparency = v68;
            l_item_5.Position = v41(#v5 + 1);
            local v122;
            if l_item_5 == v8 then
                local l_v7_5 = v7;
                if v9 then
                    l_v7_5 = 1;
                end;
                local v124 = v15.Size.Y.Offset * l_v7_5;
                v122 = UDim2.new(0, v124, 0, v124);
            else
                local v125 = v15.Size.Y.Offset * v7;
                v122 = UDim2.new(0, v125, 0, v125);
            end;
            l_item_5.Size = v122;
            table.insert(v5, v120);
            l_item_5.Parent = v15;
            l_GameData_0:AddRelatedGuiObject(v120.PlaceId, l_item_5);
        end;
    end;
    v4.RemoveAmountFromFront = function(_, v127)
        for _ = 1, v127 do
            table.remove(v5, 1).item.Parent = nil;
        end;
        v50();
    end;
    v4.RemoveAmountFromBack = function(_, v130)
        for _ = 1, v130 do
            table.remove(v5).item.Parent = nil;
        end;
        v50();
    end;
    v4.RemoveItem = function(_, v133)
        for v134 = 1, #v5 do
            if v5[v134].item == v133 then
                table.remove(v5, v134).item.Parent = nil;
                break;
            end;
        end;
        v50();
    end;
    v4.RemoveAllItems = function(_)
        for _ = #v5, 1, -1 do
            table.remove(v5, #v5).item.Parent = nil;
        end;
    end;
    v4.ContainsItem = function(_, v138)
        if v138 then
            return v138.Parent == v15;
        else
            return false;
        end;
    end;
    local function _()
        v4:ChangeFocus(v8);
    end;
    v4.Focus = function(_)
        if not v9 then
            v9 = true;
            v4:ChangeFocus(v8);
            return ;
        else
            return ;
        end;
    end;
    v4.GetContainer = function(_)
        return v15;
    end;
    v4.RemoveFocus = function(_)
        if v9 then
            v9 = false;
            v4:ChangeFocus(v8);
            return ;
        else
            return ;
        end;
    end;
    v4.SetSelectionImageObject = function(_, v144)
        v10 = v144;
    end;
    v4.GetSelectionImageObject = function(_)
        return v10;
    end;
    return v4;
end;

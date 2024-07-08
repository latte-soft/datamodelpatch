local l_Utility_0 = require(game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell"):FindFirstChild("Utility"));
local l_GuiService_0 = game:GetService("GuiService");
return function(v2)
    local v3 = {
        Enum = {
            ScrollDirection = {
                Vertical = 1, 
                Horizontal = 2
            }, 
            StartCorner = {
                UpperLeft = 1, 
                UpperRight = 2, 
                BottomLeft = 3, 
                BottomRight = 4
            }
        }, 
        RecalcLayout = nil, 
        GridItems = {}, 
        ItemSet = {}
    };
    v2 = v2 or {};
    v3.ScrollDirection = not not v2.ScrollDirection and v3.Enum.ScrollDirection[v2.ScrollDirection] or v3.Enum.ScrollDirection.Vertical;
    v3.StartCorner = not not v2.StartCorner and v3.Enum.StartCorner[v2.StartCorner] or v3.Enum.StartCorner.UpperLeft;
    v3.FixedRowColumnCount = v2.FixedRowColumnCount;
    v3.CellSize = v2.CellSize or Vector2.new(100, 100);
    v3.Padding = v2.Padding or Vector2.new(0, 0);
    v3.Spacing = v2.Spacing or Vector2.new(0, 0);
    v3.Dynamic = v2.Dynamic or false;
    local v4 = {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        CanvasSize = UDim2.new(1, 0, 1, 0), 
        Name = "ScrollingGridContainer", 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Visible = true, 
        ScrollingEnabled = false, 
        ScrollBarThickness = 0, 
        Selectable = false
    };
    for v5, v6 in pairs(v2) do
        if v4[v5] ~= nil then
            v4[v5] = v6;
        end;
    end;
    v3.Container = l_Utility_0.Create("ScrollingFrame")(v4);
    v3.DefaultSelection = v3.Container;
    v3.Container:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
        v3:RecalcLayout();
    end);
    v3.GetPadding = function(v7)
        return v7.Padding;
    end;
    v3.SetPadding = function(v8, v9)
        if v9 ~= v8.Padding then
            v8.Padding = v9;
            v8:RecalcLayout();
        end;
    end;
    v3.GetSpacing = function(v10)
        return v10.Spacing;
    end;
    v3.SetSpacing = function(v11, v12)
        if v12 ~= v11.Spacing then
            v11.Spacing = v12;
            v11:RecalcLayout();
        end;
    end;
    v3.GetCellSize = function(v13)
        return v13.CellSize;
    end;
    v3.GetGridItemSize = function(v14)
        return v14.CellSize;
    end;
    v3.SetCellSize = function(v15, v16)
        if v16 ~= v15.CellSize then
            v15.CellSize = v16;
            v15:RecalcLayout();
        end;
    end;
    v3.GetScrollDirection = function(v17)
        return v17.ScrollDirection;
    end;
    v3.SetScrollDirection = function(v18, v19)
        if v19 ~= v18.ScrollDirection then
            v18.ScrollDirection = v19;
            v18:RecalcLayout();
        end;
    end;
    v3.GetStartCorner = function(v20)
        return v20.StartCorner;
    end;
    v3.SetStartCorner = function(v21, v22)
        if v22 ~= v21.StartCorner then
            v21.StartCorner = v22;
            v21:RecalcLayout();
        end;
    end;
    v3.GetRowColumnConstraint = function(v23)
        return v23.FixedRowColumnCount;
    end;
    v3.SetRowColumnConstraint = function(v24, v25)
        if v25 < 1 then
            v25 = nil;
        end;
        if v25 ~= v24.FixedRowColumnCount then
            v24.FixedRowColumnCount = v25;
            v24:RecalcLayout();
        end;
    end;
    v3.GetClipping = function(v26)
        return v26.Container.ClipsDescendants;
    end;
    v3.SetClipping = function(v27, v28)
        v27.Container.ClipsDescendants = v28;
    end;
    v3.GetVisible = function(v29)
        return v29.Container.Visible;
    end;
    v3.SetVisible = function(v30, v31)
        v30.Container.Visible = v31;
    end;
    v3.GetSize = function(v32)
        return v32.Container.Size;
    end;
    v3.SetSize = function(v33, v34)
        v33.Container.Size = v34;
    end;
    v3.GetPosition = function(v35)
        return v35.Container.Position;
    end;
    v3.SetPosition = function(v36, v37)
        v36.Container.Position = v37;
    end;
    v3.GetParent = function(v38)
        return v38.Container.Parent;
    end;
    v3.SetParent = function(v39, v40)
        v39.Container.Parent = v40;
    end;
    v3.GetGuiObject = function(v41)
        return v41.Container;
    end;
    v3.SetDefaultSelection = function(v42, v43)
        v42.DefaultSelection = v43;
    end;
    v3.ResetDefaultSelection = function(v44)
        v44.DefaultSelection = v44.Container;
    end;
    v3.ContainsItem = function(v45, v46)
        return v45.ItemSet[v46] ~= nil;
    end;
    v3.FindAncestorGridItem = function(v47, v48)
        if v48 ~= nil then
            if not v47:ContainsItem(v48) then
                return v47:FindAncestorGridItem(v48.Parent);
            else
                return v48;
            end;
        else
            return ;
        end;
    end;
    v3.Get2DGridIndex = function(v49, v50)
        local v51 = v50 - 1;
        local l_v49_NumRowsColumns_0, v53 = v49:GetNumRowsColumns();
        local _ = nil;
        local _ = nil;
        if v49.ScrollDirection == v49.Enum.ScrollDirection.Vertical then
            return math.floor(v51 / v53), v51 % v53;
        else
            return v51 % l_v49_NumRowsColumns_0, (math.floor(v51 / l_v49_NumRowsColumns_0));
        end;
    end;
    v3.GetGridPosition = function(v56, v57, v58)
        local l_v56_CellSize_0 = v56:GetCellSize();
        local l_v56_Spacing_0 = v56:GetSpacing();
        local l_v56_Padding_0 = v56:GetPadding();
        return UDim2.new(0, (l_v56_Padding_0.X + v58 * l_v56_CellSize_0.X) + v58 * l_v56_Spacing_0.X, 0, (l_v56_Padding_0.Y + v57 * l_v56_CellSize_0.Y) + v57 * l_v56_Spacing_0.Y);
    end;
    v3.GetCanvasPositionForOffscreenItem = function(v62, v63)
        if not ((not v63 or not v62.Container) or not v62:ContainsItem(v63)) then
            if v62.ScrollDirection == v62.Enum.ScrollDirection.Vertical then
                if v63.AbsolutePosition.Y <= v62.Container.AbsolutePosition.Y then
                    return l_Utility_0.ClampCanvasPosition(v62.Container, Vector2.new(0, v63.Position.Y.Offset));
                elseif v62.Container.AbsolutePosition.Y + v62.Container.AbsoluteWindowSize.Y <= v63.AbsolutePosition.Y + v63.AbsoluteSize.Y then
                    return l_Utility_0.ClampCanvasPosition(v62.Container, Vector2.new(0, -((v62.Container.AbsoluteWindowSize.Y - v63.Position.Y.Offset) - v63.AbsoluteSize.Y)));
                end;
            elseif v63.AbsolutePosition.X <= v62.Container.AbsolutePosition.X then
                return l_Utility_0.ClampCanvasPosition(v62.Container, Vector2.new(v63.Position.X.Offset, 0));
            elseif v62.Container.AbsolutePosition.X + v62.Container.AbsoluteWindowSize.X <= v63.AbsolutePosition.X + v63.AbsoluteSize.X then
                return l_Utility_0.ClampCanvasPosition(v62.Container, Vector2.new(-((v62.Container.AbsoluteWindowSize.X - v63.Position.X.Offset) - v63.AbsoluteSize.X), 0));
            end;
        end;
    end;
    v3.Destroy = function(v64)
        if v64.Container then
            v64.Container:Destroy();
        end;
    end;
    if v3.Dynamic then
        v3.targetCanvasPosition = Vector2.new(0, 0);
        v3.gridCount = v2.gridCount or 0;
        v3.Enum.SelectionMode = {
            Middle = 1, 
            TopLeft = 2, 
            Normal = 3
        };
        v3.SelectionMode = not not v2.SelectionMode and v3.Enum.SelectionMode[v2.SelectionMode] or v3.Enum.SelectionMode.Normal;
        v3.GetItemVisible = function(v65, v66, v67)
            if not v67 then
                if v3.ScrollDirection == v3.Enum.ScrollDirection.Vertical then
                    local v68 = true;
                    if v66.Position.Y.Offset >= v65.Container.CanvasPosition.Y + v65.Container.AbsoluteWindowSize.Y then
                        v68 = v65.Container.CanvasPosition.Y < v66.Position.Y.Offset + v66.AbsoluteSize.Y;
                    end;
                    return v68;
                else
                    local v69 = true;
                    if v66.Position.X.Offset >= v65.Container.CanvasPosition.X + v65.Container.AbsoluteWindowSize.X then
                        v69 = v65.Container.CanvasPosition.X < v66.Position.X.Offset + v66.AbsoluteSize.X;
                    end;
                    return v69;
                end;
            elseif v3.ScrollDirection == v3.Enum.ScrollDirection.Vertical then
                local v70 = false;
                if v65.Container.CanvasPosition.Y <= v66.Position.Y.Offset then
                    v70 = v66.Position.Y.Offset + v66.AbsoluteSize.Y <= v65.Container.CanvasPosition.Y + v65.Container.AbsoluteWindowSize.Y;
                end;
                return v70;
            else
                local v71 = false;
                if v65.Container.CanvasPosition.X <= v66.Position.X.Offset then
                    v71 = v66.Position.X.Offset + v66.AbsoluteSize.X <= v65.Container.CanvasPosition.X + v65.Container.AbsoluteWindowSize.X;
                end;
                return v71;
            end;
        end;
        v3.SetItemCallback = function(v72, v73, v74)
            v72.getItemFunc = v73;
            if v74 then
                v72:RecalcLayout();
            end;
        end;
        v3.GetNumRowsColumns = function(v75)
            local v76 = 0;
            local v77 = 0;
            local l_AbsoluteWindowSize_0 = v75.Container.AbsoluteWindowSize;
            local l_v75_Padding_0 = v75:GetPadding();
            local l_v75_CellSize_0 = v75:GetCellSize();
            local l_v75_Spacing_0 = v75:GetSpacing();
            local v82 = (l_Utility_0.ClampVector2(Vector2.new(0, 0), l_AbsoluteWindowSize_0 - l_v75_Padding_0, l_AbsoluteWindowSize_0 - l_v75_Padding_0) + l_v75_Spacing_0) / l_Utility_0.ClampVector2(Vector2.new(1, 1), l_v75_CellSize_0 + l_v75_Spacing_0, l_v75_CellSize_0 + l_v75_Spacing_0);
            local v83 = 0;
            for _, v85 in pairs(v75.GridItems) do
                if v85 then
                    v83 = v83 + 1;
                end;
            end;
            if v75.ScrollDirection == v75.Enum.ScrollDirection.Vertical then
                v77 = math.max(1, (math.floor(v82.x)));
                return math.ceil(math.max(1, v83) / v77), v77;
            else
                v76 = math.max(1, (math.floor(v82.y)));
                return v76, (math.ceil(math.max(1, v83) / v76));
            end;
        end;
        v3.GetIndexFrom2D = function(v86, v87, v88)
            local l_v86_NumRowsColumns_0, v90 = v86:GetNumRowsColumns();
            local _ = 0;
            if v86.ScrollDirection == v86.Enum.ScrollDirection.Vertical then
                return (v87 - 1) * v90 + v88;
            else
                return (v88 - 1) * l_v86_NumRowsColumns_0 + v87;
            end;
        end;
        v3.GetItemRowColumnFromScreenPosition = function(v92, v93, v94)
            local l_v92_CellSize_0 = v92:GetCellSize();
            local l_v92_Spacing_0 = v92:GetSpacing();
            local _ = v92:GetPadding();
            return math.floor(v94 / (l_v92_Spacing_0.Y + l_v92_CellSize_0.Y)) + 1, math.floor(v93 / (l_v92_Spacing_0.X + l_v92_CellSize_0.X)) + 1;
        end;
        v3.Add = function(v98, v99, v100)
            v98.GridItems[v99] = v100;
            v100.Parent = v98.Container;
            v98.ItemSet[v100] = true;
        end;
        v3.Remove = function(v101, v102)
            local v103 = v101.GridItems[v102];
            v101.GridItems[v102] = nil;
            if v103 then
                v103.Parent = nil;
                if l_GuiService_0.SelectedCoreObject == v103 then
                    l_Utility_0.SetSelectedCoreObject(nil);
                end;
                v101.ItemSet[v103] = nil;
            end;
        end;
        v3.GetActiveItemsRange = function(v104, v105)
            local v106 = v105 or v104.Container.AbsoluteWindowSize;
            local l_X_0 = v106.X;
            local l_Y_0 = v106.Y;
            local l_targetCanvasPosition_0 = v104.targetCanvasPosition;
            local l_X_1 = l_targetCanvasPosition_0.X;
            local l_Y_1 = l_targetCanvasPosition_0.Y;
            local l_v104_CellSize_0 = v104:GetCellSize();
            local l_v104_Spacing_0 = v104:GetSpacing();
            local _ = v104:GetPadding();
            local v115 = l_v104_Spacing_0.X + l_v104_CellSize_0.X;
            local v116 = l_v104_Spacing_0.Y + l_v104_CellSize_0.Y;
            local v117 = math.floor(l_X_1 / v115) + 1;
            local v118 = math.ceil((l_X_1 + l_X_0) / v115);
            local v119 = math.floor(l_Y_1 / v116) + 1;
            local v120 = math.ceil((l_Y_1 + l_Y_0) / v116);
            local l_v104_IndexFrom2D_0 = v104:GetIndexFrom2D(v119, v117);
            local l_v104_IndexFrom2D_1 = v104:GetIndexFrom2D(v120, v118);
            local l_v104_NumRowsColumns_0, v124 = v104:GetNumRowsColumns();
            if v104.ScrollDirection == v104.Enum.ScrollDirection.Vertical then
                l_v104_IndexFrom2D_1 = l_v104_IndexFrom2D_1 + v124;
                l_v104_IndexFrom2D_0 = l_v104_IndexFrom2D_0 - v124;
            else
                l_v104_IndexFrom2D_1 = l_v104_IndexFrom2D_1 + l_v104_NumRowsColumns_0;
                l_v104_IndexFrom2D_0 = l_v104_IndexFrom2D_0 - l_v104_NumRowsColumns_0;
            end;
            if l_v104_IndexFrom2D_0 < 1 then
                l_v104_IndexFrom2D_0 = 1;
            end;
            if l_v104_IndexFrom2D_1 < 1 then
                l_v104_IndexFrom2D_1 = 1;
            end;
            return l_v104_IndexFrom2D_0, l_v104_IndexFrom2D_1;
        end;
        v3.Rewindow = function(v125, v126)
            if v125.getItemFunc then
                local v127 = {};
                local v128 = {};
                for v129, v130 in pairs(v125.GridItems) do
                    v127[v130] = v129;
                end;
                local v131 = {};
                local l_v125_ActiveItemsRange_0, v133 = v125:GetActiveItemsRange(v126);
                for v134 = l_v125_ActiveItemsRange_0, v133 do
                    local v135 = v125.getItemFunc(v134);
                    if v135 then
                        local v136 = v127[v135];
                        if not v136 then
                            v131[v135] = v134;
                        else
                            v127[v135] = nil;
                            if v136 ~= v134 then
                                v128[v136] = v134;
                            end;
                        end;
                    end;
                end;
                for _, v138 in pairs(v127) do
                    v125:Remove(v138);
                end;
                for v139, v140 in pairs(v128) do
                    v131[v125.GridItems[v139]] = v140;
                    v125.GridItems[v139] = nil;
                end;
                for v141, v142 in pairs(v131) do
                    v125:Add(v142, v141);
                end;
                for v143, v144 in pairs(v125.GridItems) do
                    local l_v125_2DGridIndex_0, v146 = v125:Get2DGridIndex(v143);
                    v144.Position = v125:GetGridPosition(l_v125_2DGridIndex_0, v146);
                end;
            end;
        end;
        v3.GetSelectableItem = function(v147, v148, v149)
            local l_AbsoluteWindowSize_1 = v147.Container.AbsoluteWindowSize;
            local _, _ = v147:GetItemRowColumnFromScreenPosition(v147.Container.CanvasPosition.X + l_AbsoluteWindowSize_1.X / 2, v147.Container.CanvasPosition.Y + l_AbsoluteWindowSize_1.Y / 2);
            local v153 = nil;
            local l_huge_0 = math.huge;
            for v155, v156 in pairs(v147.GridItems) do
                local l_l_huge_0_0 = l_huge_0;
                if not v149 then
                    local l_v147_2DGridIndex_0, v159 = v147:Get2DGridIndex(v155);
                    l_l_huge_0_0 = math.abs(v159) + math.abs(l_v147_2DGridIndex_0);
                else
                    l_l_huge_0_0 = math.abs(v155 - v149);
                end;
                if not (v156.Position.X.Offset >= v3.targetCanvasPosition.X) or v156.Position.Y.Offset < v3.targetCanvasPosition.Y then
                    l_l_huge_0_0 = l_l_huge_0_0 + 10000;
                end;
                if l_l_huge_0_0 < l_huge_0 then
                    v153 = v156;
                    l_huge_0 = l_l_huge_0_0;
                end;
            end;
            return v153 or v148 and v147.Container;
        end;
        v3.SelectAvailableItem = function(v160, v161, v162)
            local l_v160_SelectableItem_0 = v160:GetSelectableItem(v161, v162);
            if l_v160_SelectableItem_0 then
                l_Utility_0.SetSelectedCoreObject(l_v160_SelectableItem_0);
            end;
        end;
        v3.Focus = function(v164)
            local l_v164_AncestorGridItem_0 = v164:FindAncestorGridItem(l_GuiService_0.SelectedCoreObject);
            if not (l_v164_AncestorGridItem_0 and v164:ContainsItem(l_v164_AncestorGridItem_0)) then
                v164:SelectAvailableItem();
            end;
        end;
        v3.RemoveFocus = function(_)
            if v3:ContainsItem(l_GuiService_0.SelectedCoreObject) then
                l_Utility_0.SetSelectedCoreObject(nil);
            end;
        end;
        v3.RecalcLayout = function(v167, v168)
            if v168 then
                v167.gridCount = v168;
            end;
            local l_v167_AncestorGridItem_0 = v167:FindAncestorGridItem(l_GuiService_0.SelectedCoreObject);
            local v170 = true;
            if l_GuiService_0.SelectedCoreObject ~= v167.Container then
                v170 = l_v167_AncestorGridItem_0 and v167:ContainsItem(l_v167_AncestorGridItem_0);
            end;
            local v171 = nil;
            if not (not v170 or not l_v167_AncestorGridItem_0) then
                local l_v167_ItemRowColumnFromScreenPosition_0, v173 = v167:GetItemRowColumnFromScreenPosition(l_v167_AncestorGridItem_0.Position.X.Offset, l_v167_AncestorGridItem_0.Position.Y.Offset);
                v171 = v167:GetIndexFrom2D(l_v167_ItemRowColumnFromScreenPosition_0, v173);
            end;
            local l_v167_Padding_0 = v167:GetPadding();
            local l_v167_Spacing_0 = v167:GetSpacing();
            local l_v167_GridItemSize_0 = v167:GetGridItemSize();
            local l_v167_NumRowsColumns_0, v178 = v167:GetNumRowsColumns();
            if v167.gridCount then
                if v167.ScrollDirection == v167.Enum.ScrollDirection.Vertical then
                    l_v167_NumRowsColumns_0 = math.ceil(math.max(1, v167.gridCount) / v178);
                else
                    v178 = math.ceil(math.max(1, v167.gridCount) / l_v167_NumRowsColumns_0);
                end;
            end;
            if v167.ScrollDirection == v167.Enum.ScrollDirection.Vertical then
                v167.Container.CanvasSize = UDim2.new(v167.Container.Size.X.Scale, v167.Container.Size.X.Offset, 0, (l_v167_Padding_0.Y * 2 + l_v167_NumRowsColumns_0 * l_v167_GridItemSize_0.Y) + math.max(0, l_v167_NumRowsColumns_0 - 1) * l_v167_Spacing_0.Y);
            else
                v167.Container.CanvasSize = UDim2.new(0, (l_v167_Padding_0.X * 2 + v178 * l_v167_GridItemSize_0.X) + math.max(0, v178 - 1) * l_v167_Spacing_0.X, v167.Container.Size.Y.Scale, v167.Container.Size.Y.Offset);
            end;
            v167.targetCanvasPosition = l_Utility_0.ClampCanvasPosition(v167.Container, v167.targetCanvasPosition);
            v167:Rewindow();
            local l_v167_AncestorGridItem_1 = v167:FindAncestorGridItem(l_GuiService_0.SelectedCoreObject);
            if not l_v167_AncestorGridItem_1 or not v167:ContainsItem(l_v167_AncestorGridItem_1) then
                if v170 then
                    v167:SelectAvailableItem(true, v171);
                end;
            else
                local l_v167_CanvasPositionForOffscreenItem_0 = v167:GetCanvasPositionForOffscreenItem(l_v167_AncestorGridItem_1);
                if l_v167_CanvasPositionForOffscreenItem_0 then
                    v167.targetCanvasPosition = l_v167_CanvasPositionForOffscreenItem_0;
                    l_Utility_0.PropertyTweener(v167.Container, "CanvasPosition", l_v167_CanvasPositionForOffscreenItem_0, l_v167_CanvasPositionForOffscreenItem_0, 0, l_Utility_0.EaseOutQuad, true, function()
                        v167:Rewindow();
                    end);
                    return ;
                end;
            end;
        end;
        v3.BackToInitial = function(v181, v182)
            if not v182 then
                v182 = 0;
            end;
            local v183 = Vector2.new(0, 0);
            local v184 = v181.Container.AbsoluteWindowSize + v181.targetCanvasPosition;
            v181.targetCanvasPosition = v183;
            v181:Rewindow(v184);
            l_Utility_0.PropertyTweener(v181.Container, "CanvasPosition", v181.Container.CanvasPosition, v183, v182, l_Utility_0.SCurveVector2, true, function()
                v181:Rewindow();
            end);
        end;
        l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):connect(function()
            local l_v3_AncestorGridItem_0 = v3:FindAncestorGridItem(l_GuiService_0.SelectedCoreObject);
            if not (not l_v3_AncestorGridItem_0 or not v3:ContainsItem(l_v3_AncestorGridItem_0)) then
                local v186 = nil;
                local l_v3_ItemRowColumnFromScreenPosition_0, v188 = v3:GetItemRowColumnFromScreenPosition(l_v3_AncestorGridItem_0.Position.X.Offset, l_v3_AncestorGridItem_0.Position.Y.Offset);
                local l_v3_CellSize_0 = v3:GetCellSize();
                local l_v3_Spacing_0 = v3:GetSpacing();
                local v191 = l_v3_Spacing_0.X + l_v3_CellSize_0.X;
                local v192 = l_v3_Spacing_0.Y + l_v3_CellSize_0.Y;
                if v3.SelectionMode == v3.Enum.SelectionMode.Middle then
                    local l_AbsoluteWindowSize_2 = v3.Container.AbsoluteWindowSize;
                    local l_X_2 = l_AbsoluteWindowSize_2.X;
                    local l_Y_2 = l_AbsoluteWindowSize_2.Y;
                    local l_v3_ItemRowColumnFromScreenPosition_1, v197 = v3:GetItemRowColumnFromScreenPosition(v3.Container.CanvasPosition.X + l_X_2 / 2, v3.Container.CanvasPosition.Y + l_Y_2 / 2);
                    if v3.ScrollDirection == v3.Enum.ScrollDirection.Vertical then
                        local v198 = math.floor((math.floor(l_Y_2 / v192) - 1) / 2);
                        if l_v3_ItemRowColumnFromScreenPosition_1 + v198 < l_v3_ItemRowColumnFromScreenPosition_0 then
                            v186 = Vector2.new(0, ((l_v3_ItemRowColumnFromScreenPosition_0 - v198) - 0.5) * v192 - l_Y_2 / 2);
                        elseif l_v3_ItemRowColumnFromScreenPosition_0 < l_v3_ItemRowColumnFromScreenPosition_1 - v198 then
                            v186 = Vector2.new(0, ((l_v3_ItemRowColumnFromScreenPosition_0 + v198) - 0.5) * v192 - l_Y_2 / 2);
                        end;
                    else
                        local v199 = math.floor((math.floor(l_X_2 / v191) - 1) / 2);
                        if v197 + v199 < v188 then
                            v186 = Vector2.new(((v188 - v199) - 0.5) * v191 - l_X_2 / 2, 0);
                        elseif v188 < v197 - v199 then
                            v186 = Vector2.new(((v188 + v199) - 0.5) * v191 - l_X_2 / 2, 0);
                        end;
                    end;
                else
                    v186 = if v3.SelectionMode == v3.Enum.SelectionMode.TopLeft then if v3.ScrollDirection == v3.Enum.ScrollDirection.Vertical then Vector2.new(0, (l_v3_ItemRowColumnFromScreenPosition_0 - 1) * v192) else Vector2.new((v188 - 1) * v191, 0) else v3:GetCanvasPositionForOffscreenItem(l_v3_AncestorGridItem_0);
                end;
                if (v186 and v186.X == v3.targetCanvasPosition.X) and v186.Y == v3.targetCanvasPosition.Y then
                    return ;
                elseif v186 then
                    local v200 = v3.targetCanvasPosition or v3.Container.CanvasPosition;
                    v186 = l_Utility_0.ClampCanvasPosition(v3.Container, v186);
                    v3.targetCanvasPosition = v186;
                    v3:Rewindow();
                    l_Utility_0.PropertyTweener(v3.Container, "CanvasPosition", v200, v186, 0.2, l_Utility_0.EaseOutQuad, true);
                end;
            end;
        end);
        return v3;
    else
        v3.GetFirstVisibleItem = function(v201)
            local v202 = nil;
            for v203 = #v201.GridItems, 1, -1 do
                local v204 = v201.GridItems[v203];
                if (v204 and v201.Container.CanvasPosition.X <= v204.Position.X.Offset) and v204.Position.X.Offset + v204.AbsoluteSize.X <= v201.Container.CanvasPosition.X + v201.Container.AbsoluteWindowSize.X then
                    v202 = v204;
                end;
            end;
            return v202;
        end;
        v3.SortItems = function(v205, v206)
            table.sort(v205.GridItems, v206);
            v205:RecalcLayout();
            local l_v205_AncestorGridItem_0 = v205:FindAncestorGridItem(l_GuiService_0.SelectedCoreObject);
            if not (not l_v205_AncestorGridItem_0 or not v205:ContainsItem(l_v205_AncestorGridItem_0)) then
                local l_v205_CanvasPositionForOffscreenItem_0 = v205:GetCanvasPositionForOffscreenItem(l_v205_AncestorGridItem_0);
                if l_v205_CanvasPositionForOffscreenItem_0 then
                    l_Utility_0.PropertyTweener(v205.Container, "CanvasPosition", l_v205_CanvasPositionForOffscreenItem_0, l_v205_CanvasPositionForOffscreenItem_0, 0, l_Utility_0.EaseOutQuad, true);
                end;
            end;
        end;
        v3.AddItem = function(v209, v210)
            if not v209:ContainsItem(v210) then
                table.insert(v209.GridItems, v210);
                v209.ItemSet[v210] = true;
                v210.Parent = v209.Container;
                if l_GuiService_0.SelectedCoreObject == v209.DefaultSelection then
                    l_Utility_0.SetSelectedCoreObject(v210);
                end;
                v209:RecalcLayout();
            end;
        end;
        v3.RemoveItem = function(v211, v212)
            if v211:ContainsItem(v212) then
                for v213, v214 in pairs(v211.GridItems) do
                    if v214 == v212 then
                        table.remove(v211.GridItems, v213);
                        if l_GuiService_0.SelectedCoreObject == v212 then
                            l_GuiService_0.SelectedCoreObject = ((v211.GridItems[v213] or v211.GridItems[v213 - 1]) or v211.GridItems[1]) or v211.DefaultSelection;
                        end;
                        v211.ItemSet[v212] = nil;
                        v212.Parent = nil;
                        v211:RecalcLayout();
                        return ;
                    end;
                end;
            end;
        end;
        v3.RemoveAllItems = function(v215)
            local v216 = false;
            local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
            while l_SelectedCoreObject_0 ~= nil and v216 == false do
                v216 = v216 or v215:ContainsItem(l_SelectedCoreObject_0);
                l_SelectedCoreObject_0 = l_SelectedCoreObject_0.Parent;
            end;
            for v218 = #v215.GridItems, 1, -1 do
                local v219 = table.remove(v215.GridItems, v218);
                v215.ItemSet[v219] = nil;
                v219.Parent = nil;
            end;
            if v216 then
                l_GuiService_0.SelectedCoreObject = v215.Container;
            end;
            v215:RecalcLayout();
            v215.Container.CanvasPosition = Vector2.new(0, 0);
        end;
        v3.GetNumRowsColumns = function(v220)
            local v221 = 0;
            local v222 = 0;
            local l_AbsoluteWindowSize_3 = v220.Container.AbsoluteWindowSize;
            local l_v220_Padding_0 = v220:GetPadding();
            local l_v220_CellSize_0 = v220:GetCellSize();
            local l_v220_Spacing_0 = v220:GetSpacing();
            local v227 = (l_Utility_0.ClampVector2(Vector2.new(0, 0), l_AbsoluteWindowSize_3 - l_v220_Padding_0, l_AbsoluteWindowSize_3 - l_v220_Padding_0) + l_v220_Spacing_0) / l_Utility_0.ClampVector2(Vector2.new(1, 1), l_v220_CellSize_0 + l_v220_Spacing_0, l_v220_CellSize_0 + l_v220_Spacing_0);
            if v220.ScrollDirection == v220.Enum.ScrollDirection.Vertical then
                v222 = math.max(1, v220:GetRowColumnConstraint() or math.floor(v227.x));
                return math.ceil(math.max(1, #v220.GridItems) / v222), v222;
            else
                v221 = math.max(1, v220:GetRowColumnConstraint() or math.floor(v227.y));
                return v221, (math.ceil(math.max(1, #v220.GridItems) / v221));
            end;
        end;
        v3.RecalcLayout = function(v228)
            local l_v228_Padding_0 = v228:GetPadding();
            local l_v228_Spacing_0 = v228:GetSpacing();
            local l_v228_GridItemSize_0 = v228:GetGridItemSize();
            local l_v228_NumRowsColumns_0, v233 = v228:GetNumRowsColumns();
            if v228.ScrollDirection == v228.Enum.ScrollDirection.Vertical then
                v228.Container.CanvasSize = UDim2.new(v228.Container.Size.X.Scale, v228.Container.Size.X.Offset, 0, (l_v228_Padding_0.Y * 2 + l_v228_NumRowsColumns_0 * l_v228_GridItemSize_0.Y) + math.max(0, l_v228_NumRowsColumns_0 - 1) * l_v228_Spacing_0.Y);
            else
                v228.Container.CanvasSize = UDim2.new(0, (l_v228_Padding_0.X * 2 + v233 * l_v228_GridItemSize_0.X) + math.max(0, v233 - 1) * l_v228_Spacing_0.X, v228.Container.Size.Y.Scale, v228.Container.Size.Y.Offset);
            end;
            local v234 = {};
            for v235 = 1, #v228.GridItems do
                local l_v228_2DGridIndex_0, v237 = v228:Get2DGridIndex(v235);
                local v238 = v228.GridItems[v235];
                v238.Size = UDim2.new(0, l_v228_GridItemSize_0.X, 0, l_v228_GridItemSize_0.Y);
                v238.Position = v228:GetGridPosition(l_v228_2DGridIndex_0, v237, l_v228_GridItemSize_0);
                v234[l_v228_2DGridIndex_0] = v234[l_v228_2DGridIndex_0] or {};
                v234[l_v228_2DGridIndex_0][v237] = v238;
            end;
            for v239, v240 in pairs(v234) do
                for v241, _ in pairs(v240) do
                    local v243 = v234[v239][v241];
                    if v243 then
                        if v228.ScrollDirection == v228.Enum.ScrollDirection.Vertical then
                            v243.NextSelectionUp = not not v234[v239 - 1] and v234[v239 - 1][v241] or nil;
                            v243.NextSelectionDown = not not v234[v239 + 1] and v234[v239 + 1][v241] or nil;
                            if v243.NextSelectionDown == nil and v234[v239 + 1] ~= nil then
                                v243.NextSelectionDown = v228.GridItems[#v228.GridItems];
                            end;
                            v243.NextSelectionLeft = nil;
                            v243.NextSelectionRight = nil;
                        else
                            v243.NextSelectionLeft = not not v234[v239] and v234[v239][v241 - 1] or v243;
                            v243.NextSelectionRight = not not v234[v239] and v234[v239][v241 + 1] or nil;
                            if v243.NextSelectionRight == nil then
                                if not v234[0] or not v234[0][v241 + 1] then
                                    v243.NextSelectionRight = v243;
                                else
                                    v243.NextSelectionRight = v228.GridItems[#v228.GridItems];
                                end;
                            end;
                            v243.NextSelectionUp = nil;
                            v243.NextSelectionDown = nil;
                        end;
                    end;
                end;
            end;
        end;
        v3:RecalcLayout();
        local v244 = nil;
        l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):connect(function()
            local l_v3_AncestorGridItem_1 = v3:FindAncestorGridItem(l_GuiService_0.SelectedCoreObject);
            if not l_v3_AncestorGridItem_1 or not v3:ContainsItem(l_v3_AncestorGridItem_1) then
                v244 = nil;
                return ;
            else
                local v246 = v3.ScrollDirection == v3.Enum.ScrollDirection.Vertical and "NextSelectionUp" or "NextSelectionLeft";
                local v247 = v3.ScrollDirection == v3.Enum.ScrollDirection.Vertical and "NextSelectionDown" or "NextSelectionRight";
                local v248 = l_v3_AncestorGridItem_1[v246];
                local v249 = l_v3_AncestorGridItem_1[v247];
                local v250 = nil;
                local v251 = nil;
                local v252 = nil;
                local l_v3_GridItemSize_0 = v3:GetGridItemSize();
                local l_v3_CanvasPositionForOffscreenItem_0 = v3:GetCanvasPositionForOffscreenItem(l_v3_AncestorGridItem_1);
                if v244 then
                    local v255 = v244[v246];
                    local v256 = v244[v247];
                    if v248 and v255 == l_v3_AncestorGridItem_1 then
                        v251 = v3:GetCanvasPositionForOffscreenItem(v248);
                        if not (not (v248 ~= l_v3_AncestorGridItem_1) or not v251) then
                            v251 = v251 + l_v3_GridItemSize_0 / 2;
                        end;
                    elseif v249 and v256 == l_v3_AncestorGridItem_1 then
                        v252 = v3:GetCanvasPositionForOffscreenItem(v249);
                        if not (not (v249 ~= l_v3_AncestorGridItem_1) or not v252) then
                            v252 = v252 - l_v3_GridItemSize_0 / 2;
                        end;
                    end;
                end;
                v250 = if not not v251 and (not (v251.Y >= v3.Container.CanvasPosition.Y) or v251.X < v3.Container.CanvasPosition.X) then v251 else if v252 and (not (v3.Container.CanvasPosition.Y >= v252.Y) or v3.Container.CanvasPosition.X < v252.X) then v252 else l_v3_CanvasPositionForOffscreenItem_0;
                if v250 then
                    v250 = l_Utility_0.ClampCanvasPosition(v3.Container, v250);
                    if not l_v3_CanvasPositionForOffscreenItem_0 then
                        l_Utility_0.PropertyTweener(v3.Container, "CanvasPosition", v3.Container.CanvasPosition, v250, 0.2, l_Utility_0.EaseOutQuad, true);
                    elseif not (not v248 or not v249) then
                        l_Utility_0.PropertyTweener(v3.Container, "CanvasPosition", l_v3_CanvasPositionForOffscreenItem_0, l_v3_CanvasPositionForOffscreenItem_0, 0, l_Utility_0.EaseOutQuad, true, function()
                            l_Utility_0.PropertyTweener(v3.Container, "CanvasPosition", v3.Container.CanvasPosition, v250, 0.2, l_Utility_0.EaseOutQuad, true);
                        end);
                    end;
                end;
                v244 = l_v3_AncestorGridItem_1;
                return ;
            end;
        end);
        return v3;
    end;
end;

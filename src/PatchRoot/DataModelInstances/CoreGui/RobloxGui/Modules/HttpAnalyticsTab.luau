local v0 = Color3.new(1, 1, 1);
local v1 = Color3.new(0.25, 0.75, 0.75);
local v2 = Color3.new(0.25, 0.25, 0.75);
local v3 = Color3.new(1, 1, 1);
local v4 = Color3.new(1, 0, 1);
local v5 = {
    50, 
    50, 
    50, 
    65, 
    120, 
    -335
};
local v6 = {
    "Method", 
    "Status", 
    "Time", 
    "RequestType", 
    "URL"
};
local v7 = {
    "No.", 
    "Method", 
    "Status", 
    "Time(ms)", 
    "RequestType", 
    "URL"
};
local v8 = 256;
pcall(function()
    v8 = tonumber(settings():GetFVariable("HttpAnalyticsMaxHistory"));
end);
local v9 = {};
v9.__index = v9;
v9.new = function(v10, v11, v12, v13)
    local v14 = {};
    setmetatable(v14, v9);
    v14._parent = v10;
    v14._frame = Instance.new("Frame");
    v14._frame.Position = v11;
    v14._frame.Size = v12;
    v14._frame.BorderColor3 = v0;
    v14._frame.BorderSizePixel = 1;
    v14._frame.BackgroundTransparency = 0.9;
    v14._frame.ZIndex = v14._parent.ZIndex + 1;
    v14._frame.BackgroundColor3 = v13;
    v14._frame.Parent = v14._parent;
    v14._label = Instance.new("TextLabel");
    v14._label.TextColor3 = v3;
    v14._label.Position = UDim2.new(0, 5, 0, 0);
    v14._label.Size = UDim2.new(1, -10, 1, 0);
    v14._label.BackgroundTransparency = 1;
    v14._label.TextXAlignment = Enum.TextXAlignment.Left;
    v14._label.ZIndex = v14._parent.ZIndex + 1;
    v14._label.Parent = v14._frame;
    return v14;
end;
v9.setValue = function(v15, v16)
    if v15._label == nil then
        return ;
    else
        local v17 = type(v16);
        local _ = nil;
        v15._label.Text = if v17 == "string" then v16 else if v17 == "number" then if v16 - math.floor(v16) > 0 then string.format("%.02f", v16) else tostring(v16) else tostring(v16);
        return ;
    end;
end;
v9.getFrame = function(v19)
    return v19._frame;
end;
local v20 = {};
v20.__index = v20;
v20.new = function(v21, v22)
    local v23 = {};
    setmetatable(v23, v20);
    v23._parent = v21;
    v23._frame = Instance.new("Frame");
    v23._frame.Name = "UIListClass";
    v23._frame.Position = UDim2.new(0, 1, 0, 1);
    v23._frame.Size = UDim2.new(1, 0, 0, 0);
    v23._frame.ZIndex = v23._parent.ZIndex;
    v23._frame.BorderSizePixel = 0;
    v23._frame.Parent = v23._parent;
    v23._columnWidths = {
        100
    };
    v23._rowHeight = 20;
    v23._rows = {};
    v23._callbackClicked = v22;
    return v23;
end;
v20.setColumns = function(v24, v25, v26)
    v24:setColumnWidths(v26);
    v24:setRow(1, v25);
end;
v20.setColumnWidths = function(v27, v28)
    v27._columnWidths = v28;
end;
v20.setRow = function(v29, v30, v31)
    if #v29._rows + 1 < v30 then
        return ;
    elseif #v29._rows < v30 then
        v29:addRow(v31);
        return ;
    else
        for v32, v33 in ipairs(v29._rows[v30]) do
            v33:setValue(v31[v32]);
        end;
        return ;
    end;
end;
v20.addRow = function(v34, v35)
    local v36 = #v34._rows + 1;
    local v37 = {};
    for v38 = 1, #v35 do
        if #v34._columnWidths >= v38 then
            local v39 = v34:getItemPosition(v36, v38);
            local v40 = v34:getItemSize(v36, v38);
            local _ = nil;
            local v42 = v9.new(v34._frame, v39, v40, if v36 % 2 == 1 then v1 else v2);
            local v43 = v42:getFrame();
            v43.InputBegan:connect(function(v44)
                if v44.UserInputType == Enum.UserInputType.MouseButton1 and v34._callbackClicked ~= nil then
                    v34._callbackClicked(v36, v38, v43);
                end;
            end);
            v42:setValue(v35[v38]);
            table.insert(v37, v42);
        else
            break;
        end;
    end;
    table.insert(v34._rows, v37);
end;
v20.getItemPosition = function(v45, v46, v47)
    local v48 = 0;
    local v49 = 0;
    for v50 = 1, v47 - 1 do
        v48 = v48 + v45._columnWidths[v50];
    end;
    for _ = 1, v46 - 1 do
        v49 = v49 + v45._rowHeight;
    end;
    return UDim2.new(0, v48, 0, v49);
end;
v20.getItemSize = function(v52, _, v54)
    if v52._columnWidths[v54] < 0 then
        return UDim2.new(1, -v52._columnWidths[v54], 0, v52._rowHeight);
    else
        return UDim2.new(0, v52._columnWidths[v54], 0, v52._rowHeight);
    end;
end;
v20.getHeightInPix = function(v55)
    return v55._rowHeight * #v55._rows;
end;
v20.getFrame = function(v56)
    return v56._frame;
end;
local v57 = {};
v57.__index = v57;
v57.new = function(v58, v59, v60)
    local v61 = {};
    setmetatable(v61, v57);
    v61._sortedColumn = 1;
    v61._list = v20.new(v58, v60);
    v61._heightChangedCallback = v59;
    v61._rowValues = {};
    v61._counter = 0;
    v61._sortedTitleLastColor = nil;
    v61._sortedTitleFrame = nil;
    return v61;
end;
v57.sort = function(v62, v63, v64)
    if v63 == v62._sortedColumn then
        return ;
    elseif not (v63 >= 1 and #v62._rowValues >= 2) or #v62._rowValues[1] < v63 then
        return ;
    else
        v62._sortedColumn = v63;
        v62._sortedTitleLastColor = v64.BackgroundColor3;
        if v62._sortedTitleFrame ~= nil then
            v62._sortedTitleFrame.BackgroundColor3 = v62._sortedTitleLastColor;
        end;
        v62._sortedTitleFrame = v64;
        v62._sortedTitleFrame.BackgroundColor3 = v4;
        table.sort(v62._rowValues, function(v65, v66)
            return v65[v62._sortedColumn] < v66[v62._sortedColumn];
        end);
        for v67, v68 in ipairs(v62._rowValues) do
            v62._list:setRow(v67 + 1, v68);
        end;
        return ;
    end;
end;
v57.insert = function(v69, v70)
    if not (v69._sortedColumn ~= 0) or #v69._rowValues == 0 then
        table.insert(v69._rowValues, v70);
        return ;
    else
        local v71 = #v69._rowValues + 1;
        for v72 = 1, #v69._rowValues do
            if v70[v69._sortedColumn] < v69._rowValues[v72][v69._sortedColumn] then
                v71 = v72;
                break;
            end;
        end;
        table.insert(v69._rowValues, v71, v70);
        return ;
    end;
end;
v57.remove = function(v73)
    local v74 = 1;
    if v73._sortedColumn > 1 then
        local v75 = (v73._counter - v8) + 1;
        for v76, v77 in ipairs(v73._rowValues) do
            if v77[1] == v75 then
                v74 = v76;
                break;
            end;
        end;
    end;
    table.remove(v73._rowValues, v74);
end;
v57.addRow = function(v78, v79)
    local v80 = false;
    if #v78._rowValues < v8 then
        v78:insert(v79);
        v80 = true;
    else
        v78:remove();
        v78:insert(v79);
    end;
    for v81, v82 in ipairs(v78._rowValues) do
        v78._list:setRow(v81 + 1, v82);
    end;
    if v80 and v78._heightChangedCallback ~= nil then
        v78._heightChangedCallback(v78._list:getHeightInPix());
    end;
end;
v57.addHttpResult = function(v83, v84)
    if v84.Hiden == true then
        return ;
    else
        if #v83._rowValues == 0 then
            v83._list:setColumns(v7, v5);
        end;
        local v85 = {
            v83._counter + 1
        };
        for _, v87 in ipairs(v6) do
            table.insert(v85, v84[v87]);
        end;
        table.insert(v85, v84.Response);
        v83:addRow(v85);
        v83._counter = v83._counter + 1;
        return ;
    end;
end;
v57.getHeightInPix = function(v88)
    return v88._list:getHeightInPix();
end;
v57.getFrame = function(v89)
    return v89._list:getFrame();
end;
v57.getValues = function(v90, v91)
    return v90._rowValues[v91];
end;
local v92 = {};
v92.__index = v92;
local v93 = {
    "RequestType", 
    "RequestCount", 
    "FailedCount", 
    "AverageTime(ms)", 
    "MinTime(ms)", 
    "MaxTime(ms)"
};
local v94 = {
    "RequestType", 
    "RequestCount", 
    "FailedCount", 
    "AverageTime", 
    "MinTime", 
    "MaxTime"
};
local v95 = {
    120, 
    90, 
    90, 
    110, 
    90, 
    90
};
v92.new = function(v96, v97)
    local v98 = {};
    setmetatable(v98, v92);
    v98._list = v20.new(v96);
    v98._tableData = {};
    v98._tableData.size = 0;
    v98._heightChangedCallback = v97;
    return v98;
end;
v92.addHttpResult = function(v99, v100)
    if v99._tableData.size == 0 then
        v99._list:setColumns(v93, v95);
    end;
    local v101 = v99._tableData[v100.RequestType];
    local v102 = false;
    if v101 == nil then
        v99._tableData[v100.RequestType] = {
            RequestType = v100.RequestType, 
            RequestCount = 1, 
            FailedCount = 0, 
            AverageTime = v100.Time, 
            MinTime = v100.Time, 
            MaxTime = v100.Time, 
            index = v99._tableData.size + 1
        };
        v99._tableData.size = v99._tableData.size + 1;
        if v100.Status >= 400 then
            v99._tableData[v100.RequestType].FailedCount = 1;
        end;
        v101 = v99._tableData[v100.RequestType];
        v102 = true;
    else
        v101.RequestCount = v101.RequestCount + 1;
        if v100.Status >= 400 then
            v101.FailedCount = v101.FailedCount + 1;
        end;
        v101.AverageTime = ((v101.AverageTime * v101.RequestCount + v100.Time) - v101.AverageTime) / v101.RequestCount;
        if v100.Time < v101.MinTime then
            v101.MinTime = v100.Time;
        end;
        if v101.MaxTime < v100.Time then
            v101.MaxTime = v100.Time;
        end;
    end;
    local v103 = {};
    for _, v105 in ipairs(v94) do
        table.insert(v103, v101[v105]);
    end;
    v99._list:setRow(v101.index + 1, v103);
    if v102 and v99._heightChangedCallback ~= nil then
        v99._heightChangedCallback(v99:getHeightInPix());
    end;
end;
v92.getHeightInPix = function(v106)
    return v106._list:getHeightInPix();
end;
v92.getFrame = function(v107)
    return v107._list:getFrame();
end;
local v108 = Color3.new(0.8, 0.8, 1);
local v109 = {};
v109.__index = v109;
v109.new = function(v110, v111)
    local v112 = {};
    setmetatable(v112, v109);
    v112._frame = Instance.new("Frame");
    v112._frame.Position = UDim2.new(0, 2, 0, 2);
    v112._frame.Size = UDim2.new(1, -4, 10, 0);
    v112._frame.BackgroundTransparency = 1;
    v112._frame.ZIndex = v110.ZIndex + 1;
    v112._frame.Visible = false;
    v112._frame.InputBegan:connect(function(v113)
        if v113.UserInputType == Enum.UserInputType.MouseButton1 then
            v112._bodyTitle.Visible = false;
            v112._bodyLabel.Visible = false;
            v112._frame.Visible = false;
            v111(false);
        end;
    end);
    v112._frame.Parent = v110;
    v112._bodyTitle = Instance.new("TextLabel");
    v112._bodyTitle.Name = "self._bodyTitle";
    v112._bodyTitle.Position = UDim2.new(0, 4, 0, 4);
    v112._bodyTitle.Size = UDim2.new(1, 0, 0, 50);
    v112._bodyTitle.TextSize = 12;
    v112._bodyTitle.TextColor3 = v108;
    v112._bodyTitle.TextXAlignment = Enum.TextXAlignment.Left;
    v112._bodyTitle.TextYAlignment = Enum.TextYAlignment.Top;
    v112._bodyTitle.ZIndex = v112._frame.ZIndex;
    v112._bodyTitle.BackgroundTransparency = 1;
    v112._bodyTitle.Visible = false;
    v112._bodyTitle.TextWrap = true;
    v112._bodyTitle.Text = "Response Body:";
    v112._bodyTitle.Parent = v112._frame;
    v112._bodyLabel = Instance.new("TextLabel");
    v112._bodyLabel.Name = "self._bodyLabel";
    v112._bodyLabel.Position = UDim2.new(0, 10, 0, 29);
    v112._bodyLabel.Size = UDim2.new(1, -20, 1, 0);
    v112._bodyLabel.TextWrap = true;
    v112._bodyLabel.TextXAlignment = Enum.TextXAlignment.Left;
    v112._bodyLabel.TextYAlignment = Enum.TextYAlignment.Top;
    v112._bodyLabel.TextColor3 = v3;
    v112._bodyLabel.ZIndex = v112._frame.ZIndex;
    v112._bodyLabel.BackgroundTransparency = 1;
    v112._bodyLabel.Visible = false;
    v112._bodyLabel.Parent = v112._frame;
    return v112;
end;
v109.show = function(v114, v115)
    local v116, v117 = utf8.len(v115);
    if v116 == nil then
        if v117 ~= nil then
            v115 = v115:sub(1, v117 - 1);
        end;
        v114._bodyTitle.Text = "Response Body:" .. "\n  Some content can't be rendered as text.";
    else
        v114._bodyTitle.Text = "Response Body:";
    end;
    v114._bodyLabel.Text = v115;
    v114._bodyTitle.Position = UDim2.new(0, 4, 0, 4);
    v114._bodyLabel.Position = UDim2.new(0, 10, 0, v114._bodyTitle.Position.Y.Offset + v114._bodyTitle.TextBounds.Y);
    v114._bodyTitle.Visible = true;
    v114._bodyLabel.Visible = true;
    v114._frame.Visible = true;
end;
v109.getHeightInPix = function(v118)
    return (4 + v118._bodyTitle.TextBounds.Y) + v118._bodyLabel.TextBounds.Y;
end;
v109.isVisible = function(v119)
    return v119._frame.Visible;
end;
local v120 = {};
v120.__index = v120;
v120.new = function(v121, v122)
    local v123 = {};
    setmetatable(v123, v120);
    v123._responseView = v109.new(v121, function(v124, _)
        if not v124 then
            v123._httpAnalyticsFrame.Visible = true;
            v123._httpResultListFrame.Visible = true;
        end;
        v123:heightChange();
    end);
    local function v127(_)
        v123:updatePosition();
    end;
    local function v129(_)
        v123:heightChange();
    end;
    local function v133(v130, v131, v132)
        if not v123._responseView:isVisible() then
            if v130 == 1 then
                v123._httpResultList:sort(v131, v132);
                return ;
            else
                v123:showResponse((v123._httpResultList:getValues(v130 - 1)));
                return ;
            end;
        else
            return ;
        end;
    end;
    v123._httpAnalyticsTable = v92.new(v121, v127);
    v123._httpResultList = v57.new(v121, v129, v133);
    v123._httpAnalyticsFrame = v123._httpAnalyticsTable:getFrame();
    v123._httpResultListFrame = v123._httpResultList:getFrame();
    v123._heightChangedCallback = v122;
    return v123;
end;
v120.updatePosition = function(v134)
    v134._httpResultListFrame.Position = UDim2.new(0, 1, 0, v134._httpAnalyticsTable:getHeightInPix() + 3);
    v134:heightChange();
end;
v120.heightChange = function(v135)
    if v135._heightChangedCallback ~= nil then
        v135._heightChangedCallback(v135:getHeightInPix());
    end;
end;
v120.addHttpResult = function(v136, v137)
    v136._httpAnalyticsTable:addHttpResult(v137);
    v136._httpResultList:addHttpResult(v137);
end;
v120.getHeightInPix = function(v138)
    if not v138._responseView:isVisible() then
        return (v138._httpAnalyticsTable:getHeightInPix() + v138._httpResultList:getHeightInPix()) + 3;
    else
        return v138._responseView:getHeightInPix();
    end;
end;
v120.showResponse = function(v139, v140)
    v139._httpAnalyticsFrame.Visible = false;
    v139._httpResultListFrame.Visible = false;
    v139._responseView:show(v140[#v140]);
    v139:heightChange();
end;
return v120;

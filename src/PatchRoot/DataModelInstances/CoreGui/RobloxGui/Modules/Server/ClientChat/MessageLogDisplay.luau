local v0 = nil;
local l_status_0, l_result_0 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures");
end);
v0 = l_status_0 and l_result_0;
l_status_0 = false;
local v3;
l_result_0, v3 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2");
end);
l_status_0 = l_result_0 and v3;
l_result_0 = {
    ScrollBarThickness = 4
};
local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_Parent_0 = script.Parent;
local l_MessageLabelCreator_0 = require(l_Parent_0:WaitForChild("MessageLabelCreator"));
local l_CurveUtil_0 = require(l_Parent_0:WaitForChild("CurveUtil"));
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local v9 = l_MessageLabelCreator_0.new();
local v10 = {};
v10.__index = v10;
local function v14()
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Selectable = false;
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.BackgroundTransparency = 1;
    local l_ScrollingFrame_0 = Instance.new("ScrollingFrame");
    l_ScrollingFrame_0.Selectable = l_ChatSettings_0.GamepadNavigationEnabled;
    l_ScrollingFrame_0.Name = "Scroller";
    l_ScrollingFrame_0.BackgroundTransparency = 1;
    l_ScrollingFrame_0.BorderSizePixel = 0;
    l_ScrollingFrame_0.Position = UDim2.new(0, 0, 0, 3);
    l_ScrollingFrame_0.Size = UDim2.new(1, -4, 1, -6);
    l_ScrollingFrame_0.CanvasSize = UDim2.new(0, 0, 0, 0);
    l_ScrollingFrame_0.ScrollBarThickness = l_result_0.ScrollBarThickness;
    l_ScrollingFrame_0.Active = true;
    l_ScrollingFrame_0.Parent = l_Frame_0;
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
    l_UIListLayout_0.Parent = l_ScrollingFrame_0;
    return l_Frame_0, l_ScrollingFrame_0, l_UIListLayout_0;
end;
v10.Destroy = function(v15)
    v15.GuiObject:Destroy();
    v15.Destroyed = true;
end;
v10.SetActive = function(v16, v17)
    v16.GuiObject.Visible = v17;
end;
v10.UpdateMessageFiltered = function(v18, v19)
    local v20 = nil;
    local v21 = 1;
    local l_MessageObjectLog_0 = v18.MessageObjectLog;
    while v21 <= #l_MessageObjectLog_0 do
        local v23 = l_MessageObjectLog_0[v21];
        if v23.ID == v19.ID then
            v20 = v23;
            break;
        else
            v21 = v21 + 1;
        end;
    end;
    if v20 then
        if not v0 then
            v20.UpdateTextFunction(v19);
            v18:PositionMessageLabelInWindow(v20, v21);
        elseif v19.Message == "" then
            v18:RemoveMessageAtIndex(v21);
            return ;
        else
            v20.UpdateTextFunction(v19);
            v18:PositionMessageLabelInWindow(v20, v21);
            return ;
        end;
    end;
end;
v10.RefreshMessagePlacement = function(v24, v25)
    local v26 = nil;
    local v27 = 1;
    local l_MessageObjectLog_1 = v24.MessageObjectLog;
    while v27 <= #l_MessageObjectLog_1 do
        local v29 = l_MessageObjectLog_1[v27];
        if v29.ID == v25.ID then
            v26 = v29;
            break;
        else
            v27 = v27 + 1;
        end;
    end;
    if v26 then
        v24:PositionMessageLabelInWindow(v26, v27);
    end;
end;
v10.AddMessage = function(v30, v31)
    v30:WaitUntilParentedCorrectly();
    local v32 = nil;
    v32 = if not l_status_0 then v9:CreateMessageLabel(v31, v30.CurrentChannelName) else v9:CreateMessageLabel_Chat(v31, v30.CurrentChannelName, function()
        v30:RefreshMessagePlacement(v31);
    end);
    if v32 == nil then
        return ;
    else
        table.insert(v30.MessageObjectLog, v32);
        v30:PositionMessageLabelInWindow(v32, #v30.MessageObjectLog);
        return ;
    end;
end;
v10.RemoveMessageAtIndex = function(v33, v34)
    v33:WaitUntilParentedCorrectly();
    local v35 = v33.MessageObjectLog[v34];
    if v35 then
        v35:Destroy();
        table.remove(v33.MessageObjectLog, v34);
    end;
end;
v10.AddMessageAtIndex = function(v36, v37, v38)
    local v39 = nil;
    v39 = if not l_status_0 then v9:CreateMessageLabel(v37, v36.CurrentChannelName) else v9:CreateMessageLabel_Chat(v37, v36.CurrentChannelName, function()
        v36:RefreshMessagePlacement(v37);
    end);
    if v39 == nil then
        return ;
    else
        table.insert(v36.MessageObjectLog, v38, v39);
        v36:PositionMessageLabelInWindow(v39, v38);
        return ;
    end;
end;
v10.RemoveLastMessage = function(v40)
    v40:WaitUntilParentedCorrectly();
    v40.MessageObjectLog[1]:Destroy();
    table.remove(v40.MessageObjectLog, 1);
end;
v10.IsScrolledDown = function(v41)
    local l_Offset_0 = v41.Scroller.CanvasSize.Y.Offset;
    local l_Y_0 = v41.Scroller.AbsoluteWindowSize.Y;
    local l_Y_1 = v41.Scroller.CanvasPosition.Y;
    local v45 = true;
    if l_Offset_0 >= l_Y_0 then
        v45 = l_Offset_0 - l_Y_1 <= l_Y_0 + 5;
    end;
    return v45;
end;
v10.UpdateMessageTextHeight = function(v46, v47)
    local l_BaseFrame_0 = v47.BaseFrame;
    for v49 = 1, 10 do
        if not v47.BaseMessage.TextFits then
            l_BaseFrame_0.Size = UDim2.new(1, 0, 0, v47.GetHeightFunction(v46.Scroller.AbsoluteSize.X - v49));
        else
            break;
        end;
    end;
end;
v10.PositionMessageLabelInWindow = function(v50, v51, v52)
    v50:WaitUntilParentedCorrectly();
    local v53 = v50:IsScrolledDown();
    local l_BaseFrame_1 = v51.BaseFrame;
    local v55 = 1;
    if v50.MessageObjectLog[v52 - 1] then
        v55 = if v52 == #v50.MessageObjectLog then v50.MessageObjectLog[v52 - 1].BaseFrame.LayoutOrder + 1 else v50.MessageObjectLog[v52 - 1].BaseFrame.LayoutOrder;
    end;
    l_BaseFrame_1.LayoutOrder = v55;
    l_BaseFrame_1.Size = UDim2.new(1, 0, 0, v51.GetHeightFunction(v50.Scroller.AbsoluteSize.X));
    l_BaseFrame_1.Parent = v50.Scroller;
    if v51.BaseMessage then
        v50:UpdateMessageTextHeight(v51);
    end;
    if v53 then
        v50.Scroller.CanvasPosition = Vector2.new(0, (math.max(0, v50.Scroller.CanvasSize.Y.Offset - v50.Scroller.AbsoluteSize.Y)));
    end;
end;
v10.ReorderAllMessages = function(v56)
    v56:WaitUntilParentedCorrectly();
    if v56.GuiObject.AbsoluteSize.Y < 1 then
        return ;
    else
        local l_CanvasPosition_0 = v56.Scroller.CanvasPosition;
        local v58 = v56:IsScrolledDown();
        for _, v60 in pairs(v56.MessageObjectLog) do
            v56:UpdateMessageTextHeight(v60);
        end;
        if v58 then
            v56.Scroller.CanvasPosition = Vector2.new(0, (math.max(0, v56.Scroller.CanvasSize.Y.Offset - v56.Scroller.AbsoluteSize.Y)));
            return ;
        else
            v56.Scroller.CanvasPosition = l_CanvasPosition_0;
            return ;
        end;
    end;
end;
v10.Clear = function(v61)
    for _, v63 in pairs(v61.MessageObjectLog) do
        v63:Destroy();
    end;
    v61.MessageObjectLog = {};
end;
v10.SetCurrentChannelName = function(v64, v65)
    v64.CurrentChannelName = v65;
end;
v10.FadeOutBackground = function(_, _)
end;
v10.FadeInBackground = function(_, _)
end;
v10.FadeOutText = function(v70, v71)
    for v72 = 1, #v70.MessageObjectLog do
        if v70.MessageObjectLog[v72].FadeOutFunction then
            v70.MessageObjectLog[v72].FadeOutFunction(v71, l_CurveUtil_0);
        end;
    end;
end;
v10.FadeInText = function(v73, v74)
    for v75 = 1, #v73.MessageObjectLog do
        if v73.MessageObjectLog[v75].FadeInFunction then
            v73.MessageObjectLog[v75].FadeInFunction(v74, l_CurveUtil_0);
        end;
    end;
end;
v10.Update = function(v76, v77)
    for v78 = 1, #v76.MessageObjectLog do
        if v76.MessageObjectLog[v78].UpdateAnimFunction then
            v76.MessageObjectLog[v78].UpdateAnimFunction(v77, l_CurveUtil_0);
        end;
    end;
end;
v10.WaitUntilParentedCorrectly = function(v79)
    while not v79.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
        v79.GuiObject.AncestryChanged:wait();
    end;
end;
l_result_0.new = function()
    local v80 = setmetatable({}, v10);
    v80.Destroyed = false;
    local v81, v82, v83 = v14();
    v80.GuiObject = v81;
    v80.Scroller = v82;
    v80.Layout = v83;
    v80.MessageObjectLog = {};
    v80.Name = "MessageLogDisplay";
    v80.GuiObject.Name = "Frame_" .. v80.Name;
    v80.CurrentChannelName = "";
    v80.GuiObject:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        spawn(function()
            v80:ReorderAllMessages();
        end);
    end);
    local v84 = true;
    v80.Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        local l_AbsoluteContentSize_0 = v80.Layout.AbsoluteContentSize;
        v80.Scroller.CanvasSize = UDim2.new(0, 0, 0, l_AbsoluteContentSize_0.Y);
        if v84 then
            v80.Scroller.CanvasPosition = Vector2.new(0, l_AbsoluteContentSize_0.Y - v80.Scroller.AbsoluteWindowSize.Y);
        end;
    end);
    v80.Scroller:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
        v84 = v80:IsScrolledDown();
    end);
    return v80;
end;
return l_result_0;

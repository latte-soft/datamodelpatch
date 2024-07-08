local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(game:GetService("CorePackages").Roact);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local v4 = require(l_script_FirstAncestor_0.Components.Constants);
local v5 = require(l_script_FirstAncestor_0.Components.ModalBaseSelectorDialog);
local v6 = {
    modalSelectorHandle = nil, 
    modalSelectorFrame = nil, 
    modalSelectorScreenGui = nil
};
return {
    mountModalSelector = function(v7, v8, v9, v10, v11)
        local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
        if not v6.modalSelectorScreenGui then
            local l_ScreenGui_0 = Instance.new("ScreenGui");
            l_ScreenGui_0.Name = "ModalSelectorDialogGui";
            l_ScreenGui_0.DisplayOrder = 7;
            l_ScreenGui_0.Enabled = true;
            l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            l_ScreenGui_0.Parent = l_CoreGui_0:FindFirstChild(v4.AbuseReportMenuRootName, true);
            v6.modalSelectorScreenGui = l_ScreenGui_0;
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.Position = UDim2.new(0, 0, 0, -l_l_GuiService_0_GuiInset_0.Y);
            l_Frame_0.Size = UDim2.new(1, 0, 1, l_l_GuiService_0_GuiInset_0.Y);
            l_Frame_0.Parent = v6.modalSelectorScreenGui;
            v6.modalSelectorFrame = l_Frame_0;
        end;
        v6.modalSelectorHandle = v2.mount(v2.createElement(v5, {
            isShown = true, 
            cellData = v9, 
            viewportHeight = v7, 
            viewportWidth = v8, 
            onSelect = v10, 
            onClose = v11
        }), v6.modalSelectorFrame, "ModalSelectorDialog");
    end, 
    unmountModalSelector = function()
        if v6.modalSelectorHandle ~= nil then
            v2.unmount(v6.modalSelectorHandle);
            v6.modalSelectorHandle = nil;
        end;
        if v6.modalSelectorScreenGui ~= nil then
            v6.modalSelectorFrame.Parent = nil;
            v6.modalSelectorFrame = nil;
            v6.modalSelectorScreenGui = nil;
        end;
    end
};

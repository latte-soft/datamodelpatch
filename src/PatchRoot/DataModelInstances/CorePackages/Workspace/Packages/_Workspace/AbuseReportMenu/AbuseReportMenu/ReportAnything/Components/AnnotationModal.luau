local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(game:GetService("CorePackages").Roact);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Components.Constants);
local v6 = require(l_script_FirstAncestor_0.ReportAnything.Components.ScreenshotFlowStepHandlerContainer);
local _ = require(l_script_FirstAncestor_0.ReportAnything.Utility.ReportAnythingAnalytics);
local v8 = {
    annotationPageHandle = nil, 
    annotationPageFrame = nil, 
    annotationPageScreenGui = nil
};
return {
    mountAnnotationPage = function(v9, v10, v11, v12, v13)
        local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
        if not v8.annotationPageScreenGui then
            local l_ScreenGui_0 = Instance.new("ScreenGui");
            l_ScreenGui_0.Name = "AnnotationPageContents";
            l_ScreenGui_0.DisplayOrder = 7;
            l_ScreenGui_0.Enabled = true;
            l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            l_ScreenGui_0.Parent = l_CoreGui_0:FindFirstChild(v5.AbuseReportMenuRootName, true);
            v8.annotationPageScreenGui = l_ScreenGui_0;
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.Position = UDim2.new(0, 0, 0, -l_l_GuiService_0_GuiInset_0.Y);
            l_Frame_0.Size = UDim2.new(1, 0, 1, l_l_GuiService_0_GuiInset_0.Y);
            l_Frame_0.Parent = v8.annotationPageScreenGui;
            v8.annotationPageFrame = l_Frame_0;
        end;
        local v22 = v2.createElement(v6, {
            screenshot = v12.screenshotContentId, 
            entryPoint = v9, 
            backAction = function()
                if v8.annotationPageHandle ~= nil then
                    v2.unmount(v8.annotationPageHandle);
                    v8.annotationPageHandle = nil;
                end;
                if v8.annotationPageScreenGui ~= nil then
                    v8.annotationPageFrame.Parent = nil;
                    v8.annotationPageFrame = nil;
                    v8.annotationPageScreenGui = nil;
                end;
            end, 
            dismissAction = function()
                if v8.annotationPageHandle ~= nil then
                    v2.unmount(v8.annotationPageHandle);
                    v8.annotationPageHandle = nil;
                end;
                if v8.annotationPageScreenGui ~= nil then
                    v8.annotationPageFrame.Parent = nil;
                    v8.annotationPageFrame = nil;
                    v8.annotationPageScreenGui = nil;
                end;
            end, 
            finishAnnotationAction = function(v18)
                if v8.annotationPageHandle ~= nil then
                    v2.unmount(v8.annotationPageHandle);
                    v8.annotationPageHandle = nil;
                end;
                if v8.annotationPageScreenGui ~= nil then
                    v8.annotationPageFrame.Parent = nil;
                    v8.annotationPageFrame = nil;
                    v8.annotationPageScreenGui = nil;
                end;
                v13({
                    type = v5.ReportAnythingActions.SetAnnotationPoints, 
                    annotationPoints = v18
                });
                v13({
                    type = v5.ReportAnythingActions.CompleteAttachment
                });
            end, 
            restartAction = function()
                if v8.annotationPageHandle ~= nil then
                    v2.unmount(v8.annotationPageHandle);
                    v8.annotationPageHandle = nil;
                end;
                if v8.annotationPageScreenGui ~= nil then
                    v8.annotationPageFrame.Parent = nil;
                    v8.annotationPageFrame = nil;
                    v8.annotationPageScreenGui = nil;
                end;
                v13({
                    type = v5.ReportAnythingActions.ClearAll
                });
                v10();
            end, 
            skipAnnotationAction = function()
                if v8.annotationPageHandle ~= nil then
                    v2.unmount(v8.annotationPageHandle);
                    v8.annotationPageHandle = nil;
                end;
                if v8.annotationPageScreenGui ~= nil then
                    v8.annotationPageFrame.Parent = nil;
                    v8.annotationPageFrame = nil;
                    v8.annotationPageScreenGui = nil;
                end;
                v13({
                    type = v5.ReportAnythingActions.CompleteAttachment
                });
            end, 
            setAnnotationCircleRadius = function(v19)
                v13({
                    type = v5.ReportAnythingActions.SetAnnotationCircleRadius, 
                    radius = v19
                });
            end, 
            setAnnotationAreaDimensions = function(v20, v21)
                v13({
                    type = v5.ReportAnythingActions.SetAnnotationAreaDimensions, 
                    width = v20, 
                    height = v21
                });
            end, 
            initialAnnotationPoints = {}, 
            initialPageNumber = 1, 
            reportAnythingAnalytics = v11
        });
        v13({
            type = v5.ReportAnythingActions.SetAnnotationOptionSeen
        });
        v8.annotationPageHandle = v2.mount(v22, v8.annotationPageFrame, "AnnotationFlow");
    end, 
    unmountAnnotationPage = function()
        if v8.annotationPageHandle ~= nil then
            v2.unmount(v8.annotationPageHandle);
            v8.annotationPageHandle = nil;
        end;
        if v8.annotationPageScreenGui ~= nil then
            v8.annotationPageFrame.Parent = nil;
            v8.annotationPageFrame = nil;
            v8.annotationPageScreenGui = nil;
        end;
    end
};

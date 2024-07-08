local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.tutils);
local v8 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v9 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v9.Style.withStyle;
local v11 = require(l_Modules_0.LuaApp.withLocalization);
local v12 = require(l_Modules_0.LuaApp.FitChildren);
local v13 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local v16 = require(l_Modules_0.LuaApp.Components.Authentication.Logger);
local v17 = require(l_Modules_0.LuaApp.Enum.IssueCondition);
local v18 = require(l_Modules_0.LuaApp.Enum.InputValidity);
local v19 = v2.createBinding(0);
local v20 = v6.interface({
    validateFunction = v6.callback, 
    getIssueMessageList = v6.callback, 
    getDefaultIssues = v6.callback
});
local v21 = v2.PureComponent:extend("IssueTracker");
local v22 = require(l_Modules_0.LuaApp.Flags.GetFFlagUsernameSuggestionExperimentEnabled);
local v23 = require(script.Parent.Flags.FFlagSignUpTrackFailedRequest);
v21.init = function(v24)
    local l_validator_0 = v24.props.validator;
    assert(v20(l_validator_0));
    local v26 = l_validator_0.getIssueMessageList();
    local v27 = l_validator_0.getDefaultIssues();
    local v28 = {};
    for v29 in pairs(v26) do
        local v30 = false;
        if v27[v29] ~= v17.Hidden then
            v30 = true;
        end;
        v28[v29] = v30;
    end;
    v24.state = {
        listOfIssuesOnDisplay = v28, 
        issueMessageList = v26, 
        issueCondition = v27, 
        inputValidity = v18.Unvalidated
    };
    v24.isMounted = false;
    v24.containerRef = v2.createRef();
    v24.validateText = function()
        local l_networking_0 = v24.props.networking;
        local l_textToValidate_0 = v24.props.textToValidate;
        local l_validate_0 = v24.props.validate;
        local l_validatorAdditionalProps_0 = v24.props.validatorAdditionalProps;
        local l_issueCondition_0 = v24.state.issueCondition;
        assert(v20(l_validator_0));
        local l_validateFunction_0 = l_validator_0.validateFunction;
        local v37 = v22();
        l_validate_0(l_networking_0, l_validateFunction_0, l_textToValidate_0, l_issueCondition_0, l_validatorAdditionalProps_0):andThen(function(v38)
            spawn(function()
                local l_onTextValidated_0 = v24.props.onTextValidated;
                local l_textToValidate_1 = v24.props.textToValidate;
                local l_Invalid_0 = v18.Invalid;
                if v24.isMounted and v38.Input == l_textToValidate_1 then
                    if l_textToValidate_1 == "" then
                        l_Invalid_0 = v18.Unvalidated;
                    elseif v38.InputValid then
                        l_Invalid_0 = v18.Valid;
                    end;
                    if l_onTextValidated_0 then
                        if not v23 then
                            l_onTextValidated_0(v38.Input, l_Invalid_0);
                        else
                            l_onTextValidated_0(v38.Input, l_Invalid_0, v38.hasRequestFailed);
                        end;
                    end;
                    v24:setState({
                        issueCondition = v38.IssueCondition, 
                        inputValidity = l_Invalid_0
                    });
                    if not (not v37 or not v24.props.updateIssueCondition) then
                        v24.props.updateIssueCondition(v38.IssueCondition);
                    end;
                end;
            end);
        end, function(v42)
            v16:warning(string.format("Input issueTracker error: %s", (tostring(v42))));
            v24:setState({
                inputValidity = v18.Unvalidated
            });
        end);
    end;
    v24.updateListOfIssuesOnDisplay = function()
        local l_height_0 = v24.props.height;
        local l_issueMessageList_0 = v24.state.issueMessageList;
        local l_issueCondition_1 = v24.state.issueCondition;
        local v46 = 0;
        local v47 = {};
        local v48 = {};
        local v49 = {};
        local v50 = {};
        local v51 = not not v24.containerRef.current and v24.containerRef.current:GetChildren() or {};
        for _, v53 in pairs(v51) do
            if v53:IsA("GuiObject") then
                v50[v53.Name] = v53.AbsoluteSize.Y;
            end;
        end;
        for v54 in pairs(l_issueMessageList_0) do
            v47[v54] = false;
            local v55 = l_issueCondition_1[v54] == v17.Problematic;
            if l_issueCondition_1[v54] ~= v17.Hidden then
                local v56 = v50[v54] or 0;
                table.insert(v48, v54);
                v46 = v46 + v56;
                if not v55 then
                    table.insert(v49, #v48);
                end;
            end;
        end;
        v46 = v46 + (#v48 - 1) * 5;
        if l_height_0 then
            for v57 = #v49, 1, -1 do
                if l_height_0 < v46 then
                    local v58 = v49[v57];
                    v46 = (v46 - (v50[v48[v58]] or 0)) - 5;
                    table.remove(v48, v58);
                else
                    break;
                end;
            end;
            for v59 = #v48, 1, -1 do
                if l_height_0 < v46 then
                    v46 = (v46 - (v50[v48[v59]] or 0)) - 5;
                    table.remove(v48, v59);
                else
                    break;
                end;
            end;
        end;
        for _, v61 in pairs(v48) do
            v47[v61] = true;
        end;
        spawn(function()
            if not (not v24.isMounted or v7.shallowEqual(v47, v24.state.listOfIssuesOnDisplay)) then
                v24:setState({
                    listOfIssuesOnDisplay = v47
                });
            end;
        end);
    end;
end;
v21.didMount = function(v62)
    v62.isMounted = true;
    v62.updateListOfIssuesOnDisplay();
end;
v21.willUnmount = function(v63)
    v63.isMounted = false;
end;
v21.didUpdate = function(v64, v65, _)
    local l_validator_1 = v64.props.validator;
    local l_validatorAdditionalProps_1 = v64.props.validatorAdditionalProps;
    local l_textToValidate_2 = v64.props.textToValidate;
    if l_validator_1 ~= v65.validator then
        v8.assert(l_validator_1 == v65.validator, "IssueTracker expects the validator to never change");
    end;
    if not (l_textToValidate_2 == v65.textToValidate and v7.shallowEqual(l_validatorAdditionalProps_1, v65.validatorAdditionalProps)) then
        spawn(function()
            if not v23 then
                wait(0.3);
            else
                task.wait(not v64.props.debounceTime and 0.3 or v64.props.debounceTime);
            end;
            if l_textToValidate_2 == v64.props.textToValidate then
                v64.validateText();
            end;
        end);
    end;
    v64.updateListOfIssuesOnDisplay();
end;
v21.render = function(v70)
    local l_height_1 = v70.props.height;
    local l_issueMessageList_1 = v70.state.issueMessageList;
    local l_issueCondition_2 = v70.state.issueCondition;
    local l_listOfIssuesOnDisplay_0 = v70.state.listOfIssuesOnDisplay;
    return l_withStyle_0(function(v75)
        local l_Font_0 = v75.Font.CaptionBody.Font;
        local v77 = v75.Font.BaseSize * v75.Font.CaptionBody.RelativeSize;
        local l_contentTransparency_0 = v70.props.contentTransparency;
        local v79 = v70.props.checkmarkTransparency or v19;
        if not l_contentTransparency_0 then
            local l_Transparency_0 = v75.Theme.TextDefault.Transparency;
            if l_Transparency_0 ~= v70.textDefaultTransparency then
                v70.textDefaultTransparency = l_Transparency_0;
                v70.textDefaultTransparencyBinding = v2.createBinding(l_Transparency_0);
            end;
            l_contentTransparency_0 = v70.textDefaultTransparencyBinding;
        end;
        local v81 = v2.joinBindings({
            content = l_contentTransparency_0, 
            checkmark = v79
        });
        return v11(l_issueMessageList_1)(function(v82)
            local v83 = {
                v2.createElement("UIListLayout", {
                    Padding = UDim.new(0, 5), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    [v2.Change.AbsoluteContentSize] = v70.updateListOfIssuesOnDisplay
                })
            };
            for v84, v85 in pairs(l_issueMessageList_1) do
                local v86 = l_issueCondition_2[v84] == v17.Problematic;
                local v87 = v86 and v70.state.inputValidity ~= v18.Unvalidated;
                v83[v84] = v2.createElement(v12.FitFrame, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v12.FitAxis.Height, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = string.byte(v85, #v85), 
                    Visible = l_listOfIssuesOnDisplay_0[v84]
                }, {
                    List = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        Padding = UDim.new(0, 7), 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    CheckHolder = v2.createElement("Frame", {
                        Size = UDim2.new(0, 12, 0, 12), 
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1
                    }, {
                        CheckMark = v2.createElement(l_ImageSetLabel_0, {
                            BackgroundTransparency = 1, 
                            Image = if not v86 then l_GetImageData_0("LuaApp/icons/progress_small") or "LuaApp/icons/progress_small" else l_GetImageData_0("LuaApp/icons/navigation/close") or "LuaApp/icons/navigation/close", 
                            ImageColor3 = not not v87 and v75.Theme.Alert.Color or v75.Theme.TextDefault.Color, 
                            ImageTransparency = v81:map(function(v88)
                                return (v88.content - 1) * (1 - v88.checkmark) + 1;
                            end), 
                            Size = UDim2.new(1, 0, 1, 0), 
                            Position = UDim2.new(0.5, 0, 0.65, 0), 
                            AnchorPoint = Vector2.new(0.5, 0.5)
                        })
                    }), 
                    IssueLabel = v2.createElement(v13, {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = v12.FitAxis.Height, 
                        BackgroundTransparency = 1, 
                        Text = v82[v84], 
                        TextWrapped = true, 
                        Font = l_Font_0, 
                        TextSize = v77, 
                        TextColor3 = not not v87 and v75.Theme.Alert.Color or v75.Theme.TextDefault.Color, 
                        TextTransparency = l_contentTransparency_0, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                });
            end;
            if not l_height_1 then
                return v2.createElement(v12.FitFrame, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = v12.FitAxis.Height, 
                    BackgroundTransparency = 1, 
                    [v2.Ref] = v70.containerRef, 
                    Position = v79:map(function(v89)
                        return UDim2.new(0, 19 * -v89, 0, 0);
                    end)
                }, v83);
            else
                return v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, l_height_1), 
                    BackgroundTransparency = 1, 
                    [v2.Ref] = v70.containerRef, 
                    Position = v79:map(function(v90)
                        return UDim2.new(0, 19 * -v90, 0, 0);
                    end)
                }, v83);
            end;
        end);
    end);
end;
return (l_RoactServices_0.connect({
    networking = v5
})((v3.connect(nil, function(v91)
    return {
        validate = function(v92, v93, v94, v95, v96)
            return v91(v93(v92, v94, v95, v96));
        end
    };
end)(v21))));

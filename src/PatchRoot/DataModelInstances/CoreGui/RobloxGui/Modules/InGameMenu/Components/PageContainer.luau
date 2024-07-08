local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_RoactRodux_0 = v2.RoactRodux;
local l_Otter_0 = v2.Otter;
local l_t_0 = v2.t;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(script.Parent.BlurredModalPortal);
local v9 = require(script.Parent.Pages);
local v10 = require(script.Parent.Parent.Resources.Constants);
local v11 = {};
for v12, v13 in pairs(v9.pagesByKey) do
    v11[v12] = require(v13.component);
end;
local v14 = require(l_Parent_0.Localization.withLocalization);
local v15 = l_Roact_0.PureComponent:extend("PageContainer");
v15.validateProps = l_t_0.strictInterface({
    currentPage = l_t_0.string, 
    visible = l_t_0.boolean, 
    controllerBarHeight = l_t_0.number, 
    controllerBarCount = l_t_0.number
});
v15.init = function(v16, v17)
    v16.onContainerRendered = function(v18, v19)
        if v18 then
            local v20 = v16.getSelectionParentNameFromKey(v19);
            l_GuiService_0:RemoveSelectionGroup(v20);
            l_GuiService_0:AddSelectionParent(v20, v18);
        end;
    end;
    v16.getSelectionParentNameFromKey = function(v21)
        return v21 .. "_IGMPageSelectionGroup";
    end;
    local v22 = {};
    local v23 = {};
    local v24 = {};
    v16.pagePositions = {};
    v16.pageVisibilities = {};
    for v25, _ in pairs(v9.pagesByKey) do
        local v27 = v17.currentPage == v25 and 1 or 0;
        local v28, v29 = l_Roact_0.createBinding(v27);
        v22[v25] = v28;
        v23[v25] = v29;
        v24[v25] = v27;
        v16.pagePositions[v25] = v22[v25]:map(function(v30)
            return UDim2.new(v30 - 1, 0, 0, 0);
        end);
        v16.pageVisibilities[v25] = v22[v25]:map(function(v31)
            if not (v31 ~= 0) or v31 == 1.25 then
                return false;
            else
                return true;
            end;
        end);
    end;
    v16.pageMotor = l_Otter_0.createGroupMotor(v24);
    v16.pageMotor:onStep(function(v32)
        for v33, v34 in pairs(v32) do
            v23[v33](v34);
        end;
    end);
end;
v15.render = function(v35)
    local v36 = {};
    for v37, v38 in pairs(v9.pagesByKey) do
        local v39 = v35.pageVisibilities[v37];
        v36[v37] = v14({
            title = v38.title
        })(function(v40)
            if v38.isModal then
                return l_Roact_0.createElement(v8, {
                    Enabled = v35.props.currentPage == v37
                }, {
                    ModalPageContent = l_Roact_0.createElement(v11[v37], {
                        pageTitle = v40.title
                    })
                });
            else
                return l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Position = v35.pagePositions[v37], 
                    BackgroundTransparency = 1, 
                    ZIndex = v38.navigationDepth, 
                    Visible = v39, 
                    [l_Roact_0.Ref] = function(v41)
                        v35.onContainerRendered(v41, v37);
                    end
                }, {
                    Page = l_Roact_0.createElement(v11[v37], {
                        pageTitle = v38.title and v40.title
                    })
                });
            end;
        end);
    end;
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(0, 400, 1, v35.props.controllerBarCount > 0 and -1 * v10.ControllerBarHeight or nil), 
        Position = UDim2.new(0, 64, 0, 0), 
        BackgroundTransparency = 1, 
        Visible = v35.props.visible, 
        ClipsDescendants = true
    }, v36);
end;
v15.didUpdate = function(v42, v43, _)
    local l_currentPage_0 = v43.currentPage;
    local l_currentPage_1 = v42.props.currentPage;
    if l_currentPage_0 ~= l_currentPage_1 then
        local l_isModal_0 = v9.pagesByKey[l_currentPage_1].isModal;
        local l_isModal_1 = v9.pagesByKey[l_currentPage_0].isModal;
        if not l_isModal_0 and not l_isModal_1 then
            if v9.pagesByKey[l_currentPage_0].navigationDepth < v9.pagesByKey[l_currentPage_1].navigationDepth then
                if not l_isModal_0 then
                    v42.pageMotor:setGoal({
                        [l_currentPage_0] = l_Otter_0.spring(1.25, {
                            frequency = 2.5
                        })
                    });
                end;
            elseif v9.pagesByKey[l_currentPage_0].navigationDepth == v9.pagesByKey[l_currentPage_1].navigationDepth then
                v42.pageMotor:setGoal({
                    [l_currentPage_0] = l_Otter_0.spring(0, {
                        frequency = 2.5
                    })
                });
            else
                local v49 = {};
                local l_l_currentPage_0_0 = l_currentPage_0;
                while l_l_currentPage_0_0 ~= nil and l_l_currentPage_0_0 ~= l_currentPage_1 do
                    v49[l_l_currentPage_0_0] = l_Otter_0.spring(0, {
                        frequency = 3.5
                    });
                    l_l_currentPage_0_0 = v9.pagesByKey[l_l_currentPage_0_0].parentPage;
                end;
                v42.pageMotor:setGoal(v49);
            end;
            v42.pageMotor:setGoal({
                [l_currentPage_1] = l_Otter_0.spring(1, {
                    frequency = 2.5
                })
            });
        else
            return ;
        end;
    end;
end;
v15.willUnmount = function(v51)
    for v52, v53 in pairs(v9.pagesByKey) do
        if not v53.isModal then
            l_GuiService_0:RemoveSelectionGroup((v51.getSelectionParentNameFromKey(v52)));
        end;
    end;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v54)
    return {
        currentPage = v54.menuPage, 
        visible = v54.isMenuOpen, 
        controllerBarHeight = v54.controllerBarHeight, 
        controllerBarCount = v54.controllerBarCount
    };
end)(v15);

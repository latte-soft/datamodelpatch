local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.Cryo);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactGamepad);
local v7 = require(l_Parent_0.Core.Style.useStyle);
local v8 = require(script.Parent.CursorContext);
local v9 = require(script.Parent.CursorComponent);
local v10 = require(script.Parent.CursorType);
local function _(v11, v12, v13)
    return string.format("%f %f %f %f", v11.Scale, v11.Offset, v12, v13);
end;
local function v24(v15)
    local l_huge_0 = math.huge;
    local l_huge_1 = math.huge;
    local l_huge_2 = math.huge;
    local l_huge_3 = math.huge;
    for v20, v21 in string.split(v15, " ") do
        local v22 = tonumber(v21);
        if v22 ~= nil then
            if v20 == 1 then
                l_huge_0 = v22;
            elseif v20 == 2 then
                l_huge_1 = v22;
            elseif v20 == 3 then
                l_huge_2 = v22;
            elseif v20 == 4 then
                l_huge_3 = v22;
            end;
        end;
    end;
    local v23 = false;
    if l_huge_0 ~= math.huge then
        v23 = false;
        if l_huge_1 ~= math.huge then
            v23 = false;
            if l_huge_2 ~= math.huge then
                v23 = l_huge_3 ~= math.huge;
            end;
        end;
    end;
    assert(v23, "Error Not all parameters are decoded.");
    return UDim.new(l_huge_0, (math.max(0, l_huge_1 + l_huge_2))), l_huge_2, l_huge_3;
end;
return function(v25)
    local v26, v27 = v5.useState({});
    local v28, v29 = v5.useState({});
    local v30 = v5.createRef();
    local v31, v32 = v5.useState(nil);
    local v33 = v6.useRefCache();
    local l_SelectionCursor_0 = v7().Tokens.Component.SelectionCursor;
    local function v43(v35, v36, v37)
        local v38 = UDim.new(0, 0);
        if v35 ~= nil then
            v38 = v35;
        end;
        local v39 = 0;
        if v37 ~= nil then
            assert(v37 > 0, "Error borderWidth should be larger than 0.");
            v39 = v37;
        else
            v39 = l_SelectionCursor_0.BorderWidth;
        end;
        local v40 = 0;
        v40 = if v36 ~= nil then v36 - v39 else l_SelectionCursor_0.Offset - v39;
        local l_v38_0 = v38;
        local v42 = string.format("%f %f %f %f", l_v38_0.Scale, l_v38_0.Offset, v40, v39);
        if v26[v42] == nil then
            v27(v4.Dictionary.join(v26, {
                [v42] = true
            }));
        end;
        return v33[v42];
    end;
    local function v45(v44)
        assert(v10.isEnumValue(v44), ("Errorformat((tostring(v44))));
        if v28[v44] == nil then
            v29(v4.Dictionary.join(v28, {
                [v44] = true
            }));
        end;
        return v33[v44];
    end;
    local function v57()
        local v46 = {};
        for v47, _ in pairs(v26) do
            local v49 = false;
            if v33[v47] ~= nil then
                v49 = false;
                if v31 ~= nil then
                    v49 = v33[v47].current == v31;
                end;
            end;
            local v50, v51, v52 = v24(v47);
            v46[v47] = v5.createElement(v9, {
                ref = v33[v47], 
                isVisible = v49, 
                cornerRadius = v50, 
                offset = v51, 
                borderWidth = v52
            });
        end;
        for v53, _ in pairs(v28) do
            local v55 = v53.rawValue();
            local v56 = false;
            if v33[v53] ~= nil then
                v56 = false;
                if v31 ~= nil then
                    v56 = v33[v53].current == v31;
                end;
            end;
            v46[v53] = v5.createElement(v55, {
                ref = v33[v53], 
                isVisible = v56
            });
        end;
        return v46;
    end;
    v5.useEffect(function()
        if v30.current ~= nil and v30.current:IsDescendantOf(game) then
            local v58 = v30.current:IsDescendantOf(l_CoreGui_0);
            local function v59()
                if not v58 then
                    return l_GuiService_0:GetPropertyChangedSignal("SelectedObject"):Connect(function()
                        if l_GuiService_0.SelectedObject == nil then
                            v32(nil);
                            return ;
                        else
                            v32(l_GuiService_0.SelectedObject.SelectionImageObject);
                            return ;
                        end;
                    end);
                else
                    return l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
                        if l_GuiService_0.SelectedCoreObject == nil then
                            v32(nil);
                            return ;
                        else
                            v32(l_GuiService_0.SelectedCoreObject.SelectionImageObject);
                            return ;
                        end;
                    end);
                end;
            end;
            local v60 = v59();
            local v61 = v30.current.AncestryChanged:Connect(function()
                v60:Disconnect();
                v60 = v59();
            end);
            return function()
                v60:Disconnect();
                v61:Disconnect();
            end;
        else
            return ;
        end;
    end, {});
    return v5.createElement(v8.Provider, {
        value = {
            getCursor = v43, 
            getCursorByType = v45
        }
    }, v4.Dictionary.join({
        InvisibleContainer = v5.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            Visible = false, 
            ref = v30
        }, (v57()))
    }, v25.children));
end;

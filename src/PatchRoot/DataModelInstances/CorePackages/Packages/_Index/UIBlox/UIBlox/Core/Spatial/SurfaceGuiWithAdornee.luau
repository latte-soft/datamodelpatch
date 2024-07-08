local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactRoblox);
local l_shallowEqual_0 = require(l_Parent_0.Shared).shallowEqual;
local v4 = v1.createContext(nil);
return v1.memo(function(v5)
    local v6 = v5.name or "Unnamed";
    local v7 = v5.detached or false;
    local l_adorneeProps_0 = v5.adorneeProps;
    local l_surfaceGuiProps_0 = v5.surfaceGuiProps;
    local v10 = v1.useRef(nil);
    local v11 = v1.useRef(nil);
    local v12 = v1.useRef(nil);
    local v13 = v1.useContext(v4);
    local v14 = v7 or v13 == nil;
    local v15 = v1.createElement("SurfaceGui", {
        Name = ("%*_SurfaceGui"):format(v6), 
        Adornee = v10, 
        Active = true, 
        Enabled = l_surfaceGuiProps_0.Enabled, 
        CanvasSize = l_surfaceGuiProps_0.CanvasSize, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        AlwaysOnTop = true, 
        LightInfluence = 0, 
        Shape = l_surfaceGuiProps_0.Shape, 
        HorizontalCurvature = l_surfaceGuiProps_0.HorizontalCurvature, 
        ZOffset = l_surfaceGuiProps_0.ZOffset
    }, v5.children);
    return v1.createElement(v4.Provider, {
        value = if not v5.detached then v12 else nil
    }, {
        SurfaceGui = if l_surfaceGuiProps_0.Parent ~= nil then v2.createPortal(v15, l_surfaceGuiProps_0.Parent) else v15, 
        AdorneePortal = v2.createPortal({
            Adornee = v1.createElement("Part", {
                Name = ("%*_Part"):format(v6), 
                ref = v10, 
                Transparency = 1, 
                Size = l_adorneeProps_0.Size, 
                CFrame = if not v14 then nil else l_adorneeProps_0.CFrame, 
                CanCollide = false, 
                CanTouch = false, 
                Anchored = v14
            }, {
                ParentAttachment = if not v14 then v1.createElement(v1.Fragment, nil, {
                    SelfAttachment = v1.createElement("Attachment", {
                        Name = ("%*_SelfAttachment"):format(v6), 
                        CFrame = l_adorneeProps_0.CFrame, 
                        ref = v11
                    }), 
                    ParentConstraint = v1.createElement("RigidConstraint", {
                        Name = ("%*_ParentConstraint"):format(v6), 
                        Enabled = true, 
                        Attachment0 = v13, 
                        Attachment1 = v11
                    })
                }) else nil, 
                ChildrenAttachment = v1.createElement("Attachment", {
                    Name = ("%*_ChildrenAttachment"):format(v6), 
                    CFrame = CFrame.identity, 
                    ref = v12
                })
            })
        }, l_adorneeProps_0.Parent or workspace)
    });
end, function(v16, v17)
    local v18 = false;
    if v16.name == v17.name then
        v18 = false;
        if v16.detached == v17.detached then
            v18 = (l_shallowEqual_0(v16.adorneeProps, v17.adorneeProps) and l_shallowEqual_0(v16.surfaceGuiProps, v17.surfaceGuiProps)) and v16.children == v17.children;
        end;
    end;
    return v18;
end);

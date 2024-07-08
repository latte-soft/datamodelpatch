local l_Parent_0 = script:FindFirstAncestor("SceneManagement").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactRoblox);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Workspace_0 = game:GetService("Workspace");
local v5 = v1.createContext(nil);
return function(v6)
    local v7 = v1.useRef(nil);
    local v8 = v1.useRef(nil);
    local v9 = v1.useRef(nil);
    local v10 = v1.useContext(v5);
    local v11 = v10 == nil;
    return v1.createElement(v5.Provider, {
        value = v9
    }, {
        AdorneePortal = v2.createPortal({
            Adornee = v1.createElement("Part", {
                Name = ("%*_Part"):format(v6.name), 
                ref = v7, 
                Transparency = 1, 
                Size = v6.adorneeSize, 
                CFrame = if not v11 then nil else v6.adorneeCFrame, 
                CanCollide = false, 
                CanTouch = false, 
                Anchored = v11
            }, {
                ParentAttachment = if not v11 then v1.createElement(v1.Fragment, nil, {
                    SelfAttachment = v1.createElement("Attachment", {
                        Name = ("%*_SelfAttachment"):format(v6.name), 
                        CFrame = v6.adorneeCFrame, 
                        ref = v8
                    }), 
                    ParentConstraint = v1.createElement("RigidConstraint", {
                        Name = ("%*_ParentConstraint"):format(v6.name), 
                        Enabled = true, 
                        Attachment0 = v10, 
                        Attachment1 = v8
                    })
                }) else nil, 
                ChildrenAttachment = v1.createElement("Attachment", {
                    Name = ("%*_ChildrenAttachment"):format(v6.name), 
                    CFrame = CFrame.identity, 
                    ref = v9
                })
            })
        }, v6.adorneeParent or l_Workspace_0), 
        SurfaceGuiPortal = v2.createPortal({
            SurfaceGui = v1.createElement("SurfaceGui", {
                Name = ("%*_SurfaceGui"):format(v6.name), 
                Adornee = v7, 
                Active = true, 
                Enabled = v6.isVisible, 
                CanvasSize = v6.canvasSize, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                AlwaysOnTop = true, 
                LightInfluence = 0
            }, v6.children)
        }, v6.surfaceGuiParent or l_CoreGui_0)
    });
end;

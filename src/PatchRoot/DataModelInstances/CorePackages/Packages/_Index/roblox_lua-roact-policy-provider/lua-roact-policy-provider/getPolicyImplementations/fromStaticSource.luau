local function v0()
end;
return function()
    return function(v1)
        assert(v1, "expected externalPolicy");
        return {
            read = function()
                return v1;
            end, 
            onPolicyChanged = function(v2)
                return Instance.new("BindableEvent").Event:Connect(v2 or v0);
            end
        };
    end;
end;

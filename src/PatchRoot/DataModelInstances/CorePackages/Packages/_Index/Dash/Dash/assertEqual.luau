local l_Parent_0 = script.Parent;
return function(v1, v2, v3)
    if v1 ~= v2 then
        require(l_Parent_0.Error).new("AssertError", v3 or "Left {left:?} does not equal right {right:?}"):throw({
            left = v1, 
            right = v2
        });
    end;
end;

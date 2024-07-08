local l_Element_0 = require(script.Parent.Parent.Rhodium).Element;
return function(v1, v2)
    local v3 = l_Element_0.new(v1);
    if not v2 then
        v3:click();
    else
        v3:clickWithoutValidation();
    end;
    wait(0);
end;

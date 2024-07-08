local l_Object_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Object;
local _ = require(script.Parent.Parent.language.directiveLocation);
getIntrospectionQuery = function(v2)
    local v3 = l_Object_0.assign({
        descriptions = true, 
        specifiedByUrl = false, 
        directiveIsRepeatable = false, 
        schemaDescription = false, 
        inputValueDeprecation = false
    }, v2);
    local v4 = not v3.descriptions and "" or "description";
    local v5 = not v3.specifiedByUrl and "" or "specifiedByUrl";
    local v6 = not v3.directiveIsRepeatable and "" or "isRepeatable";
    local v7 = not v3.schemaDescription and "" or v4;
    local function _(v8)
        if not v3.inputValueDeprecation then
            return "";
        else
            return v8;
        end;
    end;
    return ("\n    query IntrospectionQuery {\n      __schema {\n        %s\n        queryType { name }\n        mutationType { name }\n        subscriptionType { name }\n        types {\n          ...FullType\n        }\n        directives {\n          name\n          %s\n          %s\n          locations\n          args%s {\n            ...InputValue\n          }\n        }\n      }\n    }\n\n    fragment FullType on __Type {\n      kind\n      name\n      %s\n      %s\n      fields(includeDeprecated: true) {\n        name\n        %s\n        args%s {\n          ...InputValue\n        }\n        type {\n          ...TypeRef\n        }\n        isDeprecated\n        deprecationReason\n      }\n      inputFields%s {\n        ...InputValue\n      }\n      interfaces {\n        ...TypeRef\n      }\n      enumValues(includeDeprecated: true) {\n        name\n        %s\n        isDeprecated\n        deprecationReason\n      }\n      possibleTypes {\n        ...TypeRef\n      }\n    }\n\n    fragment InputValue on __InputValue {\n      name\n      %s\n      type { ...TypeRef }\n      defaultValue\n      %s\n      %s\n    }\n\n    fragment TypeRef on __Type {\n      kind\n      name\n      ofType {\n        kind\n        name\n        ofType {\n          kind\n          name\n          ofType {\n            kind\n            name\n            ofType {\n              kind\n              name\n              ofType {\n                kind\n                name\n                ofType {\n                  kind\n                  name\n                  ofType {\n                    kind\n                    name\n                  }\n                }\n              }\n            }\n          }\n        }\n      }\n    }\n  "):format(v7, v4, v6, not v3.inputValueDeprecation and "" or "(includeDeprecated: true)", v4, v5, v4, not v3.inputValueDeprecation and "" or "(includeDeprecated: true)", not v3.inputValueDeprecation and "" or "(includeDeprecated: true)", v4, v4, not v3.inputValueDeprecation and "" or "isDeprecated", not v3.inputValueDeprecation and "" or "deprecationReason");
end;
return {
    getIntrospectionQuery = getIntrospectionQuery
};

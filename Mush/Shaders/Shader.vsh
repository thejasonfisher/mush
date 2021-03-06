//
//  Shader.vsh
//  Mush
//
//  Created by Mike Rotondo on 12/2/13.
//  Copyright (c) 2013 Rototyping. All rights reserved.
//

attribute vec4 position;
attribute vec3 normal;
attribute vec3 color;

varying lowp vec4 colorVarying;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main()
{
    vec3 eyeNormal = normalize(normalMatrix * normal);
    vec3 lightPosition = vec3(0.0, 0.0, 1.0);
    vec4 diffuseColor = vec4(color, 1.0);
//    vec4 diffuseColor = vec4((position.x + .5) / 2.0, (position.y + 0.5) / 2.0, (position.z + 0.5) / 2.0, 1.0);
    
//    float nDotVP = max(0.0, dot(eyeNormal, normalize(lightPosition)));
    float nDotVP = abs(dot(eyeNormal, normalize(lightPosition)));
    
    colorVarying = diffuseColor * nDotVP;
    
//    colorVarying = vec4(eyeNormal, 1);
    
//    colorVarying = diffuseColor;
    
    gl_Position = modelViewProjectionMatrix * position;
}

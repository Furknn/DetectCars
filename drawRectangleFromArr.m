function scn=drawRectangleFromArr(arr,scene)
s=size(arr);
for i=1:s(1)
     
    scene=drawRectangle(scene,arr(i,1),arr(i,2),arr(i,3),arr(i,4));
   
end

scn=scene;
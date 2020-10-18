function [output1,output2]=detectCar(mynet,scene,intersectionThreshold)
scene1=scene;
s=size(scene1);
arr=[];
horan=floor((s(1)/91));
woran=floor((s(2)/120));
winc=91*floor((woran/4));
hinc=120*floor((horan/4));
ws=winc;
hs=hinc;
while ws<s(1)
    wb=ws-90;
        while hs<s(2)
            hb=hs-119;
            cropped = imresize(scene(wb:ws,hb:hs,:),[91 120]);
            c = mynet.predict(cropped);
            if (c(3)>0.98)
               arr = [arr; wb ws hb hs];
               hs=hs+44;
            end
                hs=hs+46;
        end
        hs=hinc;
    ws=ws+60;
end
newArr=arr;
Mx=1;
while(Mx==1)
    [newArr,ioMx]=mergeIntersections(newArr,intersectionThreshold);
    Mx=max(ioMx(:));
end

output2=drawRectangleFromArr(arr,scene);
output1=drawRectangleFromArr(newArr,scene);
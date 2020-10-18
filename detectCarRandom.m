function [output1,output2,count]=detectCarRandom(mynet,scene,intersectionThreshold,randIteration)
s=size(scene);
arr=[];
for i=1:randIteration
    winc=91*floor((s(1)/91)/(randi(3)+2));
    hinc=120*floor((s(2)/120)/(randi(3)+2));
    display(winc)
    display(hinc)
    wb=randi(s(1)-(winc+5));
    hb=randi(s(2)-(hinc+5));
    ws=wb+winc;
    hs=hb+hinc;
    c=mynet.predict(imresize(scene(wb:ws,hb:hs,:),[91 120]));
    if (c(3)>0.98)
        arr=[arr; wb ws hb hs];
    end
end
newArr=arr;
Mx=1;
while(Mx==1)
    [newArr,ioMx]=mergeIntersections(newArr,intersectionThreshold);
    Mx=max(ioMx(:));
end

output2=drawRectangleFromArr(arr,scene);
output1=drawRectangleFromArr(newArr,scene);
count=size(newArr(:,1));
end
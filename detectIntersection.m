function iarr=detectIntersection(arr,intersectionThreshold)
arrSize=size(arr);
intersectionMatrix=zeros(arrSize(1));
for i=1:arrSize(1)
    for j=1:arrSize(1)
        if i~=j
            iwb=arr(i,1);
            iws=arr(i,2);
            
            ihb=arr(i,3);
            ihs=arr(i,4);
            
            jwb=arr(j,1);
            jws=arr(j,2);
            
            jhb=arr(j,3);
            jhs=arr(j,4);
                       
            dx=min(iws,jws)-max(iwb,jwb);
            dy=min(ihs,jhs)-max(ihb,jhb);
            if(dx>0 &&dy >0)
                x=(iws-iwb);
                y=(ihs-ihb);
                intersectionMatrix(i,j)=(dx*dy)/(x*y);
            end
            
        end    
    end
end
iarr=round(intersectionMatrix*100)>intersectionThreshold;
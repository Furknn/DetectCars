function s=drawRectangle(scene,wb,ws,hb, hs)
scene(wb:wb+5,hb:hs,1)=255;
scene(wb:wb+5,hb:hs,2)=0;
scene(wb:wb+5,hb:hs,3)=0;

scene(ws-5:ws,hb:hs,1)=255;
scene(ws-5:ws,hb:hs,2)=0;
scene(ws-5:ws,hb:hs,3)=0;

scene(wb:ws,hb:hb+5,1)=255;
scene(wb:ws,hb:hb+5,2)=0;
scene(wb:ws,hb:hb+5,3)=0;

scene(wb:ws,hs-5:hs,1)=255;
scene(wb:ws,hs-5:hs,2)=0;
scene(wb:ws,hs-5:hs,3)=0;
s=scene;